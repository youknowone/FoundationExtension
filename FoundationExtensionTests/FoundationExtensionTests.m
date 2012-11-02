//
//  FoundationExtensionTests.m
//  FoundationExtensionTests
//
//  Created by Jeong YunWon on 11. 3. 21..
//  Copyright 2011 youknowone.org All rights reserved.
//

#import <FoundationExtension/FoundationExtension.h>

#import "FoundationExtensionTests.h"

@implementation FoundationExtensionTests

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

- (void)testClassName {
    STAssertTrue([[[self classObject] name] isEqualToString:@"FoundationExtensionTests"], @"Taken name is: %@", [[self classObject] name]);
}

- (void)testClassShortcut {
    NSString *aString = [[[NSAClass classWithClass:[NSString class]] alloc] initWithString:@"hi"];

    STAssertTrue([aString isEqualToString:@"hi"], @"");
}

- (int)return0 { return 0; }
- (int)return1 { return 1; }

- (void)testClassMethod {
    STAssertEquals(0, [self return0], @"");
    STAssertEquals(1, [self return1], @"");

    NSAMethod *m0 = [self.classObject methodObjectForSelector:@selector(return0)];
    NSAMethod *m1 = [self.classObject methodObjectForSelector:@selector(return1)];
    m0.implementation = m1.implementation;
    STAssertEquals(1, [self return0], @"");
}

- (void)testString {
    STAssertEquals([@"Hello, World" hasSubstring:@""], NO, @"");
}

- (void)testStringFormat {
    {
        NSString *formatted = [@"%d %d %d" format0:nil, 10, 9, 8];
        STAssertTrue([formatted isEqualToString:@"10 9 8"], @"formatted was: %@", formatted);
    }
    {
        NSString *formatted = [@"%@ %d %s" format:@"Hello", 10, "World"];
        STAssertTrue([formatted isEqualToString:@"Hello 10 World"], @"formatted was: %@", formatted);
    }
    {
        NSString *formatted = [@"%@" format:@"Hello"];
        STAssertTrue([formatted isEqualToString:@"Hello"], @"formatted was: %@", formatted);
    }
    {
        NSString *formatted = [@"%%%%%@" format:@"Hello"];
        STAssertTrue([formatted isEqualToString:@"%%Hello"], @"formatted was: %@", formatted);
    }
    {
        NSString *aPath = @"/tmp";
        NSString *test = [aPath stringByAppendingPathFormat:@"/%@/%@", @"dir", @"file.ext"];
        STAssertTrue([test isEqualToString:@"/tmp/dir/file.ext"], @"result: %@", test);
    }
}

- (void)testStringConcatnation {
    NSString *concat = [NSString stringWithConcatnatingStrings:@"Hello, ", @"World!", nil];

    STAssertTrue([concat isEqualToString:@"Hello, World!"], @"");
}

- (void)testHexadecimalString {
    NSData *data = [NSData dataWithBytes:"\0aa\0" length:4];
    NSString *result = [data hexadecimalString];
    STAssertTrue([result isEqualToString:@"00616100"], @"");
}

- (void)testBase64String {
    // test from http://en.wikipedia.org/wiki/Base64#Examples
    NSData *data = [@"Man is distinguished, not only by his reason, but by this singular passion from other animals, which is a lust of the mind, that by a perseverance of delight in the continued and indefatigable generation of knowledge, exceeds the short vehemence of any carnal pleasure." dataUsingUTF8Encoding];
    NSString *solution = @"TWFuIGlzIGRpc3Rpbmd1aXNoZWQsIG5vdCBvbmx5IGJ5IGhpcyByZWFzb24sIGJ1dCBieSB0aGlzIHNpbmd1bGFyIHBhc3Npb24gZnJvbSBvdGhlciBhbmltYWxzLCB3aGljaCBpcyBhIGx1c3Qgb2YgdGhlIG1pbmQsIHRoYXQgYnkgYSBwZXJzZXZlcmFuY2Ugb2YgZGVsaWdodCBpbiB0aGUgY29udGludWVkIGFuZCBpbmRlZmF0aWdhYmxlIGdlbmVyYXRpb24gb2Yga25vd2xlZGdlLCBleGNlZWRzIHRoZSBzaG9ydCB2ZWhlbWVuY2Ugb2YgYW55IGNhcm5hbCBwbGVhc3VyZS4=";
    NSString *encode = [data base64String];
    STAssertEquals(encode.length, solution.length, @"length: %d expected: %d", encode.length, solution.length);
    STAssertTrue([encode isEqualToString:solution], @"result: %@", encode);
    
    NSData *decode = [NSData dataWithBase64String:solution];
    STAssertEquals(decode.length, data.length, @"length: %d expected: %d", decode.length, data.length);
    STAssertTrue([decode isEqualToData:data], @"result: %@ expected: %@", [NSString stringWithUTF8Data:decode], [NSString stringWithUTF8Data:data]);
}

- (void)testHexadecimal
{
    NSData *data = [@"SAMPLE" dataUsingEncoding:NSUTF8StringEncoding];
    STAssertTrue([[data hexadecimalString] isEqual:@"53414d504c45"], @"hexadecimal encode");

    STAssertTrue([@"SAMPLE" isEqual:[NSString stringWithUTF8Data:[NSData dataWithHexadecimalString:@"53414d504c45"]]], @"hexadecimal decode: %@", [NSString stringWithUTF8Data:[NSData dataWithHexadecimalString:@"53414d504c45"]]);
}

- (void)testTuple
{
    NSAMutableTuple *tuple = [NSAMutableTuple tupleWithFirst:@1 second:@2];
    STAssertEquals((int)[tuple.first integerValue], 1, @"");
    STAssertEquals((int)[tuple.second integerValue], 2, @"");
    
    tuple.first = @3;
    tuple.second = @4;
    STAssertEquals((int)[tuple.first integerValue], 3, @"");
    STAssertEquals((int)[tuple.second integerValue], 4, @"");
    
    [tuple swap];
    STAssertEquals((int)[tuple.first integerValue], 4, @"");
    STAssertEquals((int)[tuple.second integerValue], 3, @"");
}

- (void)testTriple
{
    NSAMutableTriple *obj = [NSAMutableTriple tripleWithFirst:@1 second:@2 third:@3];
    STAssertEquals((int)[obj.first integerValue], 1, @"");
    STAssertEquals((int)[obj.second integerValue], 2, @"");
    STAssertEquals((int)[obj.third integerValue], 3, @"");
    
    obj.first = @4;
    obj.second = @5;
    obj.third = @6;
    STAssertEquals((int)[obj.first integerValue], 4, @"");
    STAssertEquals((int)[obj.second integerValue], 5, @"");
    STAssertEquals((int)[obj.third integerValue], 6, @"");
}

- (void)testFunctional {
    {
        NSArray *a = [NSArray arrayWithObjects:@1, @2, @3, @4, nil];
        NSInteger idx = 0;
        for (id i in NSAMap(a.objectEnumerator, ^(id obj) { return [NSNumber numberWithInteger:[obj integerValue] - 1]; })) {
            STAssertEquals([i integerValue], idx, @"");
            idx += 1;
        }
        STAssertEquals((int)idx, 4, @"");
        
        idx = 0;
        for (id i in NSAFilter(a.objectEnumerator, ^(id obj) { return (BOOL)([obj integerValue] % 2 == 0); })) {
            idx += 1;
            STAssertEquals([i integerValue] / 2, (idx + 2) / 2, @"");
        }
        STAssertEquals((int)idx, 2, @"");
        
        idx = 0;
        for (id i in NSAMapFilter(a.objectEnumerator, ^(id obj) { return ([obj integerValue] % 2 != 0) ? [NSNumber numberWithInteger:[obj integerValue] - 1] : nil; })) {
            idx += 1;
            STAssertEquals([i integerValue] / 2, idx / 2, @"");
        }
        STAssertEquals((int)idx, 2, @"");
        
        NSNumber *res = NSAReduceWithInitialObject(a.objectEnumerator, ^(id obj1, id obj2) { return [NSNumber numberWithInteger:[obj1 integerValue] + [obj2 integerValue]]; }, @0);
        STAssertEqualObjects(res, @10, @"");
    }
    
    {
        NSMutableArray *a = [NSMutableArray arrayWithObjects:@1, @2, @3, @4, nil];
        NSInteger idx = 0;
        [a map:^(id obj) { return [NSNumber numberWithInteger:[obj integerValue] - 1]; }];
        for (id i in a) {
            STAssertEquals([i integerValue], idx, @"");
            idx += 1;
        }
        STAssertEquals((int)idx, 4, @"");
        
        a = [NSMutableArray arrayWithObjects:@1, @2, @3, @4, nil];
        idx = 0;
        [a filter:^(id obj) { return (BOOL)([obj integerValue] % 2 == 0); }];
        for (id i in a) {
            idx += 1;
            STAssertEquals([i integerValue] / 2, (idx + 2) / 2, @"");
        }
        STAssertEquals((int)idx, 2, @"");
        
        a = [NSMutableArray arrayWithObjects:@1, @2, @3, @4, nil];
        idx = 0;
        [a mapFilter:^(id obj) { return ([obj integerValue] % 2 != 0) ? [NSNumber numberWithInteger:[obj integerValue] - 1] : nil; }];
        for (id i in a) {
            idx += 1;
            STAssertEquals([i integerValue] / 2, idx / 2, @"");
        }
    }
}

- (void)testAttributedString {
    NSAttributedString *obj = [NSAttributedString attributedString];
    STAssertEqualObjects(obj, [[[NSAttributedString alloc] initWithString:@""] autorelease], @"");
}

@end
