
class ObjcProperty(object):
    __NUMBER__ = ('NSUnderlineStyle', 'BOOL', 'NSLigatureType', 'float', 'NSInteger', 'NSVerticalGlyphForm')
    __ASSIGN__ = __NUMBER__ + ('NSWritingDirectionAttributes',)
    __IMPL__ = ('writingDirection', 'writingDirectionArray')

    def __init__(self, type, name, available=None):
        self.type = type
        self.name = name
        self.available = available
        self.proptype = 'assign' if self.type in self.__ASSIGN__ else 'retain'

    @property
    def Name(self):
        return self.name[0].upper() + self.name[1:]
    @property
    def is_pointer(self):
        return self.type[-1] == '*'

    @property
    def has_number(self):
        return self.type in self.__NUMBER__

    @property
    def has_impl(self):
        return self.name in self.__IMPL__

    @property
    def available_ios(self):
        return 'NS_AVAILABLE_IOS(%s)' % self.available

    @property
    def number(self):
        if self.type == 'float':
            return 'float'
        if self.type == 'NSInteger':
            return 'integer'
        if self.type == 'BOOL':
            return 'bool'
        return 'unsignedInteger'

    @property
    def Number(self):
        n = self.number
        return n[0].upper() + n[1:]

O = ObjcProperty

props = [
    O('UIFont *', 'font'),
    O('NSParagraphStyle *', 'paragraphStyle'),
    O('UIColor *', 'foregroundColor'),
    O('UIColor *', 'backgroundColor'),
    O('NSLigatureType', 'ligature'),
    O('float', 'kern'),
    O('NSUnderlineStyle', 'strikethroughStyle'),
    O('NSUnderlineStyle', 'underlineStyle'),
    O('UIColor *', 'strokeColor'),
    O('float', 'strokeWidth'),
    O('NSShadow *', 'shadow'),
    O('NSVerticalGlyphForm', 'verticalGlyphForm', '6_0'),
]
