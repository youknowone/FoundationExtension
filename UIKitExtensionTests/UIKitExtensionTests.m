//
//  UIKitExtensionTests.m
//  UIKitExtensionTests
//
//  Created by Jeong YunWon on 11. 3. 21..
//  Copyright 2011 youknowone.org All rights reserved.
//

#import "UIKitExtensionTests.h"

#import <UIKitExtension/UIKitExtension.h>

@implementation UIKitExtensionTests

- (void)setUp
{
    [super setUp];

    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.

    [super tearDown];
}

- (void)testUIColor {
    STAssertNotNil([UIColor self], @""); // test initialize
}

- (void)testStringAttribute
{
    NSAStringAttributeDictionary *dict = [NSAStringAttributeDictionary dictionary];
    // defaults
    STAssertEquals(dict.ligature, (NSUInteger)NSALigatureStandard, @"");

    #define TEST_ITEM(PROP, VALUE) \
        dict.PROP = VALUE;  \
        STAssertEqualObjects(dict.PROP, VALUE, @""); \
        dict.PROP = nil;    \
        STAssertNil(dict.PROP, @"");
    #define TEST_ITEM_VALUE(PROP, VALUE) \
        dict.PROP = VALUE;  \
        STAssertEquals(dict.PROP, VALUE, @"");
    
    TEST_ITEM(font, [UIFont fontWithName:@"Helvetica" size:10.0]);
    TEST_ITEM(paragraphStyle, [NSParagraphStyle defaultParagraphStyle]);
    TEST_ITEM(foregroundColor, [UIColor colorWithRed:0.2f green:0.4f blue:0.6f alpha:1.0f]);
    TEST_ITEM(underlineStyleNumber, [NSNumber numberWithUnsignedInteger:NSUnderlineStyleSingle]);
    TEST_ITEM_VALUE(underlineStyle, (NSUInteger)NSUnderlineStyleSingle);
    TEST_ITEM(backgroundColor, [UIColor colorWithRed:0.2f green:0.4f blue:0.6f alpha:1.0f]);
    TEST_ITEM(ligatureNumber, [NSNumber numberWithUnsignedInteger:NSALigatureNo]);
    TEST_ITEM_VALUE(ligature, (NSUInteger)NSALigatureStandard);
    TEST_ITEM(kernNumber, [NSNumber numberWithFloat:0.2f]);
    TEST_ITEM_VALUE(kern, 0.4f);
    TEST_ITEM(strokeWidthNumber, [NSNumber numberWithFloat:0.2f]);
    TEST_ITEM_VALUE(strokeWidth, 0.4f);
    TEST_ITEM(strokeColor, [UIColor colorWithRed:0.2f green:0.4f blue:0.6f alpha:1.0f]);
    TEST_ITEM(strikethroughStyleNumber, [NSNumber numberWithUnsignedInteger:NSUnderlineStyleSingle]);
    TEST_ITEM_VALUE(strikethroughStyle, (NSUInteger)NSUnderlineStyleSingle);
    TEST_ITEM(shadow, [[[NSShadow alloc] init] autorelease]);
    TEST_ITEM(verticalGlyphFormNumber, [NSNumber numberWithUnsignedInteger:NSAVerticalGlyphFormHorizontal]);
    TEST_ITEM_VALUE(verticalGlyphForm, (NSUInteger)NSAVerticalGlyphFormHorizontal);

    #undef TEST_ITEM
    #undef TEST_ITEM_VALUE
}

@end
