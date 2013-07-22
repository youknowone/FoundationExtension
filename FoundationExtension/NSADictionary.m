//
//  NSADictionary.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 25..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import <cdebug/debug.h>
#import "NSADictionary.h"

@interface NSADictionary ()

- (id)initWithImplementationDelegate:(id)impl;
+ (id)dictionaryWithImplementationDelegate:(id)impl;

@end

@implementation NSADictionary

- (id)initWithImplementationDelegate:(id)impl {
    self = [super init];
    if (self != nil) {
        self->_impl = [impl retain];
    }
    return self;
}

+ (id)dictionaryWithImplementationDelegate:(id)impl {
    return [[[self alloc] initWithImplementationDelegate:impl] autorelease];
}

- (id)init {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSDictionary alloc] init];
    }
    return self;
}

- (id)initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSDictionary alloc] initWithObjects:objects forKeys:keys count:cnt];
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
        self->_impl = [[NSDictionary alloc] initWithCoder:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self->_impl encodeWithCoder:aCoder];
}

- (id)copyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationDelegate:[[self->_impl copyWithZone:zone] autorelease]];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationDelegate:[[self->_impl mutableCopyWithZone:zone] autorelease]];
}

- (NSUInteger)count {
    dassert(self->_impl);
    return [self->_impl count];
}

- (id)objectForKey:(id)aKey {
    dassert(self->_impl);
    return self->_impl[aKey];
}

- (NSEnumerator *)keyEnumerator {
    dassert(self->_impl);
    return [self->_impl keyEnumerator];
}

- (NSString *)descriptionInStringsFileFormat {
    return [self->_impl descriptionInStringsFileFormat];
}

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return [self->_impl descriptionWithLocale:locale indent:level];
}

@end


@interface NSAMutableDictionary ()

- (id)initWithImplementationDelegate:(id)impl;
+ (id)dictionaryWithImplementationDelegate:(id)impl;

@end

@implementation NSAMutableDictionary

- (id)initWithImplementationDelegate:(id)impl {
    self = [super init];
    if (self != nil) {
        self->_impl = [impl retain];
    }
    return self;
}

+ (id)dictionaryWithImplementationDelegate:(id)impl {
    return [[[self alloc] initWithImplementationDelegate:impl] autorelease];
}

- (id)init {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSMutableDictionary alloc] initWithObjects:objects forKeys:keys count:cnt];
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
        self->_impl = [[NSMutableDictionary alloc] initWithCoder:aDecoder];
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

- (id)objectForKey:(id)aKey {
    dassert(self->_impl);
    return self->_impl[aKey];
}

- (NSEnumerator *)keyEnumerator {
    dassert(self->_impl);
    return [self->_impl keyEnumerator];
}

- (NSString *)descriptionInStringsFileFormat {
    return [self->_impl descriptionInStringsFileFormat];
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
        self->_impl = [[NSMutableDictionary alloc] initWithCapacity:numItems];
    }
    return self;
}

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    dassert(self->_impl);
    self->_impl[aKey] = anObject;
}

- (void)removeObjectForKey:(id)aKey {
    dassert(self->_impl);
    [self->_impl removeObjectForKey:aKey];
}

@end
