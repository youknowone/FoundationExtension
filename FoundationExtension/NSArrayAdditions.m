//
//  NSArrayAdditions.m
//  FoundationExtension
//
//  Created by youknowone on 11. 1. 25..
//  Copyright 2011 youknowone.org All rights reserved.
//

#import "NSPathUtilitiesAddtions.h"
#import "NSDataAdditions.h"
#import "NSArrayAdditions.h"

@implementation NSArray (FoundationExtension)

- (id) initWithData:(NSData *)data {
    return [self initWithData:data format:NULL error:NULL];
}

+ (id) arrayWithData:(NSData *)data {
    return [[[self alloc] initWithData:data] autorelease];
}

- (id) initWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error {
    NSArray *contents;
    //TODO: check deployment version
    if ( [NSPropertyListSerialization respondsToSelector:@selector(propertyListWithData:options:format:error:)] ) {
        contents = [NSPropertyListSerialization propertyListWithData:data options:0 format:format error:error];
    } else { // support os < osx10.6 or ios4.0
        contents = [NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
    }
    if (contents==nil) {
        [self release];
        return nil;
    }
    return [self initWithArray:contents];
}

+ (id) arrayWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error {
    return [[[self alloc] initWithData:data format:format error:error] autorelease];
}

- (id)initWithEnumerator:(NSEnumerator *)enumerator {
    return [self initWithEnumerator:enumerator copyItems:NO];
}

+ (id)arrayWithEnumerator:(NSEnumerator *)enumerator {
    return [[[self alloc] initWithEnumerator:enumerator] autorelease];
}

- (id)initWithEnumerator:(NSEnumerator *)enumerator copyItems:(BOOL)flag {
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

- (id)initWithContentsOfURLRequest:(NSURLRequest *)request {
    return [self initWithContentsOfURLRequest:request format:NULL error:NULL];
}

+ (id)arrayWithContentsOfURLRequest:(NSURLRequest *)request {
    return [[[self alloc] initWithContentsOfURLRequest:request format:NULL error:NULL] autorelease];
}

- (id)initWithContentsOfURLRequest:(NSURLRequest *)request format:(NSPropertyListFormat *)format error:(NSError **)error {
    NSData *data = [NSData dataWithContentsOfURLRequest:request error:error];
    if (data == nil) {
        [self release];
        return nil;
    }
    return [self initWithData:data format:format error:error];
}

+ (id)arrayWithContentsOfURLRequest:(NSURLRequest *)request format:(NSPropertyListFormat *)format error:(NSError **)error {
    return [[[self alloc] initWithContentsOfURLRequest:request format:format error:error] autorelease];
}

@end

@implementation NSMutableArray (FoundationExtensionCreation)

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


@implementation NSArray (FoundationExtensionNSNumber)

- (NSInteger)integerAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] integerValue];
}

- (NSUInteger)indexOfInteger:(NSInteger)value {
    return [self indexOfObject:[NSNumber numberWithInteger:value]];
}

@end


@implementation NSMutableArray (FoundationExtensionNSNumber)

- (void)addInteger:(NSInteger)value {
    [self addObject:[NSNumber numberWithInteger:value]];
}

- (void)insertInteger:(NSInteger)value atIndex:(NSUInteger)index {
    [self insertObject:[NSNumber numberWithInteger:value] atIndex:index];
}

@end
