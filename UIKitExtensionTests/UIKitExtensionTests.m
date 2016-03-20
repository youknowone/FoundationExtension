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
    XCTAssertNotNil([UIColor self], @""); // test initialize
}

- (void)testMACAddress {
    NSString *mac = [[UIDevice currentDevice] MACAddress]; // any test without ifconfig?
    XCTAssertNotNil(mac, @"");
}

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 60000
- (void)testStringAttribute
{
    NSAttributedStringAttributeDictionary *dict = [NSAttributedStringAttributeDictionary dictionary];
    // defaults
    XCTAssertEqual(dict.ligature, (NSUInteger)NSLigatureStandard, @"");

    #define TEST_ITEM(PROP, VALUE) \
        dict.PROP = VALUE;  \
        XCTAssertEqualObjects(dict.PROP, VALUE, @""); \
        dict.PROP = nil;    \
        XCTAssertNil(dict.PROP, @"");
    #define TEST_ITEM_VALUE(PROP, VALUE) \
        dict.PROP = VALUE;  \
        XCTAssertEqual(dict.PROP, VALUE, @"");

//    TEST_ITEM(font, [UIFont systemFontOfSize:10.0]);
    TEST_ITEM(paragraphStyle, [NSParagraphStyle defaultParagraphStyle]);
    TEST_ITEM(foregroundColor, [UIColor colorWithRed:0.2f green:0.4f blue:0.6f alpha:1.0f]);
    TEST_ITEM(underlineStyleNumber, @(NSUnderlineStyleSingle));
    TEST_ITEM_VALUE(underlineStyle, (NSUnderlineStyle)NSUnderlineStyleSingle);
    TEST_ITEM(backgroundColor, [UIColor colorWithRed:0.2f green:0.4f blue:0.6f alpha:1.0f]);
    TEST_ITEM(ligatureNumber, @(NSLigatureNo));
    TEST_ITEM_VALUE(ligature, (NSUInteger)NSLigatureStandard);
    TEST_ITEM(kernNumber, @0.2f);
    TEST_ITEM_VALUE(kern, 0.4f);
    TEST_ITEM(strokeWidthNumber, @0.2f);
    TEST_ITEM_VALUE(strokeWidth, 0.4f);
    TEST_ITEM(strokeColor, [UIColor colorWithRed:0.2f green:0.4f blue:0.6f alpha:1.0f]);
    TEST_ITEM(strikethroughStyleNumber, @(NSUnderlineStyleSingle));
    TEST_ITEM_VALUE(strikethroughStyle, (NSUnderlineStyle)NSUnderlineStyleSingle);
    TEST_ITEM(shadow, [[NSShadow alloc] init]);
    TEST_ITEM(verticalGlyphFormNumber, @(NSVerticalGlyphFormHorizontal));
    TEST_ITEM_VALUE(verticalGlyphForm, (NSUInteger)NSVerticalGlyphFormHorizontal);

    #undef TEST_ITEM
    #undef TEST_ITEM_VALUE
}
#endif

- (void)testColor {
    UIColor *color1 = [UIColor colorWithRed:0.7f green:0.5f blue:0.3f alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:0.7f green:0.5f blue:0.3f alpha:1.0];

    XCTAssertEqualObjects(color1, color2, @"");

    UIColor *color3 = [color1 colorWithAlpha:0.5f];
    XCTAssertEqual(color3.components.red, color1.components.red, @"");
    XCTAssertEqual(color3.components.green, color1.components.green, @"");
    XCTAssertEqual(color3.components.blue, color1.components.blue, @"");
    XCTAssertEqual(color3.components.alpha, 0.5f, @"");
}

- (void)testColorMix {
    UIColor *color1 = [UIColor colorWithRed:0.25 green:0.5 blue:0.75 alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];

    UIColor *color = [color1 mixedColorWithColor:color2 ratio:0.25];
    XCTAssertEqual(color.components.red, 0.75f + 0.25f * 0.25f, @"");
    XCTAssertEqual(color.components.green, 0.75f + 0.5f * 0.25f, @"");
    XCTAssertEqual(color.components.blue, 0.75f + 0.75f * 0.25f, @"");
    XCTAssertEqual(color.components.alpha, 1.0f, @"");

    UIColor *color3 = [UIColor colorWithWhite:0.125 alpha:0.25];
    UIColor *color4 = [UIColor colorWithWhite:0.625 alpha:0.75];
    color = [color3 mixedColorWithColor:color4 ratio:0.75];

    XCTAssertEqual(color.components.red, 0.375f, @"");
    XCTAssertEqual(color.components.alpha, 0.375f, @"");
}

- (id)valueMethod {
    return self;
}

- (void)testClassMethodPatch {
    SEL selector = NSSelectorFromString(@"classValueMethod");
    [self.class addClassMethodForSelector:selector fromMethod:[self.class methodObjectForSelector:@selector(valueMethod)]];
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    XCTAssertEqual((id)self.class, (id)[self.class performSelector:selector], @"");
    #pragma clang diagnostic pop
}

//- (void)testAddressBook {
//    ABAddressBook *book = [[ABAddressBook alloc] init];
//    [book requestAccessWithCompletion:^(bool granted, NSError *error) {
//        NSLog(@"passed here?");
//    }];
//}

//- (void)testViewHolder {
//    UIView *view = [[[UIView alloc] initWithNibName:@"ViewHolder" bundle:nil] autorelease];
//    STAssertNotNil(view, @"");
//    STAssertEquals(view.tag, 42, @"");
//}

//- (void)testUILog {
//    UILog(1, @"test");
//}

@end
