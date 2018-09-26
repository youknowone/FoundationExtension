//
//  FoundationTests.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 25..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

@import XCTest;

//  Test how Foundation implementation works

@interface FoundationTests : XCTestCase

@end


@interface TestInit: NSObject

@end

@implementation TestInit

@end

@implementation FoundationTests

- (void)testSizeOfId {
    XCTAssertEqual(sizeof(id), sizeof(id<NSCopying>), @"");
}

- (void)testStringPath {
    NSString *aPath;
    NSString *test;

    aPath = @"/tmp";
    test = [aPath stringByAppendingPathComponent:@"file.ext"];
    XCTAssertTrue([test isEqualToString:@"/tmp/file.ext"], @"result: %@", test);

    test = [aPath stringByAppendingPathComponent:@"dir/file.ext"];
    XCTAssertTrue([test isEqualToString:@"/tmp/dir/file.ext"], @"result: %@", test);

    aPath = @"/tmp/";
    test = [aPath stringByAppendingPathComponent:@"file.ext"];
    XCTAssertTrue([test isEqualToString:@"/tmp/file.ext"], @"result: %@", test);

    test = [aPath stringByAppendingPathComponent:@"dir/file.ext"];
    XCTAssertTrue([test isEqualToString:@"/tmp/dir/file.ext"], @"result: %@", test);

    aPath = @"/tmp";
    test = [aPath stringByAppendingPathComponent:@"/file.ext"];
    XCTAssertTrue([test isEqualToString:@"/tmp/file.ext"], @"result: %@", test);

    test = [aPath stringByAppendingPathComponent:@"/dir/file.ext"];
    XCTAssertTrue([test isEqualToString:@"/tmp/dir/file.ext"], @"result: %@", test);

    aPath = @"/tmp/";
    test = [aPath stringByAppendingPathComponent:@"/file.ext"];
    XCTAssertTrue([test isEqualToString:@"/tmp/file.ext"], @"result: %@", test);

    test = [aPath stringByAppendingPathComponent:@"/dir/file.ext"];
    XCTAssertTrue([test isEqualToString:@"/tmp/dir/file.ext"], @"result: %@", test);
}

- (void)testHash {
    {
        NSObject *obj = [[NSObject alloc] init];
        NSUInteger p = (NSUInteger)obj;
        XCTAssertEqual(obj.hash, p, @"");
    }
    {
        NSArray *a1 = @[@1, @2, @3];
        NSMutableArray *a2 = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
        XCTAssertEqualObjects(a1, a2, @"");
        XCTAssertEqual(a1.hash, a2.hash, @"");
        NSArray *a3 = [a2 copy];
        XCTAssertEqualObjects(a1, a3, @"");
        XCTAssertEqual(a1.class, a3.class, @"");
        XCTAssertEqual(a1.hash, a3.hash, @"");
        a2[2] = @2;
        XCTAssertEqual(a1.hash, a2.hash, @"");
        XCTAssertEqual(a1.hash, a1.count, @"");
        XCTAssertEqual((@[@1, @2, @3, @4]).hash, (NSUInteger)4, @"");
    }
}

- (void)testMacro {
    #ifdef __MAC_OS_X_VERSION_MIN_REQUIRED
    NSLog(@"%d", __MAC_OS_X_VERSION_MIN_REQUIRED);
    #endif
    #ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
    NSLog(@"%d", __IPHONE_OS_VERSION_MIN_REQUIRED);
    #endif
}

@end
