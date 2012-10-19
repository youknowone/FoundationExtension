//
//  FoundationExtensionTests.m
//  FoundationExtensionTests
//
//  Created by youknowone on 11. 3. 21..
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

@end
