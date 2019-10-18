//
//  CocoaExtensionTests.m
//  CocoaExtensionTests
//
//  Created by Jeong YunWon on 12. 10. 28..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

@import XCTest;
@import CocoaExtension;


@interface CocoaExtensionTests : XCTestCase<FSEventStreamDelegate> {
    NSURL *tmpURL;
    BOOL testFSEvents;
}

@end


@implementation CocoaExtensionTests

- (void)setUp
{
    [super setUp];

    tmpURL = @"tmp://blah.file".temporaryURL;
}

- (void)tearDown
{
    [super tearDown];
}

- (void)eventStream:(FSEventStream *)eventStream path:(NSString *)path event:(FSEventStreamEventFlags)eventFlags id:(FSEventStreamEventId)eventId {
    XCTAssertEqualObjects(path, [tmpURL.path stringByDeletingLastPathComponent], @"check path");
    XCTAssertTrue((kFSEventStreamEventFlagItemCreated|kFSEventStreamEventFlagItemModified) == eventFlags, @"");
    testFSEvents = YES;
}

- (void)testFSEvents
{
    testFSEvents = NO;
    NSString *watchPath = [tmpURL.path stringByDeletingLastPathComponent];
    FSEventStream *eventStream = [FSEventStream scheduledEventStreamWithPath:watchPath latency:0.05 flags:kFSEventStreamEventFlagItemCreated|kFSEventStreamEventFlagItemModified delegate:self];
    // not working

    [eventStream self];
}

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

    TEST_ITEM(font, [NSFont fontWithName:@"Helvetica" size:10.0]);
    TEST_ITEM(paragraphStyle, [NSParagraphStyle defaultParagraphStyle]);
    TEST_ITEM(foregroundColor, [NSColor colorWithDeviceRed:0.2 green:0.4 blue:0.6 alpha:1.0]);
    TEST_ITEM(underlineStyleNumber, @(NSUnderlineStyleDouble));
    TEST_ITEM_VALUE(underlineStyle, (NSUnderlineStyle)NSUnderlineStyleDouble);
    TEST_ITEM(superscriptNumber, @(YES));
    TEST_ITEM_VALUE(superscript, YES);
    TEST_ITEM_VALUE(superscript, NO);
    TEST_ITEM(backgroundColor, [NSColor colorWithDeviceRed:0.2 green:0.4 blue:0.6 alpha:1.0]);
    NSTextAttachment *attach = [[NSTextAttachment alloc] initWithFileWrapper:[[NSFileWrapper alloc] initWithURL:@"/".URL options:0 error:NULL]];
    TEST_ITEM(attachment, attach);
    TEST_ITEM(ligatureNumber, @(NSLigatureNo));
    TEST_ITEM_VALUE(ligature, (NSUInteger)NSLigatureAll);
    TEST_ITEM_VALUE(ligature, (NSUInteger)NSLigatureStandard);
    TEST_ITEM(baselineOffsetNumber, @1.2f);
    TEST_ITEM_VALUE(baselineOffset, 0.8f);
    TEST_ITEM(kernNumber, @0.2f);
    TEST_ITEM_VALUE(kern, 0.4f);
    TEST_ITEM(link, @"http://youknowone.org".URL);
    TEST_ITEM(strokeWidthNumber, @0.2f);
    TEST_ITEM_VALUE(strokeWidth, 0.4f);
    TEST_ITEM(strokeColor, [NSColor colorWithDeviceRed:0.2 green:0.4 blue:0.6 alpha:1.0]);
    TEST_ITEM(underlineColor, [NSColor colorWithDeviceRed:0.2 green:0.4 blue:0.6 alpha:1.0]);
    TEST_ITEM(strikethroughStyleNumber, @(NSUnderlineStyleDouble));
    TEST_ITEM_VALUE(strikethroughStyle, (NSUnderlineStyle)NSUnderlineStyleDouble);
    TEST_ITEM(shadow, [[NSShadow alloc] init]);
    TEST_ITEM(obliquenessNumber, @0.2f);
    TEST_ITEM_VALUE(obliqueness, 0.4f);
    TEST_ITEM(expansionNumber, @0.2f);
    TEST_ITEM_VALUE(expansion, 0.4f);
//    id cursor = [NSCursor currentSystemCursor];
//    TEST_ITEM(cursor, cursor);
    TEST_ITEM(toolTip, @"Test tooptip");
    TEST_ITEM(writingDirectionArray, (@[@[@1, @2, @3]]));
    TEST_ITEM_VALUE(writingDirection, (NSUInteger)3);
    #if __MAC_OS_X_VERSION_MAX_ALLOWED >= 1070
    TEST_ITEM(verticalGlyphFormNumber, @(NSVerticalGlyphFormHorizontal));
    TEST_ITEM_VALUE(verticalGlyphForm, (NSUInteger)NSVerticalGlyphFormHorizontal);
    #endif
    #undef TEST_ITEM
    #undef TEST_ITEM_VALUE
}

- (void)testSystemVersion {
    NSAVersion *version = [NSAVersion systemVersion];
    XCTAssertEqual(version.major, (NSInteger)10, @"");
//    STAssertEqualObjects(version.string, @"10.8.4", @"");
}

@end
