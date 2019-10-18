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

- (instancetype)initWithImplementationDelegate:(id)impl;
+ (instancetype)arrayWithImplementationDelegate:(id)impl;

@end


@implementation NSAArray

- (instancetype)initWithImplementationDelegate:(id)impl {
    self = [super init];
    if (self != nil) {
        self->_impl = impl;
    }
    return self;
}

+ (instancetype)arrayWithImplementationDelegate:(id)impl {
    return [[self alloc] initWithImplementationDelegate:impl];
}

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSArray alloc] init];
    }
    return self;
}

- (instancetype)initWithObjects:(const id [])objects count:(NSUInteger)cnt {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSArray alloc] initWithObjects:objects count:cnt];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
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
    return [[[self class] alloc] initWithImplementationDelegate:[self->_impl copyWithZone:zone]];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationDelegate:[self->_impl mutableCopyWithZone:zone]];
}

@end


@interface NSAMutableArray ()

- (instancetype)initWithImplementationDelegate:(id)impl;
+ (instancetype)arrayWithImplementationDelegate:(id)impl;

@end


@implementation NSAMutableArray

- (instancetype)initWithImplementationDelegate:(id)impl {
    self = [super init];
    if (self != nil) {
        self->_impl = impl;
    }
    return self;
}

+ (instancetype)arrayWithImplementationDelegate:(id)impl {
    return [[self alloc] initWithImplementationDelegate:impl];
}

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithObjects:(const id [])objects count:(NSUInteger)cnt {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSMutableArray alloc] initWithObjects:objects count:cnt];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
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
    return [[[self class] alloc] initWithImplementationDelegate:[self->_impl copyWithZone:zone]];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationDelegate:[self->_impl mutableCopyWithZone:zone]];
}

// mutable methods

- (instancetype)initWithCapacity:(NSUInteger)numItems {
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
