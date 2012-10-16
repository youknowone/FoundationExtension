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
//        NSString *formatted = [@"%@ %d %s" format:@"Hello", 10, "World"];
//        STAssertTrue([formatted isEqualToString:@"Hello 10 World"], @"formatted was: %@", formatted);
    }
}

- (void)testHexadecimal
{
    NSData *data = [@"SAMPLE" dataUsingEncoding:NSUTF8StringEncoding];
    STAssertTrue([[data hexadecimalString] isEqual:@"53414d504c45"], @"hexadecimal encode");
    
    STAssertTrue([@"SAMPLE" isEqual:[NSString stringWithUTF8Data:[NSData dataWithHexadecimalString:@"53414d504c45"]]], @"hexadecimal decode");
}

@end
