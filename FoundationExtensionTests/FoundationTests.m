//
//  FoundationTests.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 25..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import "FoundationTests.h"


@interface TestInit: NSObject

@end

@implementation TestInit

- (id)initObject {
    [self release];
    return (id)[[NSString alloc] init];
}

@end

@implementation FoundationTests

- (void)testInit {
    id obj = [[TestInit alloc] initObject];
    [obj release];
}

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
        NSObject *obj = [[[NSObject alloc] init] autorelease];
        NSUInteger p = (NSUInteger)obj;
        XCTAssertEqual(obj.hash, p, @"");
    }
    {
        NSArray *a1 = @[@1, @2, @3];
        NSMutableArray *a2 = [NSMutableArray arrayWithObjects:@1, @2, [NSNumber numberWithInteger:3], nil];
        XCTAssertEqualObjects(a1, a2, @"");
        XCTAssertEqual(a1.hash, a2.hash, @"");
        NSArray *a3 = [[a2 copy] autorelease];
        XCTAssertEqualObjects(a1, a3, @"");
        XCTAssertEqual(a1.class, a3.class, @"");
        XCTAssertEqual(a1.hash, a3.hash, @"");
        a2[2] = @2;
        XCTAssertEqual(a1.hash, a2.hash, @"");
        XCTAssertEqual(a1.hash, a1.count, @"");
        XCTAssertEqual((@[@1, @2, @3, @4]).hash, (NSUInteger)4, @"");
    }
}

@end
