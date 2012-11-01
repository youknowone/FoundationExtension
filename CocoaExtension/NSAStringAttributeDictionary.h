//
//  NSAStringAttributeDictionary.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 31..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import <FoundationExtension/FoundationExtension.h>

//  AppKit required

typedef NSUInteger NSAUnderlineStyle;

enum {
    NSALigatureStandard = 0,
    NSALigatureNo = 1, // default
    NSALigatureAll = 2,
};
typedef NSUInteger NSALigatureType;

enum {
    NSAWritingDirectionAttributeLRE = 1 << (NSWritingDirectionLeftToRight | NSTextWritingDirectionEmbedding),
    NSAWritingDirectionAttributeRLE = 1 << (NSWritingDirectionRightToLeft | NSTextWritingDirectionEmbedding),
    NSAWritingDirectionAttributeLRO = 1 << (NSWritingDirectionLeftToRight | NSTextWritingDirectionOverride),
    NSAWritingDirectionAttributeRLO = 1 << (NSWritingDirectionRightToLeft | NSTextWritingDirectionOverride),
};
typedef NSUInteger NSAWritingDirectionAttributes;

enum {
    NSAVerticalGlyphFormHorizontal = 0,
    NSAVerticalGlyphFormVertical = 1,
};
typedef NSUInteger NSAVerticalGlyphForm;


@interface NSAStringAttributeDictionary: NSAMutableDictionary

@property(retain) NSFont *font;
@property(retain) NSParagraphStyle *paragraphStyle;
@property(retain) NSColor *foregroundColor;
@property(retain) NSNumber *underlineStyleNumber;
@property(assign) NSAUnderlineStyle underlineStyle;
@property(retain) NSNumber *superscriptNumber;
@property(assign) BOOL superscript;
@property(retain) NSColor *backgroundColor;
@property(retain) NSTextAttachment *attachment;
@property(retain) NSNumber *ligatureNumber;
@property(assign) NSALigatureType ligature;
@property(retain) NSNumber *baselineOffsetNumber;
@property(assign) float baselineOffset;
@property(retain) NSNumber *kernNumber;
@property(assign) float kern;
@property(retain) NSURL *link;
@property(retain) NSNumber *strokeWidthNumber;
@property(assign) float strokeWidth;
@property(retain) NSColor *strokeColor;
@property(retain) NSColor *underlineColor;
@property(retain) NSNumber *strikethroughStyleNumber;
@property(assign) NSAUnderlineStyle strikethroughStyle;
@property(retain) NSColor *strikethroughColor;
@property(retain) NSShadow *shadow;
@property(retain) NSNumber *obliquenessNumber;
@property(assign) float obliqueness;
@property(retain) NSNumber *expansionNumber;
@property(assign) float expansion;
@property(retain) NSCursor *cursor;
@property(retain) NSString *tooltip;
@property(retain) NSNumber *markedClauseSegmentNumber NS_AVAILABLE_MAC(10_5);
@property(assign) NSInteger markedClauseSegment NS_AVAILABLE_MAC(10_5);
@property(retain) NSArray *writingDirectionArray NS_AVAILABLE_MAC(10_6);
@property(assign) NSAWritingDirectionAttributes writingDirection NS_AVAILABLE_MAC(10_6);
@property(retain) NSNumber *verticalGlyphFormNumber  NS_AVAILABLE_MAC(10_7);
@property(assign) NSAVerticalGlyphForm verticalGlyphForm  NS_AVAILABLE_MAC(10_7);
@property(retain) NSTextAlternatives *textAlternatives NS_AVAILABLE_MAC(10_8);

@end
