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
	return [self initWithData:data options:0 format:NULL error:NULL];
}

+ (id) arrayWithData:(NSData *)data {
	return [[[self alloc] initWithData:data] autorelease];
}

- (id) initWithData:(NSData *)data options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError **)error {
	NSArray *contents;
	//TODO: check deployment version
	if ( [NSPropertyListSerialization respondsToSelector:@selector(propertyListWithData:options:format:error:)] ) {
		contents = [NSPropertyListSerialization propertyListWithData:data options:opt format:format error:error];
	} else { // support os < osx10.6 or ios4.0
		contents = [NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
	}
	if (contents==nil) {
		[self release];
		return nil;
	}
	return [self initWithArray:contents];
}

+ (id) arrayWithData:(NSData *)data options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError **)error {
	return [[[self alloc] initWithData:data options:opt format:format error:error] autorelease];
}

- (id)initWithEnumerator:(NSEnumerator *)enumerator {
    NSMutableArray *array = [NSMutableArray array];
    for (id e in enumerator) {
        [array addObject:e];
    }
    return [self initWithArray:array];
}

+ (id)arrayWithEnumerator:(NSEnumerator *)enumerator {
    return [[[self alloc] initWithEnumerator:enumerator] autorelease];
}

- (id) initWithContentsOfURLRequest:(NSURLRequest *)request {
	return [self initWithContentsOfURLRequest:request options:0 format:NULL error:NULL];
}

+ (id) arrayWithContentsOfURLRequest:(NSURLRequest *)request {
	return [[[self alloc] initWithContentsOfURLRequest:request options:0 format:NULL error:NULL] autorelease];
}

- (id) initWithContentsOfURLRequest:(NSURLRequest *)request options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError **)error {
	NSData *data = [NSData dataWithContentsOfURLRequest:request error:error];
	if (data == nil) {
		[self release];
		return nil;
	}
	return [self initWithData:data options:opt format:format error:error];
}

+ (id) arrayWithContentsOfURLRequest:(NSURLRequest *)request options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError **)error {
	return [[[self alloc] initWithContentsOfURLRequest:request options:opt format:format error:error] autorelease];
}

@end

@implementation NSArray (FoundationExtensionPremitive)

- (NSInteger)integerAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] integerValue];
}

- (NSUInteger)indexOfInteger:(NSInteger)value {
    return [self indexOfObject:[NSNumber numberWithInteger:value]];
}

@end

@implementation NSMutableArray (FoundationExtensionPremitive)

- (void)addInteger:(NSInteger)value {
    [self addObject:[NSNumber numberWithInteger:value]];
}

- (void)insertInteger:(NSInteger)value atIndex:(NSUInteger)index {
    [self insertObject:[NSNumber numberWithInteger:value] atIndex:index];
}

@end
