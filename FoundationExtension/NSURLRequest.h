//
//  NSURLRequest.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [NSURLRequest][0] and [NSMutableURLRequest][1] extension category collection.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSURLRequest_Class/Reference/Reference.html
 *      [1]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSMutableURLRequest_Class/Reference/Reference.html#//apple_ref/occ/cl/NSMutableURLRequest
 */

/*!
 *  @brief NSURLRequest property shortcuts for legacy compilers.
 */
@interface NSURLRequest (Properties)

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
 *  @brief Deprecated creation shortcuts
 *  @deprecated Use [NSURLRequest initWithURL:](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSURLRequest_Class/Reference/Reference.html#//apple_ref/occ/instm/NSURLRequest/initWithURL:), @ref NSString(Shortcuts) and @ref NSURL(Creations)
 */
@interface NSURLRequest (Creations_deprecated)

//! @deprecated
- (id)initWithURLFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
//! @deprecated
- (id)initWithFilePath:(NSString *)filePath __deprecated;
//! @deprecated
- (id)initWithFilePathFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
//! @deprecated
- (id)initWithAbstractPath:(NSString *)filePath __deprecated;
//! @deprecated
- (id)initWithAbstractPathFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;

//! @deprecated
+ (id)URLRequestWithURLFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
//! @deprecated
+ (id)URLRequestWithFilePath:(NSString *)filepath __deprecated;
//! @deprecated
+ (id)URLRequestWithFilePathFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
//! @deprecated
+ (id)URLRequestWithAbstractPath:(NSString *)filePath __deprecated;
//! @deprecated
+ (id)URLRequestWithAbstractPathFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;

@end

/*!
 *  @brief NSURLRequest property shortcuts for legacy compilers.
 */
@interface NSMutableURLRequest (Properties)

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
@interface NSMutableURLRequest (HTTPMethod)

/*!
 *  @brief Sets the request body of the receiver to the specified data from bodyDictionary and given encoding as url form format.
 *  @param bodyDictionary The new request body of the receiver to the specified data from dictionary with url form encoding. Objects should be NSString compatible objects only.
 *  @param encoding String encoding of bodyDictionary values.
 *  @see [setHTTPBody:][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSMutableURLRequest_Class/Reference/Reference.html#//apple_ref/occ/instm/NSMutableURLRequest/setHTTPBody:
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
 *  @param encoding Default encoding for formatter
 */
- (id)initWithEncoding:(NSStringEncoding)encoding;
/*!
 *  @brief Appends text data to field name with default encoding.
 *  @param fieldName Field name for data.
 *  @param textData Text data to be appended.
 */
- (void)appendBodyDataToFieldName:(NSString *)fieldName text:(NSString *)textData;
/*!
 *  @brief Appends text data to field name with specified encoding.
 *  @param fieldName Field name for data.
 *  @param textData Text data to be appended.
 *  @param encoding Text data encoding.
 */
- (void)appendBodyDataToFieldName:(NSString *)fieldName text:(NSString *)textData encoding:(NSStringEncoding)encoding;
/*!
 *  @brief Appends bytes data to field name.
 *  @param fieldName Field name for data.
 *  @param data Data to be appended.
 */
- (void)appendBodyDataToFieldName:(NSString *)fieldName data:(NSData *)data;
/*!
 *  @brief Appends bytes data to field name with given filename.
 *  @param fieldName Field name for data.
 *  @param fileName File name for data.
 *  @param data Data to be appended.
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
 *  @details This category implements Multipart Form POST using NSAURLRequestHTTPBodyMultiPartFormPostFormatter
 */
@interface NSMutableURLRequest (NSAURLRequestHTTPBodyMultiPartFormPostFormatter)

/*!
 *  @brief Sets the request body of the receiver to the specified data from bodyDictionary and given encoding as multipart form post format.
 *  @param bodyDictionary
 *      The new request body of the receiver to the specified data from dictionary with multipart form post format. Objects should be NSString or NSData compatible objects only.
 *  @param encoding
 *      String encoding of bodyDictionary values.
 *  @see [setHTTPBody:][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSMutableURLRequest_Class/Reference/Reference.html#//apple_ref/occ/instm/NSMutableURLRequest/setHTTPBody:
 *  @see NSAURLRequestHTTPBodyMultiPartFormPostFormatter
 */
- (void)setHTTPMultiPartFormPostBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding;

@end
