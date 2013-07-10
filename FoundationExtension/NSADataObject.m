//
//  NSADataObject.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 3. 30..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#include "debug.h"

#import "NSADataObject.h"

@implementation NSATuple

static Class _tupleClass;
static Class _mutableTupleClass;

+ (void)initialize {
    if (self == [NSATuple class]) {
        _tupleClass = [NSATuple class];
        _mutableTupleClass = [NSAMutableTuple class];
    }
}

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

- (NSUInteger)hash {
    return 2;
}

- (BOOL)isEqualToTuple:(NSATuple *)tuple {
    return [self.first isEqual:tuple.first] && [self.second isEqual:tuple.second];
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[NSATuple class]]) {
        return [self isEqualToTuple:object];
    }
    return NO;
}

#pragma mark NSArray-like interface

- (NSUInteger)count {
    return 2;
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

- (id):(NSUInteger)index {
    return [self objectAtIndex:index];
}

- (NSUInteger)indexOfObject:(id)anObject {
    if ([anObject isEqual:self->_first]) {
        return 0;
    }
    if ([anObject isEqual:self->_second]) {
        return 1;
    }
    return NSNotFound;
}

- (BOOL)containsObject:(id)anObject {
    return ([self indexOfObject:anObject] == NSNotFound) ? NO : YES;
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return [self retain];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[_mutableTupleClass allocWithZone:zone] initWithFirst:self->_first second:self->_second];
}

#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id [])buffer count:(NSUInteger)len {
    if(state->state != 0) {
        return 0;
    }

    dassert(len > 2); // this is always bigger than 3 in common platform.

    state->state = 1;
    state->mutationsPtr = &state->extra[0];

    buffer[0] = self->_first;
    buffer[1] = self->_second;
    return 2;
}

@end


@implementation NSAMutableTuple
@dynamic first, second;

// implementation should be thread-safe?

- (void)setFirst:(id)first {
    [first retain];
    [self->_first release];
    self->_first = first;
}

- (void)setSecond:(id)second {
    [second retain];
    [self->_second release];
    self->_second = second;
}

- (void)swap {
    id temp = self->_first;
    self->_first = self->_second;
    self->_second = temp;
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return [[_tupleClass allocWithZone:zone] initWithFirst:self->_first second:self->_second];
}

@end


@implementation NSATriple

static Class _tripleClass;
static Class _mutableTripleClass;

+ (void)initialize {
    if (self == [NSATuple class]) {
        _tripleClass = [NSATuple class];
        _mutableTripleClass = [NSAMutableTuple class];
    }
}

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

- (NSUInteger)hash {
    return 3;
}

- (BOOL)isEqualToTriple:(NSATriple *)triple {
    return [self.first isEqual:triple.first] && [self.second isEqual:triple.second] && [self.third isEqual:triple.third];
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[NSATriple class]]) {
        return [self isEqualToTriple:object];
    }
    return NO;
}

#pragma mark

- (NSUInteger)count {
    return 3;
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

- (id):(NSUInteger)index {
    return [self objectAtIndex:index];
}

- (NSUInteger)indexOfObject:(id)anObject {
    if ([anObject isEqual:self->_first]) {
        return 0;
    }
    if ([anObject isEqual:self->_second]) {
        return 1;
    }
    if ([anObject isEqual:self->_third]) {
        return 2;
    }
    return NSNotFound;
}

- (BOOL)containsObject:(id)anObject {
    return ([self indexOfObject:anObject] == NSNotFound) ? NO : YES;
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return [self retain];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[_mutableTripleClass allocWithZone:zone] initWithFirst:self->_first second:self->_second third:self->_third];
}

#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id [])buffer count:(NSUInteger)len {
    if(state->state != 0) {
        return 0;
    }

    state->state = 1;
    state->mutationsPtr = &state->extra[0];

    dassert(len > 3); // this is always bigger than 3 in common platform.

    buffer[0] = self->_first;
    buffer[1] = self->_second;
    buffer[2] = self->_third;
    return 3;
}

@end


@implementation NSAMutableTriple
@dynamic first, second, third;

// implementation should be thread-safe?

- (void)setFirst:(id)first {
    [first retain];
    [self->_first release];
    self->_first = first;
}

- (void)setSecond:(id)second {
    [second retain];
    [self->_second release];
    self->_second = second;
}

- (void)setThird:(id)third {
    [third retain];
    [self->_third release];
    self->_third = third;
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return [[_tripleClass allocWithZone:zone] initWithFirst:self->_first second:self->_second third:self->_third];
}

@end
