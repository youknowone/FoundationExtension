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

- (instancetype)initWithObject:(id)object count:(NSUInteger)count {
    id *objects = malloc(sizeof(id) * count);
    for (NSUInteger i = 0; i < count; i++) {
        objects[i] = object;
    }
    self = [self initWithObjects:objects count:count];
    free(objects);
    return self;
}

+ (instancetype)arrayWithObject:(id)object count:(NSUInteger)count {
    return [[[self alloc] initWithObject:object count:count] autorelease];
}

- (instancetype)initWithObjectCopy:(id)object count:(NSUInteger)count mutable:(BOOL)flag {
    id *objects = malloc(sizeof(id) * count);
    if (flag) {
        for (NSUInteger i = 0; i < count; i++) {
            objects[i] = [object mutableCopy];
        }
    } else {
        for (NSUInteger i = 0; i < count; i++) {
            objects[i] = [object copy];
        }
    }
    return [self initWithObjects:objects count:count];
}

- (NSArray *)subarrayFromIndex:(NSUInteger)index {
    return [self subarrayWithRange:NSMakeRange(index, self.count - index)];
}

- (NSArray *)subarrayToIndex:(NSUInteger)index {
    return [self subarrayWithRange:NSMakeRange(0, index)];
}

- (NSArray *)subarrayFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    return [self subarrayWithRange:NSMakeRange(fromIndex, toIndex - fromIndex)];
}

- (NSArray *)subarrayFromIndex:(NSUInteger)fromIndex length:(NSUInteger)length {
    return [self subarrayWithRange:NSMakeRange(fromIndex, length)];
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
        return nil;
    }
    return self[arc4random_uniform((u_int32_t)count)];
}

- (NSArray *)randomObjectsOfCount:(NSUInteger)aCount {
    NSUInteger count = self.count;
    // FIXME: slow - reimplement with objectsAtIndexes
    NSMutableArray *copy = [self mutableCopy];
    NSMutableArray *selected = [NSMutableArray array];

    for (NSUInteger i = 0; i < MIN(aCount, count); i ++) {
        NSUInteger index = arc4random_uniform((uint32_t)(aCount - i));
        [selected addObject:copy[index]];
        [copy removeObjectAtIndex:index];
    }

    [copy release];
    return selected;
}

- (NSArray *)shuffledArray {
    return [self randomObjectsOfCount:self.count];
}

@end


@implementation NSMutableArray (Random)

- (id)removeRandomObject {
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
        [self addObject:[pool removeRandomObject]];
    }
    [pool release];
}

@end


@implementation NSArray (Deprecated)

- (id):(NSUInteger)index {
    return self[index];
}

@end


@implementation NSMutableArray (Deprecated)

- (id)popRandomObject {
    return [self removeRandomObject];
}

@end
