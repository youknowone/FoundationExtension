//
//  NSURLRequest.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSString.h"
#import "NSData.h"
#import "NSURL.h"
#import "NSURLRequest.h"

@implementation NSURLRequest (Properties)

@dynamic cachePolicy, timeoutInterval;
#if TARGET_OS_IPHONE
@dynamic networkServiceType;
#endif
@dynamic URL, mainDocumentURL;

@dynamic allHTTPHeaderFields, HTTPMethod, HTTPBody;
#if MAC_OS_X_VERSION_10_4 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_2_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
@dynamic HTTPBodyStream;
#endif
@dynamic HTTPShouldHandleCookies, HTTPShouldUsePipelining;

@end


@implementation NSMutableURLRequest (Properties)

@dynamic cachePolicy, timeoutInterval;
#if TARGET_OS_IPHONE
@dynamic networkServiceType;
#endif
@dynamic URL, mainDocumentURL;

@dynamic allHTTPHeaderFields, HTTPMethod, HTTPBody;
#if MAC_OS_X_VERSION_10_4 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_2_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
@dynamic HTTPBodyStream;
#endif
@dynamic HTTPShouldHandleCookies, HTTPShouldUsePipelining;

@end


@implementation NSMutableURLRequest (HTTPMethod)

- (void)setHTTPPostBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding {
    self.HTTPMethod = @"POST";
    if (bodyDictionary.count == 0) return;

    NSMutableArray *parts = [[NSMutableArray alloc] initWithCapacity:[bodyDictionary count]];

    for (NSString *key in [bodyDictionary keyEnumerator]) {
        NSString *value = bodyDictionary[key];
        NSString *part = [@"%@=%@" format:[key stringByAddingPercentEscapesUsingEncoding:encoding], [value stringByAddingPercentEscapesUsingEncoding:encoding]];
        [parts addObject:part];
    }

    self.HTTPBody = [[parts componentsJoinedByString:@"&"] dataUsingEncoding:NSASCIIStringEncoding];
    [parts release];
}

@end


@interface NSAURLRequestHTTPBodyMultiPartFormPostFormatter ()

- (void)_appendBodyBoundaryWithEncoding:(NSStringEncoding)encoding;

+ (NSString *)_bodyBoundaryString;
- (NSString *)_bodyBoundaryString;
+ (NSData *)_bodyBoundaryWithEncoding:(NSStringEncoding)encoding;
- (NSData *)_bodyBoundary;

@end

@implementation NSAURLRequestHTTPBodyMultiPartFormPostFormatter

- (id)init {
    self = [super init];
    if (self != nil) {
        _encoding = NSUTF8StringEncoding;
        _body = [[NSMutableData alloc] init];
    }
    return self;
}

- (id)initWithEncoding:(NSStringEncoding)anEncoding {
    self = [super init];
    if (self != nil) {
        _encoding = anEncoding;
        _body = [[NSMutableData alloc] init];
    }
    return self;
}

- (void)dealloc {
    [_body release];
    [super dealloc];
}

- (void)_appendBodyBoundaryWithEncoding:(NSStringEncoding)encoding {
    [_body appendData:[[@"\r\n--%@\r\n" format:[self _bodyBoundaryString]] dataUsingEncoding:encoding]];
}

- (void)appendBodyDataToFieldName:(NSString *)fieldName text:(NSString *)textData encoding:(NSStringEncoding)tempEncoding {
    [self _appendBodyBoundaryWithEncoding:tempEncoding];
    [_body appendData:[[@"Content-Disposition: form-data; name=\"%@\"\r\n" format:fieldName] dataUsingEncoding:tempEncoding]];
    [_body appendData:[@"Content-Type: application/text\r\n\r\n" dataUsingEncoding:tempEncoding]];
    [_body appendData:[textData dataUsingEncoding:tempEncoding]];
}

- (void)appendBodyDataToFieldName:(NSString *)fieldName text:(NSString *)textData {
    [self appendBodyDataToFieldName:fieldName text:textData encoding:_encoding];
}

- (void)appendBodyDataToFieldName:(NSString *)fieldName data:(NSData *)data {
    [self _appendBodyBoundaryWithEncoding:self->_encoding];
    [_body appendData:[[@"Content-Disposition: form-data; name=\"%@\"\r\n" format:fieldName] dataUsingEncoding:_encoding]];
    [_body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:_encoding]];
    [_body appendData:data];
}

- (void)appendBodyDataToFieldName:(NSString *)fieldName fileName:(NSString *)fileName data:(NSData *)data {
    [self _appendBodyBoundaryWithEncoding:self->_encoding];
    [_body appendData:[[@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n" format:fieldName, fileName] dataUsingEncoding:_encoding]];
    [_body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:_encoding]];
    [_body appendData:data];
}

- (void)appendBodyDataEndian {
    [_body appendData:[[@"\r\n--%@--\r\n" format:[self _bodyBoundaryString]] dataUsingEncoding:_encoding]];
}

- (NSData *)HTTPBody {
    return _body;
}

#pragma mark private methods

+ (NSString *)_bodyBoundaryString {
    return @"---------------------------14737809831466499882746641449";
}

- (NSString *)_bodyBoundaryString {
    return [[self class] _bodyBoundaryString];
}

+ (NSData *)_bodyBoundaryWithEncoding:(NSStringEncoding)encoding {
    return [[self _bodyBoundaryString] dataUsingEncoding:encoding];
}

- (NSData *)_bodyBoundary {
    return [[self class] _bodyBoundaryWithEncoding:_encoding];
}

@end

@implementation NSMutableURLRequest (NSAURLRequestHTTPBodyMultiPartFormPostFormatter)

- (void)setHTTPMultiPartFormPostBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding {
    self.HTTPMethod = @"POST";
    NSAURLRequestHTTPBodyMultiPartFormPostFormatter *formatter = [[NSAURLRequestHTTPBodyMultiPartFormPostFormatter alloc] initWithEncoding:encoding];
    for (NSString *key in [bodyDictionary keyEnumerator]) {
        id object = bodyDictionary[key];
        if ([object isKindOfClass:[NSData class]]) {
            [formatter appendBodyDataToFieldName:key data:object];
        } else {
            [formatter appendBodyDataToFieldName:key text:object];
        }
    }
    self.HTTPBody = formatter.HTTPBody;
    [formatter release];
}

@end


@implementation NSURLRequest (Creations_deprecated)

- (id)initWithURLFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    self = [self initWithURL:[[NSString stringWithFormat:format arguments:args] URL]];
    va_end(args);
    return self;
}

- (id)initWithFilePath:(NSString *)filePath {
    return [self initWithURL:[NSURL fileURLWithPath:filePath]];
}

- (id)initWithFilePathFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    self = [self initWithURL:[NSURL fileURLWithPath:[NSString stringWithFormat:format arguments:args]]];
    va_end(args);
    return self;
}

- (id)initWithAbstractPath:(NSString *)filePath {
    return [self initWithURL:[NSURL URLWithAbstractPath:filePath]];
}

- (id)initWithAbstractPathFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    self = [self initWithURL:[NSURL URLWithAbstractPath:[NSString stringWithFormat:format arguments:args]]];
    va_end(args);
    return self;
}

+ (id)URLRequestWithURLFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSURLRequest *request = [[self alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:format arguments:args]]];
    va_end(args);
    return [request autorelease];
}

+ (id)URLRequestWithFilePath:(NSString *)filePath {
    return [self requestWithURL:[NSURL fileURLWithPath:filePath]];
}

+ (id)URLRequestWithFilePathFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSURLRequest *request = [[self alloc] initWithURL:[NSURL fileURLWithPath:[NSString stringWithFormat:format arguments:args]]];
    va_end(args);
    return [request autorelease];
}

+ (id)URLRequestWithAbstractPath:(NSString *)filePath {
    return [self requestWithURL:[NSURL URLWithAbstractPath:filePath]];
}

+ (id)URLRequestWithAbstractPathFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSURLRequest *request = [[self alloc] initWithURL:[NSURL URLWithAbstractPath:[NSString stringWithFormat:format arguments:args]]];
    va_end(args);
    return [request autorelease];
}

@end
