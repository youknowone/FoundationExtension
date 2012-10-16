//
//  NSADataObject.m
//  FoundationExtension
//
//  Created by youknowone on 12. 3. 30..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import "NSADataObject.h"

@implementation NSATuple
@synthesize first=_first, second=_second;

+ (id)tuple {
    return [[[self alloc] init] autorelease];
}

- (id)initWithFirst:(id)first second:(id)second {
    self = [super init];
    if (self != nil) {
        self.first = first;
        self.second = second;
    }
    return self;
}

+ (id)tupleWithFirst:(id)first second:(id)second {
    return [[[self alloc] initWithFirst:first second:second] autorelease];
}

- (void)dealloc {
    self.first = nil;
    self.second = nil;
    [super dealloc];
}

- (void)swap {
    id temp = self->_first;
    self->_first = self->_second;
    self->_second = temp;
}

@end

@implementation NSATriple
@synthesize first=_first, second=_second, third=_third;

+ (id)triple {
    return [[[self alloc] init] autorelease];
}

- (id)initWithFirst:(id)first second:(id)second third:(id)third {
    self = [super init];
    if (self != nil) {
        self.first = first;
        self.second = second;
        self.third = third;
    }
    return self;
}

+ (id)tripleWithFirst:(id)first second:(id)second third:(id)third {
    return [[[self alloc] initWithFirst:first second:second third:third] autorelease];
}

- (void)dealloc {
    self.first = nil;
    self.second = nil;
    self.third = nil;
    [super dealloc];
}

@end
