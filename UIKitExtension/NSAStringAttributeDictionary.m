//
//  NSAStringAttributeDictionary.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 11. 1..
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

- (UIFont *)font {
    return [self objectForKey:NSFontAttributeName];
}

- (void)setFont:(UIFont *)font {
    [self setObject:font forKey:NSFontAttributeName];
}

- (NSParagraphStyle *)paragraphStyle {
    return [self objectForKey:NSParagraphStyleAttributeName];
}

- (void)setParagraphStyle:(NSParagraphStyle *)paragraphStyle {
    [self setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
}

- (UIColor *)foregroundColor {
    return [self objectForKey:NSForegroundColorAttributeName];
}

- (void)setForegroundColor:(UIColor *)foregroundColor {
    [self setObject:foregroundColor forKey:NSForegroundColorAttributeName];
}

- (UIColor *)backgroundColor {
    return [self objectForKey:NSBackgroundColorAttributeName];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [self setObject:backgroundColor forKey:NSBackgroundColorAttributeName];
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

- (UIColor *)strokeColor {
    return [self objectForKey:NSStrokeColorAttributeName];
}

- (void)setStrokeColor:(UIColor *)strokeColor {
    [self setObject:strokeColor forKey:NSStrokeColorAttributeName];
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

- (NSShadow *)shadow {
    return [self objectForKey:NSShadowAttributeName];
}

- (void)setShadow:(NSShadow *)shadow {
    [self setObject:shadow forKey:NSShadowAttributeName];
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

@end
