//
//  CocoaExtensionTests.m
//  CocoaExtensionTests
//
//  Created by Jeong YunWon on 12. 10. 28..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import "CocoaExtensionTests.h"

@implementation CocoaExtensionTests

- (void)setUp
{
    [super setUp];

    tmpURL = [@"tmp://blah.file".temporaryURL retain];
}

- (void)tearDown
{
    [tmpURL release];

    [super tearDown];
}

- (void)eventStream:(FSEventStream *)eventStream path:(NSString *)path event:(FSEventStreamEventFlags)eventFlags id:(FSEventStreamEventId)eventId {
    STAssertEqualObjects(path, [tmpURL.path stringByDeletingLastPathComponent], @"check path");
    STAssertTrue((kFSEventStreamEventFlagItemCreated|kFSEventStreamEventFlagItemModified) == eventFlags, @"");
    testFSEvents = YES;
}

- (void)testFSEvents
{
    testFSEvents = NO;
    NSString *watchPath = [tmpURL.path stringByDeletingLastPathComponent];
    FSEventStream *eventStream = [FSEventStream scheduledEventStreamWithPath:watchPath latency:0.05 flags:kFSEventStreamEventFlagItemCreated|kFSEventStreamEventFlagItemModified delegate:self];
    // not working
    [eventStream release];
}

- (void)testStringAttribute
{
    NSAttributedStringAttributeDictionary *dict = [NSAttributedStringAttributeDictionary dictionary];
    // defaults
    STAssertEquals(dict.ligature, (NSUInteger)NSLigatureStandard, @"");

    #define TEST_ITEM(PROP, VALUE) \
        dict.PROP = VALUE;  \
        STAssertEqualObjects(dict.PROP, VALUE, @""); \
        dict.PROP = nil;    \
        STAssertNil(dict.PROP, @"");
    #define TEST_ITEM_VALUE(PROP, VALUE) \
        dict.PROP = VALUE;  \
        STAssertEquals(dict.PROP, VALUE, @"");

    TEST_ITEM(font, [NSFont fontWithName:@"Helvetica" size:10.0]);
    TEST_ITEM(paragraphStyle, [NSParagraphStyle defaultParagraphStyle]);
    TEST_ITEM(foregroundColor, [NSColor colorWithDeviceRed:0.2 green:0.4 blue:0.6 alpha:1.0]);
    TEST_ITEM(underlineStyleNumber, [NSNumber numberWithUnsignedInteger:NSUnderlineStyleDouble]);
    TEST_ITEM_VALUE(underlineStyle, (NSUInteger)NSUnderlineStyleDouble);
    TEST_ITEM(superscriptNumber, [NSNumber numberWithBool:YES]);
    TEST_ITEM_VALUE(superscript, YES);
    TEST_ITEM_VALUE(superscript, NO);
    TEST_ITEM(backgroundColor, [NSColor colorWithDeviceRed:0.2 green:0.4 blue:0.6 alpha:1.0]);
    NSTextAttachment *attach = [[[NSTextAttachment alloc] initWithFileWrapper:[[[NSFileWrapper alloc] initWithPath:@"/"] autorelease]] autorelease];
    TEST_ITEM(attachment, attach);
    TEST_ITEM(ligatureNumber, [NSNumber numberWithUnsignedInteger:NSLigatureNo]);
    TEST_ITEM_VALUE(ligature, (NSUInteger)NSLigatureAll);
    TEST_ITEM_VALUE(ligature, (NSUInteger)NSLigatureStandard);
    TEST_ITEM(baselineOffsetNumber, [NSNumber numberWithFloat:1.2f]);
    TEST_ITEM_VALUE(baselineOffset, 0.8f);
    TEST_ITEM(kernNumber, [NSNumber numberWithFloat:0.2f]);
    TEST_ITEM_VALUE(kern, 0.4f);
    TEST_ITEM(link, @"http://youknowone.org".URL);
    TEST_ITEM(strokeWidthNumber, [NSNumber numberWithFloat:0.2f]);
    TEST_ITEM_VALUE(strokeWidth, 0.4f);
    TEST_ITEM(strokeColor, [NSColor colorWithDeviceRed:0.2 green:0.4 blue:0.6 alpha:1.0]);
    TEST_ITEM(underlineColor, [NSColor colorWithDeviceRed:0.2 green:0.4 blue:0.6 alpha:1.0]);
    TEST_ITEM(strikethroughStyleNumber, [NSNumber numberWithUnsignedInteger:NSUnderlineStyleDouble]);
    TEST_ITEM_VALUE(strikethroughStyle, (NSUInteger)NSUnderlineStyleDouble);
    TEST_ITEM(shadow, [[[NSShadow alloc] init] autorelease]);
    TEST_ITEM(obliquenessNumber, [NSNumber numberWithFloat:0.2f]);
    TEST_ITEM_VALUE(obliqueness, 0.4f);
    TEST_ITEM(expansionNumber, [NSNumber numberWithFloat:0.2f]);
    TEST_ITEM_VALUE(expansion, 0.4f);
    id cursor = [NSCursor currentSystemCursor];
    TEST_ITEM(cursor, cursor);
    TEST_ITEM(toolTip, @"Test tooptip");
    TEST_ITEM(writingDirectionArray, ([NSArray arrayWithObjects:@1, @2, @3, nil]));
    TEST_ITEM_VALUE(writingDirection, (NSUInteger)3);
    TEST_ITEM(verticalGlyphFormNumber, [NSNumber numberWithUnsignedInteger:NSVerticalGlyphFormHorizontal]);
    TEST_ITEM_VALUE(verticalGlyphForm, (NSUInteger)NSVerticalGlyphFormHorizontal);

    #undef TEST_ITEM
    #undef TEST_ITEM_VALUE
}

@end
