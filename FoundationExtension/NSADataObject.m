//
//  NSADataObject.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 3. 30..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import "NSADataObject.h"

@implementation NSATuple

+ (id)tuple {
    return [[[self alloc] init] autorelease];
}

- (id)initWithFirst:(id)first second:(id)second {
    self = [super init];
    if (self != nil) {
        self->_first = [first retain];
        self->_second = [second retain];
    }
    return self;
}

+ (id)tupleWithFirst:(id)first second:(id)second {
    return [[[self alloc] initWithFirst:first second:second] autorelease];
}

- (void)dealloc {
    [self->_first release];
    [self->_second release];
    [super dealloc];
}

- (id)first {
    return self->_first;
}

- (id)second {
    return self->_second;
}

- (id)objectAtIndex:(NSUInteger)index {
    switch (index) {
        case 0:
            return self->_first;
        case 1:
            return self->_second;
    }
    return nil;
}

@end


@implementation NSAMutableTuple
@dynamic first, second;

// implementation should be thread-safe?

- (void)setFirst:(id)first {
    if (self->_first == first) return;
    [self->_first release];
    self->_first = [first retain];
}

- (void)setSecond:(id)second {
    if (self->_second == second) return;
    [self->_second release];
    self->_second = [second retain];
}

- (void)swap {
    id temp = self->_first;
    self->_first = self->_second;
    self->_second = temp;
}

@end


@implementation NSATriple

+ (id)triple {
    return [[[self alloc] init] autorelease];
}

- (id)initWithFirst:(id)first second:(id)second third:(id)third {
    self = [super init];
    if (self != nil) {
        self->_first = [first retain];
        self->_second = [second retain];
        self->_third = [third retain];
    }
    return self;
}

+ (id)tripleWithFirst:(id)first second:(id)second third:(id)third {
    return [[[self alloc] initWithFirst:first second:second third:third] autorelease];
}

- (void)dealloc {
    [self->_first release];
    [self->_second release];
    [self->_third release];
    [super dealloc];
}

- (id)first {
    return self->_first;
}

- (id)second {
    return self->_second;
}

- (id)third {
    return self->_third;
}

- (id)objectAtIndex:(NSUInteger)index {
    switch (index) {
        case 0:
            return self->_first;
        case 1:
            return self->_second;
        case 2:
            return self->_third;
    }
    return nil;
}

@end


@implementation NSAMutableTriple
@dynamic first, second, third;

// implementation should be thread-safe?

- (void)setFirst:(id)first {
    if (self->_first == first) return;
    [self->_first release];
    self->_first = [first retain];
}

- (void)setSecond:(id)second {
    if (self->_second == second) return;
    [self->_second release];
    self->_second = [second retain];
}

- (void)setThird:(id)third {
    if (self->_third == third) return;
    [self->_third release];
    self->_third = [third retain];
}

@end
