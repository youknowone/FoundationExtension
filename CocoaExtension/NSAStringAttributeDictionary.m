//
//  NSAStringAttributeDictionary.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 31..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import "NSAStringAttributeDictionary.h"

@implementation NSAStringAttributeDictionary

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (anObject == nil) {
        [super removeObjectForKey:aKey];
    } else {
        [super setObject:anObject forKey:aKey];
    }
}

- (NSFont *)font {
    return [self objectForKey:NSFontAttributeName];
}

- (void)setFont:(NSFont *)font {
    [self setObject:font forKey:NSFontAttributeName];
}

- (NSParagraphStyle *)paragraphStyle {
    return [self objectForKey:NSParagraphStyleAttributeName];
}

- (void)setParagraphStyle:(NSParagraphStyle *)paragraphStyle {
    [self setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
}

- (NSColor *)foregroundColor {
    return [self objectForKey:NSForegroundColorAttributeName];
}

- (void)setForegroundColor:(NSColor *)foregroundColor {
    [self setObject:foregroundColor forKey:NSForegroundColorAttributeName];
}

- (NSNumber *)underlineStyleNumber {
    return [self objectForKey:NSUnderlineStyleAttributeName];
}

- (void)setUnderlineStyleNumber:(NSNumber *)underlineStyleNumber {
    [self setObject:underlineStyleNumber forKey:NSUnderlineStyleAttributeName];
}

- (NSAUnderlineStyle)underlineStyle {
    return [self.underlineStyleNumber unsignedIntegerValue];
}

- (void)setUnderlineStyle:(NSAUnderlineStyle)underlineStyle {
    self.underlineStyleNumber = [NSNumber numberWithUnsignedInteger:underlineStyle];
}

- (NSNumber *)superscriptNumber {
    return [self objectForKey:NSSuperscriptAttributeName];
}

- (void)setSuperscriptNumber:(NSNumber *)superscriptNumber {
    [self setObject:superscriptNumber forKey:NSSuperscriptAttributeName];
}

- (BOOL)superscript {
    return [self.superscriptNumber boolValue];
}

- (void)setSuperscript:(BOOL)superscript {
    self.superscriptNumber = [NSNumber numberWithBool:superscript];
}

- (NSColor *)backgroundColor {
    return [self objectForKey:NSBackgroundColorAttributeName];
}

- (void)setBackgroundColor:(NSColor *)backgroundColor {
    [self setObject:backgroundColor forKey:NSBackgroundColorAttributeName];
}

- (NSTextAttachment *)attachment {
    return [self objectForKey:NSAttachmentAttributeName];
}

- (void)setAttachment:(NSTextAttachment *)attachment {
    [self setObject:attachment forKey:NSAttachmentAttributeName];
}

- (NSNumber *)ligatureNumber {
    return [self objectForKey:NSLigatureAttributeName];
}

- (void)setLigatureNumber:(NSNumber *)ligatureNumber {
    [self setObject:ligatureNumber forKey:NSLigatureAttributeName];
}

- (NSALigatureType)ligature {
    return self.ligatureNumber ? [self.ligatureNumber unsignedIntegerValue] : NSALigatureStandard;
}

- (void)setLigature:(NSALigatureType)ligature {
    self.ligatureNumber = [NSNumber numberWithUnsignedLong:ligature];
}

- (NSNumber *)baselineOffsetNumber {
    return [self objectForKey:NSBaselineOffsetAttributeName];
}

- (void)setBaselineOffsetNumber:(NSNumber *)baselineOffsetNumber {
    [self setObject:baselineOffsetNumber forKey:NSBaselineOffsetAttributeName];
}

- (float)baselineOffset {
    return [self.baselineOffsetNumber floatValue];
}

- (void)setBaselineOffset:(float)baselineOffset {
    self.baselineOffsetNumber = [NSNumber numberWithFloat:baselineOffset];
}

- (NSNumber *)kernNumber {
    return [self objectForKey:NSKernAttributeName];
}

- (void)setKernNumber:(NSNumber *)kernNumber {
    [self setObject:kernNumber forKey:NSKernAttributeName];
}

- (float)kern {
    return [self.kernNumber floatValue];
}

- (void)setKern:(float)kern {
    self.kernNumber = [NSNumber numberWithFloat:kern];
}

- (NSURL *)link {
    return [self objectForKey:NSLinkAttributeName];
}

- (void)setLink:(NSURL *)link {
    [self setObject:link forKey:NSLinkAttributeName];
}

- (NSNumber *)strokeWidthNumber {
    return [self objectForKey:NSStrokeWidthAttributeName];
}

- (void)setStrokeWidthNumber:(NSNumber *)strokeWidthNumber {
    [self setObject:strokeWidthNumber forKey:NSStrokeWidthAttributeName];
}

- (float)strokeWidth {
    return [self.strokeWidthNumber floatValue];
}

- (void)setStrokeWidth:(float)strokeWidth {
    self.strokeWidthNumber = [NSNumber numberWithFloat:strokeWidth];
}

- (NSColor *)strokeColor {
    return [self objectForKey:NSStrokeColorAttributeName];
}

- (void)setStrokeColor:(NSColor *)strokeColor {
    [self setObject:strokeColor forKey:NSStrokeColorAttributeName];
}

- (NSColor *)underlineColor {
    return [self objectForKey:NSUnderlineColorAttributeName];
}

- (void)setUnderlineColor:(NSColor *)underlineColor {
    [self setObject:underlineColor forKey:NSUnderlineColorAttributeName];
}

- (NSNumber *)strikethroughStyleNumber {
    return [self objectForKey:NSStrikethroughStyleAttributeName];
}

- (void)setStrikethroughStyleNumber:(NSNumber *)strikethroughStyleNumber {
    [self setObject:strikethroughStyleNumber forKey:NSStrikethroughStyleAttributeName];
}

- (NSAUnderlineStyle)strikethroughStyle {
    return [self.strikethroughStyleNumber unsignedIntegerValue];
}

- (void)setStrikethroughStyle:(NSAUnderlineStyle)strikethroughStyle {
    self.strikethroughStyleNumber = [NSNumber numberWithUnsignedInteger:strikethroughStyle];
}

- (NSColor *)strikethroughColor {
    return [self objectForKey:NSStrikethroughColorAttributeName];
}

- (void)setStrikethroughColor:(NSColor *)strikethroughColor {
    [self setObject:strikethroughColor forKey:NSStrikethroughColorAttributeName];
}

- (NSShadow *)shadow {
    return [self objectForKey:NSShadowAttributeName];
}

- (void)setShadow:(NSShadow *)shadow {
    [self setObject:shadow forKey:NSShadowAttributeName];
}

- (NSNumber *)obliquenessNumber {
    return [self objectForKey:NSObliquenessAttributeName];
}

- (void)setObliquenessNumber:(NSNumber *)obliquenessNumber {
    [self setObject:obliquenessNumber forKey:NSObliquenessAttributeName];
}

- (float)obliqueness {
    return [self.obliquenessNumber floatValue];
}

- (void)setObliqueness:(float)obliqueness {
    self.obliquenessNumber = [NSNumber numberWithFloat:obliqueness];
}

- (NSNumber *)expansionNumber {
    return [self objectForKey:NSExpansionAttributeName];
}

- (void)setExpansionNumber:(NSNumber *)expansionNumber {
    [self setObject:expansionNumber forKey:NSExpansionAttributeName];
}

- (float)expansion {
    return [self.expansionNumber floatValue];
}

- (void)setExpansion:(float)expansion {
    self.expansionNumber = [NSNumber numberWithFloat:expansion];
}

- (NSCursor *)cursor {
    return [self objectForKey:NSCursorAttributeName];
}

- (void)setCursor:(NSCursor *)cursor {
    [self setObject:cursor forKey:NSCursorAttributeName];
}

- (NSString *)tooltip {
    return [self objectForKey:NSToolTipAttributeName];
}

- (void)setTooltip:(NSString *)tooltip {
    [self setObject:tooltip forKey:NSToolTipAttributeName];
}

- (NSNumber *)markedClauseSegmentNumber {
    return [self objectForKey:NSMarkedClauseSegmentAttributeName];
}

- (void)setMarkedClauseSegmentNumber:(NSNumber *)markedClauseSegmentNumber {
    [self setObject:markedClauseSegmentNumber forKey:NSMarkedClauseSegmentAttributeName];
}

- (NSInteger)markedClauseSegment {
    return [self.markedClauseSegmentNumber integerValue];
}

- (void)setMarkedClauseSegment:(NSInteger)markedClauseSegment {
    self.markedClauseSegmentNumber = [NSNumber numberWithInteger:markedClauseSegment];
}

- (NSArray *)writingDirectionArray {
    return [self objectForKey:NSWritingDirectionAttributeName];
}

- (void)setWritingDirectionArray:(NSArray *)writingDirectionArray {
    [self setObject:writingDirectionArray forKey:NSWritingDirectionAttributeName];
}

- (NSAWritingDirectionAttributes)writingDirection {
    NSArray *array = self.writingDirectionArray;
    NSAWritingDirectionAttributes attr = 0;
    for (NSNumber *value in array) {
        attr |= 1 << [value unsignedIntegerValue];
    }
    return attr;
}

-(void)setWritingDirection:(NSAWritingDirectionAttributes)writingDirection {
    NSMutableArray *array = [NSMutableArray array];
    if (writingDirection & NSAWritingDirectionAttributeLRE) {
        const NSAWritingDirectionAttributes LRE = NSWritingDirectionLeftToRight | NSTextWritingDirectionEmbedding;
        dassert(LRE == 0);
        [array addObject:[NSNumber numberWithUnsignedInteger:LRE]];
    }
    if (writingDirection & NSAWritingDirectionAttributeRLE) {
        const NSAWritingDirectionAttributes RLE = NSWritingDirectionRightToLeft | NSTextWritingDirectionEmbedding;
        dassert(RLE == 1);
        [array addObject:[NSNumber numberWithUnsignedInteger:RLE]];
    }
    if (writingDirection & NSAWritingDirectionAttributeLRO) {
        const NSAWritingDirectionAttributes LRO = NSWritingDirectionLeftToRight | NSTextWritingDirectionOverride;
        dassert(LRO == 2);
        [array addObject:[NSNumber numberWithUnsignedInteger:LRO]];
    }
    if (writingDirection & NSAWritingDirectionAttributeRLO) {
        const NSAWritingDirectionAttributes RLO = NSWritingDirectionRightToLeft | NSTextWritingDirectionOverride;
        dassert(RLO == 3);
        [array addObject:[NSNumber numberWithUnsignedInteger:RLO]];
    }
    self.writingDirectionArray = array;
}

- (NSNumber *)verticalGlyphFormNumber {
    return [self objectForKey:NSVerticalGlyphFormAttributeName];
}

- (void)setVerticalGlyphFormNumber:(NSNumber *)verticalGlyphFormNumber {
    [self setObject:verticalGlyphFormNumber forKey:NSVerticalGlyphFormAttributeName];
}

- (NSAVerticalGlyphForm)verticalGlyphForm {
    return [self.verticalGlyphFormNumber unsignedIntegerValue];
}

- (void)setVerticalGlyphForm:(NSAVerticalGlyphForm)verticalGlyphForm {
    self.verticalGlyphFormNumber = [NSNumber numberWithUnsignedInteger:verticalGlyphForm];
}

- (NSTextAlternatives *)textAlternatives {
    return [self objectForKey:NSTextAlternativesAttributeName];
}

- (void)setTextAlternatives:(NSTextAlternatives *)textAlternatives {
    [self setObject:textAlternatives forKey:NSTextAlternativesAttributeName];
}

@end
