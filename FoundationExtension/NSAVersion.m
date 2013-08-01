//
//  NSAVersion.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 8. 1..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "NSAVersion.h"

@implementation NSAVersion

@synthesize string=_string;
@synthesize major=_major, minor=_minor, bugfix=_bugfix;

- (id)initWithString:(NSString *)string {
    self = [super init];
    if (self != nil) {
        self->_string = [string copy];
        NSArray *parts = [string componentsSeparatedByString:@"."];
        self->_major = [parts[0] integerValue];
        self->_minor = [parts[1] integerValue];
        if (parts.count > 2) {
            self->_bugfix = [parts[2] integerValue];
        }
    }
    return self;
}

+ (id)versionWithString:(NSString *)string {
    return [[[self alloc] initWithString:string] autorelease];
}

- (void)dealloc {
    [self->_string release];
    [super dealloc];
}

@end
