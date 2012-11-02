//
//  NSURLRequestCreations.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 11. 2..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import "NSData.h"
#import "NSArray.h"
#import "NSDictionary.h"

#import "NSURLRequest.h"
#import "NSURLRequestCreations.h"

@implementation NSData (NSURLRequest)

- (id)initWithContentsOfURLRequest:(NSURLRequest *)request {
    return [self initWithData:[NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL]];
}

+ (NSData *)dataWithContentsOfURLRequest:(NSURLRequest *)request {
    return [[[self alloc] initWithContentsOfURLRequest:request] autorelease];
}

- (id)initWithContentsOfURLRequest:(NSURLRequest *)request error:(NSError **)error {
    return [self initWithData:[NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:error]];
}

+ (NSData *)dataWithContentsOfURLRequest:(NSURLRequest *)request error:(NSError **)error {
    return [[[self alloc] initWithContentsOfURLRequest:request error:error] autorelease];
}

- (id)initWithContentsOfURL:(NSURL *)url postBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPPostBody:bodyDictionary encoding:encoding];
    id result = [self initWithData:[NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL]];
    [request release];
    return result;
}

+ (NSData *)dataWithContentsOfURL:(NSURL *)url postBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding {
    return [[[self alloc] initWithContentsOfURL:url postBody:bodyDictionary encoding:encoding] autorelease];
}

@end


@implementation NSArray (NSURLRequest)

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


@implementation NSDictionary (NSURLRequest)

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
