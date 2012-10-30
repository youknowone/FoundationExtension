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

@end
