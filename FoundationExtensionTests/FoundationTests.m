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

@end
