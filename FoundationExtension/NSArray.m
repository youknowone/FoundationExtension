//
//  NSArray.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 11. 1. 25..
//  Copyright 2011 youknowone.org All rights reserved.
//

#import "NSData.h"

#import "NSArray.h"

@implementation NSArray (Shortcuts)

- (BOOL)hasIndex:(NSUInteger)index {
    return index < self.count;
}

@end


@implementation NSArray (Creations)

- (instancetype)initWithData:(NSData *)data {
    return [self initWithData:data format:NULL error:NULL];
}

+ (instancetype)arrayWithData:(NSData *)data {
    return [[[self alloc] initWithData:data] autorelease];
}

- (instancetype)initWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error {
    NSArray *contents = [data propertyListObjectUsingFormat:format error:error];
    if (contents == nil) {
        [self release];
        return nil;
    }
    return [self initWithArray:contents];
}

+ (instancetype)arrayWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error {
    return [[[self alloc] initWithData:data format:format error:error] autorelease];
}

- (instancetype)initWithEnumerator:(id<NSFastEnumeration>)enumerator {
    return [self initWithEnumerator:enumerator copyItems:NO];
}

+ (instancetype)arrayWithEnumerator:(id<NSFastEnumeration>)enumerator {
    return [[[self alloc] initWithEnumerator:enumerator] autorelease];
}

- (instancetype)initWithEnumerator:(id<NSFastEnumeration>)enumerator copyItems:(BOOL)flag {
    NSMutableArray *array = [NSMutableArray array];
    if (flag) {
        for (id object in enumerator) {
            [array addObject:object];
        }
    } else {
        for (id object in enumerator) {
            id newObject = [object copy];
            [array addObject:newObject];
            [newObject release];
        }
    }
    return [self initWithArray:array];
}

@end


@implementation NSMutableArray (Rearrange)

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    id obj = self[fromIndex];
    [obj retain];
    [self removeObjectAtIndex:fromIndex];
    [self insertObject:obj atIndex:toIndex];
    [obj release];
}

@end


@implementation NSArray (NSNumber)

- (NSInteger)integerAtIndex:(NSUInteger)index {
    return [self[index] integerValue];
}

- (NSUInteger)indexOfInteger:(NSInteger)value {
    return [self indexOfObject:@(value)];
}

@end


@implementation NSArray (Random)

- (id)randomObject {
    NSUInteger count = self.count;
    if (count == 0) {
        return self[0]; // raise index error
    }
    return self[arc4random_uniform((u_int32_t)count)];
}

- (NSArray *)randomObjectsOfCount:(NSUInteger)theCount {
    NSUInteger count = self.count;
    if (theCount > count) {
        [self objectAtIndex:count]; // NOTE: to raise proper exception
        return nil;
    }
    // FIXME: slow - reimplement with objectsAtIndexes
    NSMutableArray *copy = [self mutableCopy];
    NSMutableArray *selected = [NSMutableArray array];

    for (NSUInteger i = 0; i < theCount; i ++) {
        NSUInteger index = arc4random_uniform((uint32_t)(theCount - i));
        [selected addObject:copy[index]];
        [copy removeObjectAtIndex:index];
    }

    [copy release];
    return selected;
}

@end


@implementation NSMutableArray (Random)

- (id)popRandomObject {
    NSUInteger count = self.count;
    if (count == 0) {
        return self[0]; // raise index error
    }
    uint32_t index = arc4random_uniform((uint32_t)count);
    id result = [self[index] retain];
    [self removeObjectAtIndex:index];
    return [result autorelease];
}

- (void)shuffle {
    NSMutableArray *pool = [self mutableCopy];
    [self removeAllObjects];
    while (pool.count) {
        [self addObject:[pool popRandomObject]];
    }
    [pool release];
}

@end


@implementation NSArray (Deprecated)

- (id):(NSUInteger)index {
    return self[index];
}

@end
