//
//  NSAEnumerator.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 2014. 9. 21..
//  Copyright (c) 2014년 youknowone.org. All rights reserved.
//

#import "NSAEnumerator.h"


@implementation NSAInfiniteEnumerator

#if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
    #define memset_pattern memset_pattern8
#else
    #define memset_pattern memset_pattern4
#endif

- (instancetype)init {
    return [self initWithObject:[NSNull null]];
}

- (instancetype)initWithObject:(id)object {
    self = [super init];
    [object retain];
    for (int i = 0; i < 16; i++) {
        self->_pool[i] = object;
    }
    return self;
}

+ (instancetype)enumeratorWithObject:(id)object {
    return [[[self alloc] initWithObject:object] autorelease];
}

- (void)dealloc {
    [self->_pool[0] release];
    [super dealloc];
}

+ (instancetype)infiniteEnumerator {
    return [[[self alloc] init] autorelease];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id [])buffer count:(NSUInteger)len {
    if (state->state == 0) {
        state->itemsPtr = buffer;
        state->mutationsPtr = &state->extra[0];
        memcpy(buffer, self->_pool, 16 * sizeof(id));
        state->state = 1;
    }
    return 16;
}

@end


@implementation NSARangeEnumerator

- (instancetype)init {
    self = [self initWithCount:0];
    return self;
}

- (instancetype)initWithCount:(NSUInteger)count {
    self = [self initWithRange:NSMakeRange(0, count)];
    return self;
}

- (instancetype)initWithRange:(NSRange)range {
    self = [super init];
    if (self != nil) {
        self->_range = range;
    }
    return self;
}

+ (instancetype)enumeratorWithCount:(NSUInteger)count {
    return [[[self alloc] initWithCount:count] autorelease];
}

+ (instancetype)enumeratorWithRange:(NSRange)range {
    return [[[self alloc] initWithRange:range] autorelease];
}

#pragma mark - NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id [])buffer count:(NSUInteger)len {
    if(state->state == 0) {
        state->mutationsPtr = &state->extra[0];
        state->itemsPtr = buffer;
        state->state = self->_range.location;
    }

    NSUInteger cursor = state->state;
    NSUInteger endpoint = self->_range.location + self->_range.length;

    NSUInteger count = 0;
    for (; count < len && cursor < endpoint; count++, cursor++) {
        buffer[count] = @(cursor);
    }
    state->state = cursor;
    return count;
}

@end


@implementation NSABlockEnumerator

@synthesize block=_block;

- (id)init {
    [self release];
    return nil;
}

- (instancetype)initWithBlock:(NSABlockEnumeration)aBlock {
    self = [super init];
    if (self != nil) {
        self.block = aBlock;
    }
    return self;
}

+ (instancetype)enumeratorWithBlock:(NSABlockEnumeration)block {
    return [[[self alloc] initWithBlock:block] autorelease];
}

- (void)dealloc {
    self.block = nil;
    [super dealloc];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id [])buffer count:(NSUInteger)len {
    if (state->state == NSNotFound) {
        return 0;
    }
    if (state->state == 0) {
        state->mutationsPtr = &state->extra[1];
        state->itemsPtr = buffer;
        state->extra[0] = 0;
    }

    NSUInteger index = state->extra[0];
    NSUInteger count = 0;
    BOOL stop = NO;
    for (; count < len && stop == NO; count++, index++) {
        buffer[count] = self.block(index, &stop);
        state->state += 1;
    }
    if (stop != NO) {
        state->state = NSNotFound;
    }
    state->extra[0] = index;
    return count;
}

@end
