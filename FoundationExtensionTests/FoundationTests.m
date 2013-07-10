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
    STAssertEquals(sizeof(id), sizeof(id<NSCopying>), @"");
}

- (void)testStringPath {
    NSString *aPath;
    NSString *test;

    aPath = @"/tmp";
    test = [aPath stringByAppendingPathComponent:@"file.ext"];
    STAssertTrue([test isEqualToString:@"/tmp/file.ext"], @"result: %@", test);

    test = [aPath stringByAppendingPathComponent:@"dir/file.ext"];
    STAssertTrue([test isEqualToString:@"/tmp/dir/file.ext"], @"result: %@", test);

    aPath = @"/tmp/";
    test = [aPath stringByAppendingPathComponent:@"file.ext"];
    STAssertTrue([test isEqualToString:@"/tmp/file.ext"], @"result: %@", test);

    test = [aPath stringByAppendingPathComponent:@"dir/file.ext"];
    STAssertTrue([test isEqualToString:@"/tmp/dir/file.ext"], @"result: %@", test);

    aPath = @"/tmp";
    test = [aPath stringByAppendingPathComponent:@"/file.ext"];
    STAssertTrue([test isEqualToString:@"/tmp/file.ext"], @"result: %@", test);

    test = [aPath stringByAppendingPathComponent:@"/dir/file.ext"];
    STAssertTrue([test isEqualToString:@"/tmp/dir/file.ext"], @"result: %@", test);

    aPath = @"/tmp/";
    test = [aPath stringByAppendingPathComponent:@"/file.ext"];
    STAssertTrue([test isEqualToString:@"/tmp/file.ext"], @"result: %@", test);

    test = [aPath stringByAppendingPathComponent:@"/dir/file.ext"];
    STAssertTrue([test isEqualToString:@"/tmp/dir/file.ext"], @"result: %@", test);
}

- (void)testHash {
    {
        NSObject *obj = [[[NSObject alloc] init] autorelease];
        NSUInteger p = (NSUInteger)obj;
        STAssertEquals(obj.hash, p, @"");
    }
    {
        NSArray *a1 = @[@1, @2, @3];
        NSMutableArray *a2 = [NSMutableArray arrayWithObjects:@1, @2, [NSNumber numberWithInteger:3], nil];
        STAssertEqualObjects(a1, a2, @"");
        STAssertEquals(a1.hash, a2.hash, @"");
        NSArray *a3 = [[a2 copy] autorelease];
        STAssertEqualObjects(a1, a3, @"");
        STAssertEquals(a1.class, a3.class, @"");
        STAssertEquals(a1.hash, a3.hash, @"");
        a2[2] = @2;
        STAssertEquals(a1.hash, a2.hash, @"");
        STAssertEquals(a1.hash, a1.count, @"");
        STAssertEquals((@[@1, @2, @3, @4]).hash, (NSUInteger)4, @"");
    }
}

@end
