//
//  NSADataObject.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 3. 30..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#include "debug.h"

#import "NSArray.h"
#import "NSADataObject.h"

@implementation NSATuple

+ (instancetype)tuple {
    return [[self alloc] init];
}

- (instancetype)initWithFirst:(id)first second:(id)second {
    self = [super init];
    if (self != nil) {
        self->_first = first;
        self->_second = second;
    }
    return self;
}

+ (instancetype)tupleWithFirst:(id)first second:(id)second {
    return [[self alloc] initWithFirst:first second:second];
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
    return self[index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    switch (index) {
        case 0:
            return self->_first;
        case 1:
            return self->_second;
    }
    @throw NSRangeException;
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

- (NSArray *)allObjects {
    return [NSArray arrayWithEnumerator:self];
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[NSAMutableTuple allocWithZone:zone] initWithFirst:self->_first second:self->_second];
}

#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len {
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
    self->_first = first;
}

- (void)setSecond:(id)second {
    self->_second = second;
}

- (void)swap {
    id temp = self->_first;
    self->_first = self->_second;
    self->_second = temp;
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    self[index] = anObject;
}

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)index {
    switch (index) {
        case 0:
            self.first = obj;
            break;
        case 1:
            self.second = obj;
            break;
        default:
            @throw NSRangeException;
    }
}

- (void)setTuple:(NSATuple *)otherTuple {
    self.first = otherTuple.first;
    self.second = otherTuple.second;
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return [[NSATuple allocWithZone:zone] initWithFirst:self->_first second:self->_second];
}

@end


@implementation NSATriple

+ (instancetype)triple {
    return [[self alloc] init];
}

- (instancetype)initWithFirst:(id)first second:(id)second third:(id)third {
    self = [super init];
    if (self != nil) {
        self->_first = first;
        self->_second = second;
        self->_third = third;
    }
    return self;
}

+ (instancetype)tripleWithFirst:(id)first second:(id)second third:(id)third {
    return [[self alloc] initWithFirst:first second:second third:third];
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
    return self[index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    switch (index) {
        case 0:
            return self->_first;
        case 1:
            return self->_second;
        case 2:
            return self->_third;
    }
    @throw NSRangeException;
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

- (NSArray *)allObjects {
    return [NSArray arrayWithEnumerator:self];
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[NSAMutableTriple allocWithZone:zone] initWithFirst:self->_first second:self->_second third:self->_third];
}

#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len {
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
    self->_first = first;
}

- (void)setSecond:(id)second {
    self->_second = second;
}

- (void)setThird:(id)third {
    self->_third = third;
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    self[index] = anObject;
}

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)index {
    switch (index) {
        case 0:
            self.first = obj;
            break;
        case 1:
            self.second = obj;
            break;
        case 2:
            self.third = obj;
            break;
        default:
            @throw NSRangeException;
    }
}

- (void)setTriple:(NSATriple *)otherTriple {
    self.first = otherTriple.first;
    self.second = otherTriple.second;
    self.third = otherTriple.third;
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return [[NSATriple allocWithZone:zone] initWithFirst:self->_first second:self->_second third:self->_third];
}

@end
