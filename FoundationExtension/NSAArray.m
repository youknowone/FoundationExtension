//
//  NSAArray.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 24..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import <cdebug/debug.h>
#import "NSAArray.h"

@interface NSAArray ()

- (id)initWithImplementationDelegate:(id)impl;
+ (id)arrayWithImplementationDelegate:(id)impl;

@end


@implementation NSAArray

- (id)initWithImplementationDelegate:(id)impl {
    self = [super init];
    if (self != nil) {
        self->_impl = [impl retain];
    }
    return self;
}

+ (id)arrayWithImplementationDelegate:(id)impl {
    return [[[self alloc] initWithImplementationDelegate:impl] autorelease];
}

- (id)init {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSArray alloc] init];
    }
    return self;
}

- (id)initWithObjects:(const id [])objects count:(NSUInteger)cnt {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSArray alloc] initWithObjects:objects count:cnt];
    }
    return self;
}

- (void)dealloc {
    [self->_impl release];
    [super dealloc];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSArray alloc] initWithCoder:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self->_impl encodeWithCoder:aCoder];
}

- (NSUInteger)count {
    dassert(self->_impl);
    return [self->_impl count];
}

- (id)objectAtIndex:(NSUInteger)index {
    dassert(self->_impl);
    return self->_impl[index];
}

- (NSArray *)subarrayWithRange:(NSRange)range {
    NSAArray *result = [NSAArray arrayWithImplementationDelegate:[self->_impl subarrayWithRange:range]];
    return result;
}

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return [self->_impl descriptionWithLocale:locale indent:level];
}

- (id)copyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationDelegate:[[self->_impl copyWithZone:zone] autorelease]];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationDelegate:[[self->_impl mutableCopyWithZone:zone] autorelease]];
}

@end


@interface NSAMutableArray ()

- (id)initWithImplementationDelegate:(id)impl;
+ (id)arrayWithImplementationDelegate:(id)impl;

@end


@implementation NSAMutableArray

- (id)initWithImplementationDelegate:(id)impl {
    self = [super init];
    if (self != nil) {
        self->_impl = [impl retain];
    }
    return self;
}

+ (id)arrayWithImplementationDelegate:(id)impl {
    return [[[self alloc] initWithImplementationDelegate:impl] autorelease];
}

- (id)init {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)initWithObjects:(const id [])objects count:(NSUInteger)cnt {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSMutableArray alloc] initWithObjects:objects count:cnt];
    }
    return self;
}

- (void)dealloc {
    [self->_impl release];
    [super dealloc];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSMutableArray alloc] initWithCoder:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self->_impl encodeWithCoder:aCoder];
}

- (NSUInteger)count {
    dassert(self->_impl);
    return [self->_impl count];
}

- (id)objectAtIndex:(NSUInteger)index {
    dassert(self->_impl);
    return self->_impl[index];
}

- (NSArray *)subarrayWithRange:(NSRange)range {
    NSAArray *result = [NSAArray arrayWithImplementationDelegate:[self->_impl subarrayWithRange:range]];
    return result;
}

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return [self->_impl descriptionWithLocale:locale indent:level];
}

- (id)copyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationDelegate:[[self->_impl copyWithZone:zone] autorelease]];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationDelegate:[[self->_impl mutableCopyWithZone:zone] autorelease]];
}

// mutable methods

- (id)initWithCapacity:(NSUInteger)numItems {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSMutableArray alloc] initWithCapacity:numItems];
    }
    return self;
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    dassert(self->_impl);
    [self->_impl insertObject:anObject atIndex:index];
}

- (void)addObject:(id)anObject {
    dassert(self->_impl);
    [self->_impl addObject:anObject];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    dassert(self->_impl);
    [self->_impl removeObjectAtIndex:index];
}

- (void)removeLastObject {
    dassert(self->_impl);
    [self->_impl removeLastObject];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    dassert(self->_impl);
    self->_impl[index] = anObject;
}

@end
