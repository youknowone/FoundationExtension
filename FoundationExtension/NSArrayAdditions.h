//
//  NSArrayAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 11. 1. 25..
//  Copyright 2011 youknowone.org All rights reserved.
//

@interface NSArray (FoundationExtensionCreation)

- (id)initWithData:(NSData *)data;
+ (id)arrayWithData:(NSData *)data;

- (id)initWithData:(NSData *)data options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError **)error NS_AVAILABLE(10_6, 4_0);
+ (id)arrayWithData:(NSData *)data options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError **)error NS_AVAILABLE(10_6, 4_0);
- (id)initWithEnumerator:(NSEnumerator *)enumerator;
+ (id)arrayWithEnumerator:(NSEnumerator *)enumerator;

- (id)initWithContentsOfURLRequest:(NSURLRequest *)request;
+ (id)arrayWithContentsOfURLRequest:(NSURLRequest *)request;

- (id)initWithContentsOfURLRequest:(NSURLRequest *)request options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError **)error;
+ (id)arrayWithContentsOfURLRequest:(NSURLRequest *)request options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError **)error;

@end

@interface NSArray (FoundationExtensionPremitive)

- (NSInteger)integerAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfInteger:(NSInteger)value;

@end

@interface NSMutableArray (FoundationExtensionPremitive)

- (void)addInteger:(NSInteger)value;
- (void)insertInteger:(NSInteger)value atIndex:(NSUInteger)index;

@end