
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
    def available_mac(self):
        return 'NS_AVAILABLE_MAC(10_%s)' % self.available

    @property
    def available_header(self):
        return '#if __MAC_OS_X_VERSION_MAX_ALLOWED >= 10%s0' % self.available

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
    O('NSFont *', 'font'),
    O('NSParagraphStyle *', 'paragraphStyle'),
    O('NSColor *', 'foregroundColor'),
    O('NSUnderlineStyle', 'underlineStyle'),
    O('BOOL', 'superscript'),
    O('NSColor *', 'backgroundColor'),
    O('NSTextAttachment *', 'attachment'),
    O('NSLigatureType', 'ligature'),
    O('float', 'baselineOffset'),
    O('float', 'kern'),
    O('NSURL *', 'link'),
    O('float', 'strokeWidth'),
    O('NSColor *', 'strokeColor'),
    O('NSColor *', 'underlineColor'),
    O('NSUnderlineStyle', 'strikethroughStyle'),
    O('NSColor *', 'strikethroughColor'),
    O('NSShadow *', 'shadow'),
    O('float', 'obliqueness'),
    O('float', 'expansion'),
    O('NSCursor *', 'cursor'),
    O('NSString *', 'toolTip'),
    O('NSInteger', 'markedClauseSegment', '5'),
    O('NSArray *', 'writingDirectionArray', '6'),
    O('NSWritingDirectionAttributes', 'writingDirection', '6'),
    O('NSVerticalGlyphForm', 'verticalGlyphForm', '7'),
    O('NSTextAlternatives *', 'textAlternatives', '8'),
]
