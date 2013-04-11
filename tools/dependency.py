
import string
import re
from collections import OrderedDict
from glob import glob

def find_import(lines, fileregex='"(.*).h"'):
    deps = []
    for l in lines:
        m = re.search('^ *# *import *' + fileregex + ' *$', l)
        if m is not None:
            deps.append(m.group(1))
    return deps

nodeps = ['debug', 'runtime', 'Cocoa', 'UIKit', 'CommonCryptor', 'CommonDigest']
def find_deps(path):
    selfname = path.rsplit('/', 1)[-1].split('.')[0]
    hpath = path[:-1] + 'h'
    def get_deps(path, regex):
        lines = file(path, 'r')
        deps = find_import(lines, regex)
        for nodep in nodeps + [selfname]:
            if nodep in deps:
                del(deps[deps.index(nodep)])
        return deps
    return selfname, get_deps(path, '"(.*).h"'), get_deps(hpath, '<[^/]*/(.*).h>')

class Graph(OrderedDict):
    MAP = {}
    def __init__(self, name):
        self.name = name
        self.category = -1
        self.extension = False
        self.deplevel = 0
        self.ideps = OrderedDict()
        self.MAP[name] = self
        OrderedDict.__init__(self)

    @classmethod
    def by_name(cls, name):
        if name in cls.MAP:
            return cls.MAP[name]
        return cls(name)

    @property
    def category_name(self):
        try:
            return {
                0: 'Foundation',
                1: 'Cocoa',
                2: 'UIKit',
            }[self.category]
        except:
            pass
        return 'Unknown'

    @property
    def level(self):
        if not hasattr(self, '_level'):
            level = 20 if self.extension else 0
            deplevel = -1
            for dep in self.values():
                if dep.category != self.category: continue
                if self.extension and not dep.extension: continue
                deplevel = max(deplevel, dep.level)
            self._level = max(level, deplevel + 1)
        return self._level

    def __repr__(self):
        fore = '#import <{}Extension/{}.h>'.format(
            self.category_name,
            self.name,
        )
        fore += ' ' * (60 - len(fore))
        return fore + '// level: {} / deps({}): {} / internal({}): {}'.format(
            self.level,
            len(self),
            ', '.join([dep.name for dep in self.values()]),
            len(self.ideps),
            ', '.join([dep.name for dep in self.ideps.values()]),
        )


def make_filelist(prefix, category):
    codes = glob('../{}Extension/*.m'.format(prefix))
    for code in codes:
        myname, ideps, edeps = find_deps(code)
        mygraph = Graph.by_name(myname)
        mygraph.category = category
        if myname[:3] in ('NSA', 'UIA') and myname[3] in string.ascii_uppercase:
            mygraph.extension = True
        for dep in edeps:
            depgraph = Graph.by_name(dep)
            mygraph[dep] = depgraph
        for dep in ideps:
            depgraph = Graph.by_name(dep)
            mygraph.ideps[dep] = depgraph

if __name__ == '__main__':
    for i, prefix in enumerate(('Foundation', 'Cocoa', 'UIKit')):
        make_filelist(prefix, i)
    items = Graph.MAP.values()[:]
    items.sort(key=lambda item: ('%d%03d' % (item.category, item.level)) + item.name)
    last = items[-1]
    for item in items:
        if last.category != item.category:
            print ''
            print '#import <{name}/{name}.h>'.format(name=item.category_name)
            print '// depenency level {}'.format(item.level)
        elif last.level != item.level:
            print '// depenency level {}'.format(item.level)
        print item
        last = item
