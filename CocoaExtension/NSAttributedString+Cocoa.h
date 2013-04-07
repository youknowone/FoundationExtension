//
//  NSAttributedString.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 31..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief [NSMutableAttributedString][0] attributes dictionary and data type to support it.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSMutableAttributedString_Class/Reference/Reference.html#//apple_ref/occ/cl/NSMutableAttributedString
 *  @details NSAttributedString uses dictionary to set or add attribute to string. But this interface is very human-unfriendly. This file adds new interface for attributes dictionary.
 *
 *  AppKit is required.
 */

#import <FoundationExtension/NSADictionary.h>

/*!
 *  @brief Type for NSUnderlinePattern*, NSUnderlineStyle* and NSUnderlineMask*.
 *  @see [NSUnderlineStyleAttributeName][0]
 *  @see [NSStrikethroughStyleAttributeName][0]
 *  @see [NSUnderlinePattern*][2]
 *  @see [NSUnderlineStyle*][3]
 *  @see [NSUnderlineMask][4]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSAttributedString_AppKitAdditions/Reference/Reference.html#//apple_ref/c/data/NSUnderlineStyleAttributeName
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSAttributedString_AppKitAdditions/Reference/Reference.html#//apple_ref/c/data/NSStrikethroughStyleAttributeName
 *      [2]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSAttributedString_AppKitAdditions/Reference/Reference.html#//apple_ref/doc/constant_group/Underlining_Patterns
 *      [3]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSAttributedString_AppKitAdditions/Reference/Reference.html#//apple_ref/doc/constant_group/Underlining_Styles
 *      [4]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSAttributedString_AppKitAdditions/Reference/Reference.html#//apple_ref/doc/constant_group/Underline_Masks
 */
typedef NSUInteger NSUnderlineStyle;

/*!
 *  @brief Values for ligature style.
 *  @see [NSLigatureAttributeName][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSAttributedString_AppKitAdditions/Reference/Reference.html#//apple_ref/doc/c_ref/NSLigatureAttributeName
 */
enum {
    NSLigatureNo = 0,
    NSLigatureStandard = 1, // default
    NSLigatureAll = 2,
};
/*!
 *  @brief Type for ligature style.
 *  @see [NSLigatureAttributeName][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSAttributedString_AppKitAdditions/Reference/Reference.html#//apple_ref/doc/c_ref/NSLigatureAttributeName
 */
typedef NSUInteger NSLigatureType;

/*!
 *  @brief Values for writing direction.
 *  @details Use bitmask to set array in a value. Masked bit order is the value set to array.
 *  @see [NSWritingDirectionAttributeName][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSAttributedString_AppKitAdditions/Reference/Reference.html#//apple_ref/doc/c_ref/NSWritingDirectionAttributeName
 */
enum {
    NSWritingDirectionAttributeLRE = 1 << (NSWritingDirectionLeftToRight | NSTextWritingDirectionEmbedding),
    NSWritingDirectionAttributeRLE = 1 << (NSWritingDirectionRightToLeft | NSTextWritingDirectionEmbedding),
    NSWritingDirectionAttributeLRO = 1 << (NSWritingDirectionLeftToRight | NSTextWritingDirectionOverride),
    NSWritingDirectionAttributeRLO = 1 << (NSWritingDirectionRightToLeft | NSTextWritingDirectionOverride),
};
/*!
 *  @brief Type for writing direction.
 *  @see [NSWritingDirectionAttributeName][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSAttributedString_AppKitAdditions/Reference/Reference.html#//apple_ref/doc/c_ref/NSWritingDirectionAttributeName
 */
typedef NSUInteger NSWritingDirectionAttributes;

/*!
 *  @brief Values for vertical glyph form.
 *  @see [NSVerticalGlyphFormAttributeName][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSAttributedString_AppKitAdditions/Reference/Reference.html#//apple_ref/doc/c_ref/NSVerticalGlyphFormAttributeName
 */
enum {
    NSVerticalGlyphFormHorizontal = 0,
    NSVerticalGlyphFormVertical = 1,
};
/*!
 *  @brief Type for vertical glyph form.
 *  @see [NSVerticalGlyphFormAttributeName][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSAttributedString_AppKitAdditions/Reference/Reference.html#//apple_ref/doc/c_ref/NSVerticalGlyphFormAttributeName
 */
typedef NSUInteger NSVerticalGlyphForm;


/*!
 *  @brief Dictionary with easy attribute interface.
 */
@interface NSMutableAttributedString (AttributeProperties)

/*!
 *  @brief Adds writingDirection attribute value as array to the characters in the specified range.
 */
- (void)addAttributeWritingDirectionArray:(NSArray *)writingDirectionArray range:(NSRange)range NS_AVAILABLE_MAC(10_6);


/*!
 *  @brief Adds font attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeFont:(NSFont *)font range:(NSRange)range;
/*!
 *  @brief Removes font attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeFontFromRange:(NSRange)range;

/*!
 *  @brief Adds paragraphStyle attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeParagraphStyle:(NSParagraphStyle *)paragraphStyle range:(NSRange)range;
/*!
 *  @brief Removes paragraphStyle attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeParagraphStyleFromRange:(NSRange)range;

/*!
 *  @brief Adds foregroundColor attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeForegroundColor:(NSColor *)foregroundColor range:(NSRange)range;
/*!
 *  @brief Removes foregroundColor attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeForegroundColorFromRange:(NSRange)range;

/*!
 *  @brief Adds underlineStyle attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeUnderlineStyle:(NSUnderlineStyle)underlineStyle range:(NSRange)range;
/*!
 *  @brief Removes underlineStyle attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeUnderlineStyleFromRange:(NSRange)range;

/*!
 *  @brief Adds superscript attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeSuperscript:(BOOL)superscript range:(NSRange)range;
/*!
 *  @brief Removes superscript attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeSuperscriptFromRange:(NSRange)range;

/*!
 *  @brief Adds backgroundColor attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeBackgroundColor:(NSColor *)backgroundColor range:(NSRange)range;
/*!
 *  @brief Removes backgroundColor attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeBackgroundColorFromRange:(NSRange)range;

/*!
 *  @brief Adds attachment attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeAttachment:(NSTextAttachment *)attachment range:(NSRange)range;
/*!
 *  @brief Removes attachment attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeAttachmentFromRange:(NSRange)range;

/*!
 *  @brief Adds ligature attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeLigature:(NSLigatureType)ligature range:(NSRange)range;
/*!
 *  @brief Removes ligature attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeLigatureFromRange:(NSRange)range;

/*!
 *  @brief Adds baselineOffset attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeBaselineOffset:(float)baselineOffset range:(NSRange)range;
/*!
 *  @brief Removes baselineOffset attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeBaselineOffsetFromRange:(NSRange)range;

/*!
 *  @brief Adds kern attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeKern:(float)kern range:(NSRange)range;
/*!
 *  @brief Removes kern attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeKernFromRange:(NSRange)range;

/*!
 *  @brief Adds link attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeLink:(NSURL *)link range:(NSRange)range;
/*!
 *  @brief Removes link attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeLinkFromRange:(NSRange)range;

/*!
 *  @brief Adds strokeWidth attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeStrokeWidth:(float)strokeWidth range:(NSRange)range;
/*!
 *  @brief Removes strokeWidth attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeStrokeWidthFromRange:(NSRange)range;

/*!
 *  @brief Adds strokeColor attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeStrokeColor:(NSColor *)strokeColor range:(NSRange)range;
/*!
 *  @brief Removes strokeColor attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeStrokeColorFromRange:(NSRange)range;

/*!
 *  @brief Adds underlineColor attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeUnderlineColor:(NSColor *)underlineColor range:(NSRange)range;
/*!
 *  @brief Removes underlineColor attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeUnderlineColorFromRange:(NSRange)range;

/*!
 *  @brief Adds strikethroughStyle attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeStrikethroughStyle:(NSUnderlineStyle)strikethroughStyle range:(NSRange)range;
/*!
 *  @brief Removes strikethroughStyle attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeStrikethroughStyleFromRange:(NSRange)range;

/*!
 *  @brief Adds strikethroughColor attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeStrikethroughColor:(NSColor *)strikethroughColor range:(NSRange)range;
/*!
 *  @brief Removes strikethroughColor attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeStrikethroughColorFromRange:(NSRange)range;

/*!
 *  @brief Adds shadow attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeShadow:(NSShadow *)shadow range:(NSRange)range;
/*!
 *  @brief Removes shadow attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeShadowFromRange:(NSRange)range;

/*!
 *  @brief Adds obliqueness attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeObliqueness:(float)obliqueness range:(NSRange)range;
/*!
 *  @brief Removes obliqueness attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeObliquenessFromRange:(NSRange)range;

/*!
 *  @brief Adds expansion attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeExpansion:(float)expansion range:(NSRange)range;
/*!
 *  @brief Removes expansion attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeExpansionFromRange:(NSRange)range;

/*!
 *  @brief Adds cursor attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeCursor:(NSCursor *)cursor range:(NSRange)range;
/*!
 *  @brief Removes cursor attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeCursorFromRange:(NSRange)range;

/*!
 *  @brief Adds toolTip attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeToolTip:(NSString *)toolTip range:(NSRange)range;
/*!
 *  @brief Removes toolTip attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeToolTipFromRange:(NSRange)range;

#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1050
/*!
 *  @brief Adds markedClauseSegment attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeMarkedClauseSegment:(NSInteger)markedClauseSegment range:(NSRange)range NS_AVAILABLE_MAC(10_5);
/*!
 *  @brief Removes markedClauseSegment attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeMarkedClauseSegmentFromRange:(NSRange)range NS_AVAILABLE_MAC(10_5);
#endif
#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1060
/*!
 *  @brief Adds writingDirection attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeWritingDirection:(NSWritingDirectionAttributes)writingDirection range:(NSRange)range NS_AVAILABLE_MAC(10_6);
/*!
 *  @brief Removes writingDirection attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeWritingDirectionFromRange:(NSRange)range NS_AVAILABLE_MAC(10_6);
#endif
#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1070
/*!
 *  @brief Adds verticalGlyphForm attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeVerticalGlyphForm:(NSVerticalGlyphForm)verticalGlyphForm range:(NSRange)range NS_AVAILABLE_MAC(10_7);
/*!
 *  @brief Removes verticalGlyphForm attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeVerticalGlyphFormFromRange:(NSRange)range NS_AVAILABLE_MAC(10_7);
#endif
#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1080
/*!
 *  @brief Adds textAlternatives attribute value to the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)addAttributeTextAlternatives:(NSTextAlternatives *)textAlternatives range:(NSRange)range NS_AVAILABLE_MAC(10_8);
/*!
 *  @brief Removes textAlternatives attribute from the characters in the specified range.
 *  @details Generated by NSAttributedStringCategoryInterface.py
 */
- (void)removeAttributeTextAlternativesFromRange:(NSRange)range NS_AVAILABLE_MAC(10_8);
#endif

@end


/*!
 *  @brief [NSMutableAttributedString][0] attributes dictionary.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSMutableAttributedString_Class/Reference/Reference.html#//apple_ref/occ/cl/NSMutableAttributedString
 *  @details This dictionary is designed to used for [NSMutableAttributeString setAttributes:range:][1] and [addAttributes:range:][2].
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSMutableAttributedString_Class/Reference/Reference.html#//apple_ref/occ/instm/NSMutableAttributedString/setAttributes:range:
 *      [2]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSMutableAttributedString_Class/Reference/Reference.html#//apple_ref/occ/instm/NSMutableAttributedString/addAttributes:range:
 */
@interface NSAttributedStringAttributeDictionary: NSAMutableDictionary

/*!
 *  @brief Set or get font attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSFont *font;
/*!
 *  @brief Set or get paragraphStyle attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSParagraphStyle *paragraphStyle;
/*!
 *  @brief Set or get foregroundColor attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSColor *foregroundColor;
/*!
 *  @brief Set or get underlineStyle attribute as NSNumber form.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSNumber *underlineStyleNumber;
/*!
 *  @brief Set or get underlineStyle attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(assign) NSUnderlineStyle underlineStyle;
/*!
 *  @brief Set or get superscript attribute as NSNumber form.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSNumber *superscriptNumber;
/*!
 *  @brief Set or get superscript attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(assign) BOOL superscript;
/*!
 *  @brief Set or get backgroundColor attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSColor *backgroundColor;
/*!
 *  @brief Set or get attachment attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSTextAttachment *attachment;
/*!
 *  @brief Set or get ligature attribute as NSNumber form.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSNumber *ligatureNumber;
/*!
 *  @brief Set or get ligature attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(assign) NSLigatureType ligature;
/*!
 *  @brief Set or get baselineOffset attribute as NSNumber form.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSNumber *baselineOffsetNumber;
/*!
 *  @brief Set or get baselineOffset attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(assign) float baselineOffset;
/*!
 *  @brief Set or get kern attribute as NSNumber form.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSNumber *kernNumber;
/*!
 *  @brief Set or get kern attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(assign) float kern;
/*!
 *  @brief Set or get link attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSURL *link;
/*!
 *  @brief Set or get strokeWidth attribute as NSNumber form.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSNumber *strokeWidthNumber;
/*!
 *  @brief Set or get strokeWidth attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(assign) float strokeWidth;
/*!
 *  @brief Set or get strokeColor attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSColor *strokeColor;
/*!
 *  @brief Set or get underlineColor attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSColor *underlineColor;
/*!
 *  @brief Set or get strikethroughStyle attribute as NSNumber form.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSNumber *strikethroughStyleNumber;
/*!
 *  @brief Set or get strikethroughStyle attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(assign) NSUnderlineStyle strikethroughStyle;
/*!
 *  @brief Set or get strikethroughColor attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSColor *strikethroughColor;
/*!
 *  @brief Set or get shadow attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSShadow *shadow;
/*!
 *  @brief Set or get obliqueness attribute as NSNumber form.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSNumber *obliquenessNumber;
/*!
 *  @brief Set or get obliqueness attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(assign) float obliqueness;
/*!
 *  @brief Set or get expansion attribute as NSNumber form.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSNumber *expansionNumber;
/*!
 *  @brief Set or get expansion attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(assign) float expansion;
/*!
 *  @brief Set or get cursor attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSCursor *cursor;
/*!
 *  @brief Set or get toolTip attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSString *toolTip;
#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1050
/*!
 *  @brief Set or get markedClauseSegment attribute as NSNumber form.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSNumber *markedClauseSegmentNumber NS_AVAILABLE_MAC(10_5);
#endif

#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1050
/*!
 *  @brief Set or get markedClauseSegment attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(assign) NSInteger markedClauseSegment NS_AVAILABLE_MAC(10_5);
#endif
#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1060
/*!
 *  @brief Set or get writingDirectionArray attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSArray *writingDirectionArray NS_AVAILABLE_MAC(10_6);
#endif
#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1060
/*!
 *  @brief Set or get writingDirection attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(assign) NSWritingDirectionAttributes writingDirection NS_AVAILABLE_MAC(10_6);
#endif
#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1070
/*!
 *  @brief Set or get verticalGlyphForm attribute as NSNumber form.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSNumber *verticalGlyphFormNumber NS_AVAILABLE_MAC(10_7);
#endif

#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1070
/*!
 *  @brief Set or get verticalGlyphForm attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(assign) NSVerticalGlyphForm verticalGlyphForm NS_AVAILABLE_MAC(10_7);
#endif
#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1080
/*!
 *  @brief Set or get textAlternatives attribute.
 *  @details Generated by script NSAttributedStringDictionaryInterface.py
 */
@property(retain) NSTextAlternatives *textAlternatives NS_AVAILABLE_MAC(10_8);
#endif
@end

