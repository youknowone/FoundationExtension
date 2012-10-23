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

@implementation NSDictionary (FoundationExtensionCreation)

- (id)initWithData:(NSData *)data {
    return [self initWithData:data format:NULL error:NULL];
}

+ (id)dictionaryWithData:(NSData *)data {
    return [[[self alloc] initWithData:data] autorelease];
}

- (id)initWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error {
    NSDictionary *contents = [data propertyListObjectUsingFormat:format error:error];
    if (contents == nil) {
        [self release];
        return nil;
    }
    return [self initWithDictionary:contents];
}

+ (id)dictionaryWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error {
    return [[[self alloc] initWithData:data format:format error:error] autorelease];
}

- (id)initWithContentsOfURLRequest:(NSURLRequest *)request {
    return [self initWithContentsOfURLRequest:request format:NULL error:NULL];
}

+ (id)dictionaryWithContentsOfURLRequest:(NSURLRequest *)request {
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

+ (id)dictionaryWithContentsOfURLRequest:(NSURLRequest *)request format:(NSPropertyListFormat *)format error:(NSError **)error {
    return [[[self alloc] initWithContentsOfURLRequest:request format:format error:error] autorelease];
}

@end


@implementation NSDictionary (FoundationExtensionShortcuts)

- (BOOL)containsKey:(id)key {
    return [self.allKeys containsObject:key];
}

@end
