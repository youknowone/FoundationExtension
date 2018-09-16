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

NS_ASSUME_NONNULL_BEGIN

@implementation NSMutableURLRequest (HTTPMethod)

- (void)setHTTPPostBody:(NSDictionary *)bodyDictionary {
    self.HTTPMethod = @"POST";
    if (bodyDictionary.count == 0) return;

    NSMutableArray *parts = [[NSMutableArray alloc] initWithCapacity:[bodyDictionary count]];

    for (NSString *key in [bodyDictionary keyEnumerator]) {
        NSString *value = bodyDictionary[key];
        NSString *part = [@"%@=%@" format:[key stringByAddingPercentEncodingWithoutAllowedCharacters], [value stringByAddingPercentEncodingWithoutAllowedCharacters]];
        [parts addObject:part];
    }

    self.HTTPBody = [[parts componentsJoinedByString:@"&"] dataUsingEncoding:NSASCIIStringEncoding];
}

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

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _encoding = NSUTF8StringEncoding;
        _body = [[NSMutableData alloc] init];
    }
    return self;
}

- (instancetype)initWithEncoding:(NSStringEncoding)anEncoding {
    self = [super init];
    if (self != nil) {
        _encoding = anEncoding;
        _body = [[NSMutableData alloc] init];
    }
    return self;
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
}

@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
@implementation NSURLRequest (Creations_deprecated)
#pragma clang diagnostic pop

- (nullable id)initWithURLFormat:(NSString *_Nonnull)format, ... {
    va_list args;
    va_start(args, format);
    self = [self initWithURL:[[NSString stringWithFormat:format arguments:args] URL]];
    va_end(args);
    return self;
}

- (nullable id)initWithFilePath:(NSString *_Nonnull)filePath {
    return [self initWithURL:[NSURL fileURLWithPath:filePath]];
}

- (nullable id)initWithFilePathFormat:(NSString *_Nonnull)format, ... {
    va_list args;
    va_start(args, format);
    self = [self initWithURL:[NSURL fileURLWithPath:[NSString stringWithFormat:format arguments:args]]];
    va_end(args);
    return self;
}

- (nullable id)initWithAbstractPath:(NSString *_Nonnull)filePath {
    return [self initWithURL:[NSURL URLWithAbstractPath:filePath]];
}

- (nullable id)initWithAbstractPathFormat:(NSString *_Nonnull)format, ... {
    va_list args;
    va_start(args, format);
    self = [self initWithURL:[NSURL URLWithAbstractPath:[NSString stringWithFormat:format arguments:args]]];
    va_end(args);
    return self;
}

+ (nullable id)URLRequestWithURLFormat:(NSString *_Nonnull)format, ... {
    va_list args;
    va_start(args, format);
    NSURLRequest *request = [[self alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:format arguments:args]]];
    va_end(args);
    return request;
}

+ (nullable id)URLRequestWithFilePath:(NSString *_Nonnull)filePath {
    return [self requestWithURL:[NSURL fileURLWithPath:filePath]];
}

+ (nullable id)URLRequestWithFilePathFormat:(NSString *_Nonnull)format, ... {
    va_list args;
    va_start(args, format);
    NSURLRequest *request = [[self alloc] initWithURL:[NSURL fileURLWithPath:[NSString stringWithFormat:format arguments:args]]];
    va_end(args);
    return request;
}

+ (nullable id)URLRequestWithAbstractPath:(NSString *_Nonnull)filePath {
    return [self requestWithURL:[NSURL URLWithAbstractPath:filePath]];
}

+ (nullable id)URLRequestWithAbstractPathFormat:(NSString *_Nonnull)format, ... {
    va_list args;
    va_start(args, format);
    NSURLRequest *request = [[self alloc] initWithURL:[NSURL URLWithAbstractPath:[NSString stringWithFormat:format arguments:args]]];
    va_end(args);
    return request;
}

@end

NS_ASSUME_NONNULL_END
