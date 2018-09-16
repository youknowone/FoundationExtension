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

NS_ASSUME_NONNULL_BEGIN

@implementation NSData (NSURLRequest)

- (nullable instancetype)initWithContentsOfURLRequest:(NSURLRequest *)request {
    NSError *error = nil;
    NSData *data = [self initWithContentsOfURLRequest:request error:&error];
    if (error) {
        @throw error;
    }
    return data;
}

+ (nullable instancetype)dataWithContentsOfURLRequest:(NSURLRequest *)request {
    return [[self alloc] initWithContentsOfURLRequest:request];
}

- (nullable instancetype)initWithContentsOfURLRequest:(NSURLRequest *)request error:(out NSError **)error {
    NSURLSession *session = [NSURLSession sharedSession];
    __block NSData *data = nil;
    __block NSError *block_error = nil;
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *_data, NSURLResponse *response, NSError *pError) {
        data = _data;
        block_error = pError;
    }];
    [task resume];
    while (!data && !block_error) {
        usleep(1000);
    }
    if (error) {
        *error = block_error;
    }
    return [self initWithData:data];
}

+ (nullable instancetype)dataWithContentsOfURLRequest:(NSURLRequest *)request error:(out NSError **)error {
    return [[self alloc] initWithContentsOfURLRequest:request error:error];
}

- (nullable instancetype)initWithContentsOfURL:(NSURL *)url postBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPPostBody:bodyDictionary encoding:encoding];
    id result = [self initWithContentsOfURLRequest:request];
    return result;
}

+ (nullable instancetype)dataWithContentsOfURL:(NSURL *)url postBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding {
    return [[self alloc] initWithContentsOfURL:url postBody:bodyDictionary encoding:encoding];
}

@end


@implementation NSArray (NSURLRequest)

- (nullable instancetype)initWithContentsOfURLRequest:(NSURLRequest *)request {
    return [self initWithContentsOfURLRequest:request format:NULL error:NULL];
}

+ (nullable instancetype)arrayWithContentsOfURLRequest:(NSURLRequest *)request {
    return [[self alloc] initWithContentsOfURLRequest:request format:NULL error:NULL];
}

- (nullable instancetype)initWithContentsOfURLRequest:(NSURLRequest *)request format:(NSPropertyListFormat *_Nullable)format error:(out NSError **)error {
    NSData *data = [NSData dataWithContentsOfURLRequest:request error:error];
    if (data == nil) {
        return nil;
    }
    return [self initWithData:data format:format error:error];
}

+ (nullable instancetype)arrayWithContentsOfURLRequest:(NSURLRequest *)request format:(NSPropertyListFormat *_Nullable)format error:(out NSError **)error {
    return [[self alloc] initWithContentsOfURLRequest:request format:format error:error];
}

@end


@implementation NSDictionary (NSURLRequest)

- (nullable instancetype)initWithContentsOfURLRequest:(NSURLRequest *)request {
    return [self initWithContentsOfURLRequest:request format:NULL error:NULL];
}

+ (nullable instancetype)dictionaryWithContentsOfURLRequest:(NSURLRequest *)request {
    return [[self alloc] initWithContentsOfURLRequest:request format:NULL error:NULL];
}

- (nullable instancetype)initWithContentsOfURLRequest:(NSURLRequest *)request format:(NSPropertyListFormat *_Nullable)format error:(out NSError **)error {
    NSData *data = [NSData dataWithContentsOfURLRequest:request error:error];
    if (data == nil) {
        return nil;
    }
    return [self initWithData:data format:format error:error];
}

+ (nullable instancetype)dictionaryWithContentsOfURLRequest:(NSURLRequest *)request format:(NSPropertyListFormat *_Nullable)format error:(out NSError **)error {
    return [[self alloc] initWithContentsOfURLRequest:request format:format error:error];
}

@end

NS_ASSUME_NONNULL_END
