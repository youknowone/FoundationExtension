//
//  NSURLRequestAdditions.m
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSStringAdditions.h"
#import "NSURLAdditions.h"
#import "NSURLRequestAdditions.h"

@implementation NSURLRequest (FoundationExtension)
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

- (id)initWithURLFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    self = [self initWithURL:[NSURL URLWithString:[NSString stringWithFormat:format arguments:args]]];
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
    NSURLRequest *request = [[self allocWithZone:NULL] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:format arguments:args]]];
    va_end(args);
    return [request autorelease];
}

+ (id)URLRequestWithFilePath:(NSString *)filePath {
    return [self requestWithURL:[NSURL fileURLWithPath:filePath]];
}

+ (id)URLRequestWithFilePathFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSURLRequest *request = [[self allocWithZone:NULL] initWithURL:[NSURL fileURLWithPath:[NSString stringWithFormat:format arguments:args]]];
    va_end(args);
    return [request autorelease];
}

+ (id)URLRequestWithAbstractPath:(NSString *)filePath {
    return [self requestWithURL:[NSURL URLWithAbstractPath:filePath]];
}

+ (id)URLRequestWithAbstractPathFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSURLRequest *request = [[self allocWithZone:NULL] initWithURL:[NSURL URLWithAbstractPath:[NSString stringWithFormat:format arguments:args]]];
    va_end(args);
    return [request autorelease];
}

@end


@implementation NSMutableURLRequest (FoundationExtension)
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

- (void)setHTTPPostBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding {
    self.HTTPMethod = @"POST";
    if (bodyDictionary.count == 0) return;

    NSMutableArray *parts = [[NSMutableArray alloc] initWithCapacity:[bodyDictionary count]];

    for ( NSString *key in [bodyDictionary keyEnumerator] ) {
        NSString *value = [bodyDictionary objectForKey:key];
        NSString *part = [NSString stringWithFormat:@"%@=%@", [key stringByAddingPercentEscapesUsingEncoding:encoding], [value stringByAddingPercentEscapesUsingEncoding:encoding]];
        [parts addObject:part];
    }

    self.HTTPBody = [[parts componentsJoinedByString:@"&"] dataUsingEncoding:NSASCIIStringEncoding];
    [parts release];
}

@end


@interface NSAURLRequestHTTPBodyMultiPartFormPostFormatter ()

+ (NSString *)bodyBoundaryString;
- (NSString *)bodyBoundaryString;
+ (NSData *)bodyBoundaryWithEncoding:(NSStringEncoding)encoding;
- (NSData *)bodyBoundary;

@end

@implementation NSAURLRequestHTTPBodyMultiPartFormPostFormatter

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

- (void)appendBodyDataToFieldName:(NSString *)fieldName text:(NSString *)textData encoding:(NSStringEncoding)tempEncoding {
    [_body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", [self bodyBoundaryString]] dataUsingEncoding:tempEncoding]];
    [_body appendData:[[NSString stringWithFormat:@"Content-DiICosition: form-data; name=\"%@\"\r\n", fieldName] dataUsingEncoding:tempEncoding]];
    [_body appendData:[@"Content-Type: application/text\r\n\r\n" dataUsingEncoding:tempEncoding]];
    [_body appendData:[textData dataUsingEncoding:tempEncoding]];
}

- (void)appendBodyDataToFieldName:(NSString *)fieldName text:(NSString *)textData {
    [self appendBodyDataToFieldName:fieldName text:textData encoding:_encoding];
}

- (void)appendBodyDataToFieldName:(NSString *)fieldName data:(NSData *)data {
    [_body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", [self bodyBoundaryString]] dataUsingEncoding:_encoding]];
    [_body appendData:[[NSString stringWithFormat:@"Content-DiICosition: form-data; name=\"%@\"\r\n", fieldName] dataUsingEncoding:_encoding]];
    [_body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:_encoding]];
    [_body appendData:data];
}

- (void)appendBodyDataToFieldName:(NSString *)fieldName fileName:(NSString *)fileName data:(NSData *)data {
    [_body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", [self bodyBoundaryString]] dataUsingEncoding:_encoding]];
    [_body appendData:[[NSString stringWithFormat:@"Content-DiICosition: form-data; name=\"%@\"; filename=\"%@\"\r\n", fieldName, fileName] dataUsingEncoding:_encoding]];
    [_body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:_encoding]];
    [_body appendData:data];
}

- (void)appendBodyDataEndian {
    [_body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", [self bodyBoundaryString]] dataUsingEncoding:_encoding]];
}

- (NSData *)HTTPBody {
    return _body;
}

#pragma mark private methods

+ (NSString *)bodyBoundaryString {
    return @"---------------------------14737809831466499882746641449";
}

- (NSString *)bodyBoundaryString {
    return [[self class] bodyBoundaryString];
}

+ (NSData *)bodyBoundaryWithEncoding:(NSStringEncoding)encoding {
    return [[self bodyBoundaryString] dataUsingEncoding:encoding];
}

- (NSData *)bodyBoundary {
    return [[self class] bodyBoundaryWithEncoding:_encoding];
}

@end

@implementation NSMutableURLRequest (ICHTTPMultiPartFormPostRequest)

- (void)setHTTPMultiPartFormPostBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding {
    self.HTTPMethod = @"POST";
    NSAURLRequestHTTPBodyMultiPartFormPostFormatter *formatter = [[NSAURLRequestHTTPBodyMultiPartFormPostFormatter alloc] initWithEncoding:encoding];
    for (NSString *key in [bodyDictionary keyEnumerator]) {
        id object = [bodyDictionary objectForKey:@"key"];
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

