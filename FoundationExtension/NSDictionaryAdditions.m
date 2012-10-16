//
//  NSDictionaryAdditions.m
//  FoundationExtension
//
//  Created by youknowone on 11. 1. 24..
//  Copyright 2011 youknowone.org All rights reserved.
//

#import "NSPathUtilitiesAddtions.h"
#import "NSDataAdditions.h"
#import "NSDictionaryAdditions.h"

@implementation NSDictionary (FoundationExtension)

- (id) initWithData:(NSData *)data {
	return [self initWithData:data options:0 format:NULL error:NULL];
}

+ (id) dictionaryWithData:(NSData *)data {
	return [[[self alloc] initWithData:data] autorelease];
}

- (id) initWithData:(NSData *)data options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError **)error {
	NSDictionary *contents;
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
	return [self initWithDictionary:contents];
}

+ (id) dictionaryWithData:(NSData *)data options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError **)error {
	return [[[self alloc] initWithData:data options:opt format:format error:error] autorelease];
}

- (id) initWithContentsOfURLRequest:(NSURLRequest *)request {
	return [self initWithContentsOfURLRequest:request options:0 format:NULL error:NULL];
}

+ (id) dictionaryWithContentsOfURLRequest:(NSURLRequest *)request {
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

+ (id) dictionaryWithContentsOfURLRequest:(NSURLRequest *)request options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError **)error {
	return [[[self alloc] initWithContentsOfURLRequest:request options:opt format:format error:error] autorelease];
}

@end
