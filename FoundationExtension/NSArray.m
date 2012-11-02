//
//  NSArray.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 11. 1. 25..
//  Copyright 2011 youknowone.org All rights reserved.
//

#import "NSData.h"
#import "NSArray.h"

@implementation NSArray (Creations)

- (id) initWithData:(NSData *)data {
    return [self initWithData:data format:NULL error:NULL];
}

+ (id) arrayWithData:(NSData *)data {
    return [[[self alloc] initWithData:data] autorelease];
}

- (id) initWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error {
    NSArray *contents = [data propertyListObjectUsingFormat:format error:error];
    if (contents == nil) {
        [self release];
        return nil;
    }
    return [self initWithArray:contents];
}

+ (id) arrayWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error {
    return [[[self alloc] initWithData:data format:format error:error] autorelease];
}

- (id)initWithEnumerator:(id<NSFastEnumeration>)enumerator {
    return [self initWithEnumerator:enumerator copyItems:NO];
}

+ (id)arrayWithEnumerator:(id<NSFastEnumeration>)enumerator {
    return [[[self alloc] initWithEnumerator:enumerator] autorelease];
}

- (id)initWithEnumerator:(id<NSFastEnumeration>)enumerator copyItems:(BOOL)flag {
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

@implementation NSMutableArray (Creations)

- (id)initWithEnumerator:(NSEnumerator *)enumerator copyItems:(BOOL)flag {
    if (flag) {
        for (id object in enumerator) {
            [self addObject:object];
        }
    } else {
        for (id object in enumerator) {
            id newObject = [object copy];
            [self addObject:newObject];
            [newObject release];
        }
    }
    return self;
}

@end


@implementation NSArray (NSNumber)

- (NSInteger)integerAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] integerValue];
}

- (NSUInteger)indexOfInteger:(NSInteger)value {
    return [self indexOfObject:[NSNumber numberWithInteger:value]];
}

@end


@implementation NSMutableArray (NSNumber)

- (void)addInteger:(NSInteger)value {
    [self addObject:[NSNumber numberWithInteger:value]];
}

- (void)insertInteger:(NSInteger)value atIndex:(NSUInteger)index {
    [self insertObject:[NSNumber numberWithInteger:value] atIndex:index];
}

@end
