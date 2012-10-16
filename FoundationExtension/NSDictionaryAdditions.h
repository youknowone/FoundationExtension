//
//  NSDictionaryAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 11. 1. 24..
//  Copyright 2011 youknowone.org All rights reserved.
//

@interface NSDictionary (FoundationExtension)

- (id)initWithData:(NSData *)data;
+ (id)dictionaryWithData:(NSData *)data;

- (id)initWithData:(NSData *)data options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError **)error;// NS_AVAILABLE(10_6, 4_0);
+ (id)dictionaryWithData:(NSData *)data options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError **)error;// NS_AVAILABLE(10_6, 4_0);

- (id)initWithContentsOfURLRequest:(NSURLRequest *)request;
+ (id)dictionaryWithContentsOfURLRequest:(NSURLRequest *)request;

- (id)initWithContentsOfURLRequest:(NSURLRequest *)request options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError **)error;
+ (id)dictionaryWithContentsOfURLRequest:(NSURLRequest *)request options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError **)error;

@end
