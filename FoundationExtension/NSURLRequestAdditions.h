//
//  NSURLRequestAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @headerfile NSURLRequestAdditions.h NSURLRequest extension
 */

/*!
 *  @brief NSURLRequest property shortcut for readonly getter methods
 */
@interface NSURLRequest (FoundationExtensionProperty)

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

@end

/*!
 *  @brief deprecated creation shortcuts
 */
@interface NSURLRequest (FoundationExtensionCreations)
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

/*!
 *  @brief NSURLRequest property shortcut for readonly getter methods
 */
@interface NSMutableURLRequest (FoundationExtensionProperty)

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

@end

/*!
 *  @brief NSMutableURLRequest POST extension
 */
@interface NSMutableURLRequest (FoundationExtensionPost)

/*!
 *  @brief Sets the request body of the receiver to the specified data from bodyDictionary and given encoding as url form format.
 *  @param bodyDictionary
 *      The new request body of the receiver to the specified data from dictionary with url form encoding. Objects should be NSString compatible objects only.
 *  @param encoding
 *      String encoding of bodyDictionary values.
 *  @see setHTTPBody:
 */
- (void)setHTTPPostBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding;

@end

/*!
 *  @brief Multipart Form POST data formatter for NSMutableURLRequest
 */
@interface NSAURLRequestHTTPBodyMultiPartFormPostFormatter : NSObject {
    NSMutableData *_body;
    NSStringEncoding _encoding;
}

/*!
 *  @brief Initialize formatter with default encoding.
 *  @param encoding
 *      Default encoding for formatter
 */
- (id)initWithEncoding:(NSStringEncoding)encoding;
/*!
 *  @brief Appends text data to field name with default encoding.
 *  @param fieldName
 *      Field name for data.
 *  @param textData
 *      Text data to be appended.
 */
- (void)appendBodyDataToFieldName:(NSString *)fieldName text:(NSString *)textData;
/*!
 *  @brief Appends text data to field name with specified encoding.
 *  @param fieldName
 *      Field name for data.
 *  @param textData
 *      Text data to be appended.
 *  @param encoding
 *      Text data encoding.
 */
- (void)appendBodyDataToFieldName:(NSString *)fieldName text:(NSString *)textData encoding:(NSStringEncoding)encoding;
/*!
 *  @brief Appends bytes data to field name.
 *  @param fieldName
 *      Field name for data.
 *  @param data
 *      Data to be appended.
 */
- (void)appendBodyDataToFieldName:(NSString *)fieldName data:(NSData *)data;
/*!
 *  @brief Appends bytes data to field name with given filename.
 *  @param fieldName
 *      Field name for data.
 *  @param fileName
 *      File name for data.
 *  @param data
 *      Data to be appended.
 */
- (void)appendBodyDataToFieldName:(NSString *)fieldName fileName:(NSString *)fileName data:(NSData *)data;

/*!
 *  @brief Appends body data endian.
 *  @details This should be called once after last data is appended.
 */
- (void)appendBodyDataEndian;

/*!
 *  @brief Returns body data.
 *  @return Returns body data.
 *  @details This should be called after -appendBodyDataEndian is called.
 */
- (NSData *)HTTPBody;

@end

/*!
 *  @brief NSURLRequest Multipart Form POST extension
 */
@interface NSMutableURLRequest (ICHTTPMultiPartFormPostRequest)

/*!
 *  @brief Sets the request body of the receiver to the specified data from bodyDictionary and given encoding as multipart form post format.
 *  @param bodyDictionary
 *      The new request body of the receiver to the specified data from dictionary with multipart form post format. Objects should be NSString or NSData compatible objects only.
 *  @param encoding
 *      String encoding of bodyDictionary values.
 *  @see setHTTPBody:
 */
- (void)setHTTPMultiPartFormPostBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding;

@end

