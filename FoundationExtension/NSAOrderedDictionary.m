//
//  NSAOrderedDictionary.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 11. 4..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import <cdebug/debug.h>
#import "NSAOrderedDictionary.h"

@interface NSAOrderedDictionary ()

- (id)initWithImplementationOrder:(id)order dictionary:(id)impl;
+ (id)dictionaryWithImplementationOrder:(id)order dictionary:(id)impl;

@end

@implementation NSAOrderedDictionary

- (id)initWithImplementationOrder:(id)order dictionary:(id)impl {
    self = [super init];
    if (self != nil) {
        self->_order = [order retain];
        self->_impl = [impl retain];
    }
    return self;
}

+ (id)dictionaryWithImplementationOrder:(id)order dictionary:(id)impl {
    return [[[self alloc] initWithImplementationOrder:order dictionary:impl] autorelease];
}

- (id)initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    self = [super init];
    if (self != nil) {
        self->_order = [[NSOrderedSet alloc] initWithObjects:objects count:cnt];
        self->_impl = [[NSDictionary alloc] initWithObjects:objects forKeys:keys count:cnt];
    }
    return self;
}

- (void)dealloc {
    [self->_order release];
    [self->_impl release];
    [super dealloc];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self != nil) {
        self->_order = [[NSOrderedSet alloc] initWithCoder:aDecoder];
        self->_impl = [[NSDictionary alloc] initWithCoder:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self->_order encodeWithCoder:aCoder];
    [self->_impl encodeWithCoder:aCoder];
}

- (id)copyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationOrder:[[self->_order copyWithZone:zone] autorelease] dictionary:[[self->_impl copyWithZone:zone] autorelease]];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationOrder:[[self->_order mutableCopyWithZone:zone] autorelease] dictionary:[[self->_impl mutableCopyWithZone:zone] autorelease]];
}

- (NSUInteger)count {
    dassert(self->_impl);
    return [self->_order count];
}

- (id)objectForKey:(id)aKey {
    dassert(self->_impl);
    return self->_impl[aKey];
}

- (NSEnumerator *)keyEnumerator {
    dassert(self->_impl);
    return [self->_order objectEnumerator];
}

- (NSString *)descriptionInStringsFileFormat {
    return [self->_impl descriptionInStringsFileFormat];
}

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return [self->_impl descriptionWithLocale:locale indent:level];
}


- (id)keyAtIndex:(NSUInteger)index {
    return self->_order[index];
}

- (id)objectAtIndex:(NSUInteger)index {
    return self->_impl[[self keyAtIndex:index]];
}

- (NSUInteger)indexOfKey:(id)key {
    return [self->_order indexOfObject:key];
}

- (NSEnumerator *)reversedKeyEnumerator {
    return [self->_order reverseObjectEnumerator];
}

@end


@interface NSAMutableOrderedDictionary ()

- (id)initWithImplementationOrder:(id)order dictionary:(id)impl;
+ (id)dictionaryWithImplementationOrder:(id)order dictionary:(id)impl;

@end

@implementation NSAMutableOrderedDictionary

- (id)initWithImplementationOrder:(id)order dictionary:(id)impl {
    self = [super init];
    if (self != nil) {
        self->_order = [order retain];
        self->_impl = [impl retain];
    }
    return self;
}

+ (id)dictionaryWithImplementationOrder:(id)order dictionary:(id)impl {
    return [[[self alloc] initWithImplementationOrder:order dictionary:impl] autorelease];
}

- (id)init {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSMutableDictionary alloc] init];
        self->_order = [[NSMutableOrderedSet alloc] init];
    }
    return self;
}

- (id)initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSMutableDictionary alloc] initWithObjects:objects forKeys:keys count:cnt];
        self->_order = [[NSMutableOrderedSet alloc] initWithObjects:keys count:cnt];
    }
    return self;
}

- (void)dealloc {
    [self->_impl release];
    [self->_order release];
    [super dealloc];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self != nil) {
        self->_order = [[NSMutableOrderedSet alloc] initWithCoder:aDecoder];
        self->_impl = [[NSMutableDictionary alloc] initWithCoder:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self->_order encodeWithCoder:aCoder];
    [self->_impl encodeWithCoder:aCoder];
}

- (NSUInteger)count {
    dassert(self->_impl);
    return [self->_order count];
}

- (id)objectForKey:(id)aKey {
    dassert(self->_impl);
    return self->_impl[aKey];
}

- (NSEnumerator *)keyEnumerator {
    dassert(self->_impl);
    return [self->_order objectEnumerator];
}

- (NSString *)descriptionInStringsFileFormat {
    return [self->_impl descriptionInStringsFileFormat];
}

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return [self->_impl descriptionWithLocale:locale indent:level];
}

- (id)copyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationOrder:[[self->_order copyWithZone:zone] autorelease] dictionary:[[self->_impl copyWithZone:zone] autorelease]];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationOrder:[[self->_order mutableCopyWithZone:zone] autorelease] dictionary:[[self->_impl mutableCopyWithZone:zone] autorelease]];
}

// mutable methods

- (id)initWithCapacity:(NSUInteger)numItems {
    self = [super init];
    if (self != nil) {
        self->_order = [[NSMutableOrderedSet alloc] initWithCapacity:numItems];
        self->_impl = [[NSMutableDictionary alloc] initWithCapacity:numItems];
    }
    return self;
}

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    dassert(self->_impl);
    [self->_order addObject:aKey];
    self->_impl[aKey] = anObject;
}

- (void)removeObjectForKey:(id)aKey {
    dassert(self->_impl);
    [self->_order removeObject:aKey];
    [self->_impl removeObjectForKey:aKey];
}

- (id)keyAtIndex:(NSUInteger)index {
    return self->_order[index];
}

- (id)objectAtIndex:(NSUInteger)index {
    return self->_impl[[self keyAtIndex:index]];
}

- (NSUInteger)indexOfKey:(id)key {
    return [self->_order indexOfObject:key];
}

- (NSEnumerator *)reversedKeyEnumerator {
    return [self->_order reverseObjectEnumerator];
}


@end
