//
//  NSAString.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 25..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import "NSAString.h"

#include "debug.h"

@interface NSAString ()

- (instancetype)initWithImplementationDelegate:(id)impl;
+ (instancetype)stringWithImplementationDelegate:(id)impl;

@end

@implementation NSAString

- (instancetype)initWithImplementationDelegate:(id)impl {
    self = [super init];
    if (self != nil) {
        self->_impl = impl;
    }
    return self;
}

+ (instancetype)stringWithImplementationDelegate:(id)impl {
    return [[self alloc] initWithImplementationDelegate:impl];
}

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSString alloc] init];
    }
    return self;
}

- (instancetype)initWithCharactersNoCopy:(unichar *)characters length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSString alloc] initWithCharactersNoCopy:characters length:length freeWhenDone:freeBuffer];
    }
    return self;
}

- (instancetype)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding freeWhenDone:(BOOL)freeBuffer {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSString alloc] initWithBytesNoCopy:bytes length:len encoding:encoding freeWhenDone:freeBuffer];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSString alloc] initWithCoder:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self->_impl encodeWithCoder:aCoder];
}


- (NSUInteger)length {
    dassert(self->_impl);
    return [self->_impl length];
}

- (unichar)characterAtIndex:(NSUInteger)index {
    dassert(self->_impl);
    return [self->_impl characterAtIndex:index];
}

- (void)getCharacters:(unichar *)buffer range:(NSRange)aRange {
    dassert(self->_impl);
    return [self->_impl getCharacters:buffer range:aRange];
}

- (NSString *)substringWithRange:(NSRange)range {
    NSAString *result = [NSAString stringWithImplementationDelegate:[self->_impl substringWithRange:range]];
    return result;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationDelegate:[self->_impl copyWithZone:zone]];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationDelegate:[self->_impl mutableCopyWithZone:zone]];
}

- (NSString *)description {
    return [self->_impl description];
}

@end


@interface NSAMutableString ()

- (instancetype)initWithImplementationDelegate:(id)impl;
+ (instancetype)stringWithImplementationDelegate:(id)impl;

@end

@implementation NSAMutableString

- (instancetype)initWithImplementationDelegate:(id)impl {
    self = [super init];
    if (self != nil) {
        self->_impl = impl;
    }
    return self;
}

+ (instancetype)stringWithImplementationDelegate:(id)impl {
    return [[self alloc] initWithImplementationDelegate:impl];
}

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSMutableString alloc] init];
    }
    return self;
}

- (instancetype)initWithCharactersNoCopy:(unichar *)characters length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSMutableString alloc] initWithCharactersNoCopy:characters length:length freeWhenDone:freeBuffer];
    }
    return self;
}

- (instancetype)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding freeWhenDone:(BOOL)freeBuffer {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSMutableString alloc] initWithBytesNoCopy:bytes length:len encoding:encoding freeWhenDone:freeBuffer];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self != nil) {
        self->_impl = [[NSMutableString alloc] initWithCoder:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self->_impl encodeWithCoder:aCoder];
}


- (NSUInteger)length {
    dassert(self->_impl);
    return [self->_impl length];
}

- (unichar)characterAtIndex:(NSUInteger)index {
    dassert(self->_impl);
    return [self->_impl characterAtIndex:index];
}

- (void)getCharacters:(unichar *)buffer range:(NSRange)aRange {
    dassert(self->_impl);
    return [self->_impl getCharacters:buffer range:aRange];
}

- (NSString *)substringWithRange:(NSRange)range {
    NSAMutableString *result = [NSAMutableString stringWithImplementationDelegate:[self->_impl substringWithRange:range]];
    return result;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationDelegate:[self->_impl copyWithZone:zone]];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[[self class] alloc] initWithImplementationDelegate:[self->_impl mutableCopyWithZone:zone]];
}

- (NSString *)description {
    return [self->_impl description];
}

// mutable implementation

- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    dassert(self->_impl);
    [self->_impl replaceCharactersInRange:range withString:aString];
}

@end
