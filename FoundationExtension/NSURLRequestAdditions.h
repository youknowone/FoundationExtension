//
//  NSURLRequestAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

@interface NSURLRequest (FoundationExtension)

@property(readonly) NSURL *URL;
@property(readonly) NSURLRequestCachePolicy cachePolicy;
@property(readonly) NSTimeInterval timeoutInterval;
#if TARGET_OS_IPHONE
@property(readonly) NSURLRequestNetworkServiceType networkServiceType;
#endif
@property(readonly) NSURL *mainDocumentURL;

@property(readonly) NSDictionary *allHTTPHeaderFields;
@property(readonly) NSString *HTTPMethod;
@property(readonly) NSData *HTTPBody;
#if MAC_OS_X_VERSION_10_4 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_2_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
@property(readonly) NSInputStream *HTTPBodyStream;
#endif
@property(readonly) BOOL HTTPShouldHandleCookies;
@property(readonly) BOOL HTTPShouldUsePipelining;

// deprecated shortcuts. Use initWithURL:

- (id)initWithURLFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
- (id)initWithFilePath:(NSString *)filePath __deprecated;
- (id)initWithFilePathFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
- (id)initWithAbstractPath:(NSString *)filePath __deprecated;
- (id)initWithAbstractPathFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;

+ (id)URLRequestWithURLFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
+ (id)URLRequestWithFilePath:(NSString *)filepath __deprecated;
+ (id)URLRequestWithFilePathFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
+ (id)URLRequestWithAbstractPath:(NSString *)filePath __deprecated;
+ (id)URLRequestWithAbstractPathFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;

@end


@interface NSMutableURLRequest (FoundationExtension)

@property(retain) NSURL *URL;
@property NSURLRequestCachePolicy cachePolicy;
@property NSTimeInterval timeoutInterval;
#if TARGET_OS_IPHONE
@property NSURLRequestNetworkServiceType networkServiceType;
#endif
@property(retain) NSURL *mainDocumentURL;

@property(retain) NSDictionary *allHTTPHeaderFields;
@property(retain) NSString *HTTPMethod;
@property(retain) NSData *HTTPBody;
#if MAC_OS_X_VERSION_10_4 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_2_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
@property(retain) NSInputStream *HTTPBodyStream;
#endif
@property BOOL HTTPShouldHandleCookies;
@property BOOL HTTPShouldUsePipelining;

- (void)setHTTPPostBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding;

@end


@interface NSAURLRequestHTTPBodyMultiPartFormPostFormatter : NSObject {
	NSMutableData *_body;
	NSStringEncoding _encoding;
}

- (id)initWithEncoding:(NSStringEncoding)encoding;
- (void)appendBodyDataToFieldName:(NSString *)fieldName text:(NSString *)textData;
- (void)appendBodyDataToFieldName:(NSString *)fieldName text:(NSString *)textData encoding:(NSStringEncoding)encoding;
- (void)appendBodyDataToFieldName:(NSString *)fieldName data:(NSData *)data;
- (void)appendBodyDataToFieldName:(NSString *)fieldName fileName:(NSString *)fileName data:(NSData *)data;
- (void)appendBodyDataEndian;

- (NSData *)HTTPBody;

@end

@interface NSMutableURLRequest (ICHTTPMultiPartFormPostRequest)

- (void)setHTTPMultiPartFormPostBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding;

@end

