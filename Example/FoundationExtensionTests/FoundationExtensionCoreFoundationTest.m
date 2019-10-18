//
//  FoundationExtensionCoreFoundationTest.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 25..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

@import XCTest;
@import FoundationExtension;


@interface FoundationExtensionCoreFoundationTest : XCTestCase

@end


@implementation FoundationExtensionCoreFoundationTest

- (void)testArray {
    NSAArray *obj;
    NSURL *tmpURL = @"tmp://test.plist".temporaryURL;

    obj = [[NSAArray alloc] init];
    XCTAssertEqual(0, (int)obj.count, @"");

    obj = [NSAArray array];
    XCTAssertEqual(0, (int)obj.count, @"");

    obj = [NSAArray arrayWithArray:@[@1, @2, @3, @4, @5]];
    XCTAssertEqual(5, (int)obj.count, @"");

    obj = [[NSAArray alloc] initWithArray:@[@1, @2, @3, @4, @5] copyItems:YES];
    XCTAssertEqual(5, (int)obj.count, @"");

    for (id o in obj) {
        XCTAssertNotNil(o, @"");
    }


    [obj writeToURL:tmpURL atomically:YES];
    NSAArray *array2 = (NSAArray *)[NSAArray arrayWithContentsOfURL:tmpURL];

    XCTAssertEqual(obj.count, array2.count, @"");
    XCTAssertTrue([obj[0] isEqual:@1], @"");

    obj = [NSAArray arrayWithObject:@1];
    XCTAssertTrue([@1 isEqual:[obj lastObject]], @"");

    obj = [NSAArray arrayWithObjects:@1, @2, @3, @4, @5, nil];
    XCTAssertTrue([@5 isEqual:[obj lastObject]], @"");
    XCTAssertTrue([obj containsObject:@1], @"");
    XCTAssertFalse([obj containsObject:@0], @"");

    NSArray *subarray = [obj subarrayWithRange:NSMakeRange(1, 3)];
    XCTAssertEqual(3, (int)subarray.count, @"");
    NSArray *solution = @[@2, @3, @4];
    XCTAssertTrue([subarray isEqual:solution], @"");
    XCTAssertEqual(subarray.class, NSAArray.class, @"");

    XCTAssertEqual((int)[obj indexOfInteger:3], 2, @"");

    NSAArray *copy = [obj copy];
    XCTAssertFalse(copy == obj, @"");
    XCTAssertEqual(copy.count, obj.count, @"");
    XCTAssertEqual(copy.class, obj.class, @"");

    NSMutableArray *marray = [NSAMutableArray arrayWithCapacity:5];
    XCTAssertEqual(0, (int)marray.count, @"");

}

- (void)testDictionary {
    NSADictionary *obj;
    NSURL *tmpURL = @"tmp://test.plist".temporaryURL;

    obj = [[NSADictionary alloc] init];
    XCTAssertEqual(0, (int)obj.count, @"");

    obj = [NSADictionary dictionary];
    XCTAssertEqual(0, (int)obj.count, @"");

    obj = [NSADictionary dictionaryWithObjectsAndKeys:
           @1, @"1",
           @2, @"2",
           nil];
    XCTAssertEqual(2, (int)obj.count, @"");

    [obj writeToURL:tmpURL atomically:YES];
    NSADictionary *array2 = (NSADictionary *)[NSADictionary dictionaryWithContentsOfURL:tmpURL];

    XCTAssertEqual(obj.count, array2.count, @"");
    XCTAssertTrue([obj[@"2"] isEqual:@2], @"");

    obj = [NSADictionary dictionaryWithObjects:@[@1, @2, @3] forKeys:@[@1, @2, @3]];
    XCTAssertEqual(3, (int)obj.count, @"");

    obj = (NSADictionary *)[NSAMutableDictionary dictionaryWithCapacity:4];
    XCTAssertEqual(0, (int)obj.count, @"");

    NSADictionary *copy = [obj copy];
    XCTAssertFalse(copy == obj, @"");
    XCTAssertEqual(copy.count, obj.count, @"");
    XCTAssertEqual(copy.class, obj.class, @"");
}

- (void)testString {
    NSAString *obj;
    NSURL *tmpURL = @"tmp://test.plist".temporaryURL;

    obj = [[NSAString alloc] init];
    XCTAssertEqual(0, (int)obj.length, @"");

    obj = [NSAString string];
    XCTAssertEqual(0, (int)obj.length, @"");

    obj = [NSAString stringWithString:@"12345"];
    XCTAssertEqual(5, (int)obj.length, @"");

    [obj writeToURL:tmpURL atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    NSAString *obj2 = [NSAString stringWithContentsOfURL:tmpURL encoding:NSUTF8StringEncoding error:NULL];

    XCTAssertEqual(obj.length, obj2.length, @"");
    XCTAssertEqual([obj characterAtIndex:0], (unichar)'1', @"");

    NSString *sub = [obj substringWithRange:NSMakeRange(1, 3)];
    XCTAssertEqual(3, (int)sub.length, @"");
    NSString *solution = @"234";
    XCTAssertTrue([sub isEqual:solution], @"");
    XCTAssertEqual(sub.class, NSAString.class, @"");

    XCTAssertEqual([obj characterAtIndex:3], (unichar)'4', @"");

    NSAString *copy = [obj copy];
    XCTAssertFalse(copy == obj, @"");
    XCTAssertEqual(copy.length, obj.length, @"");
    XCTAssertEqual(copy.class, obj.class, @"");

    NSAMutableString *mobj = [NSAMutableString string];
    XCTAssertEqual(0, (int)mobj.length, @"");

    [mobj appendString:@"hi"];
    XCTAssertEqual(2, (int)mobj.length, @"");
}

- (void)testURL {
    // file URL for real filesystem representation
    XCTAssertEqual(YES, [@"/Volumes".smartURL hasDirectoryPath], @"");
    XCTAssertEqual(YES, [@"/Volumes/".smartURL hasDirectoryPath], @"");
    XCTAssertEqual(NO, [@"/bin/sh".smartURL hasDirectoryPath], @"");
    XCTAssertEqual(YES, [@"/bin/sh/".smartURL hasDirectoryPath], @"");
    // remote URL for URL based (maybe?)
    XCTAssertEqual(NO, [@"http://example.com".smartURL hasDirectoryPath], @"");
    XCTAssertEqual(YES, [@"http://example.com/".smartURL hasDirectoryPath], @"");
    XCTAssertEqual(NO, [@"http://example.com/dir".smartURL hasDirectoryPath], @"");
    XCTAssertEqual(YES, [@"http://example.com/dir/".smartURL hasDirectoryPath], @"");
}

@end
