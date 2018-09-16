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

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

/*!
 *  @brief NSMutableURLRequest POST extension
 */
@interface NSMutableURLRequest (HTTPMethod)

/*!
 *  @brief Sets the request body of the receiver to the specified data from bodyDictionary and given encoding as url form format.
 *  @param bodyDictionary The new request body of the receiver to the specified data from dictionary with url form encoding. Objects should be NSString compatible objects only.
 *  @see [setHTTPBody:][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSMutableURLRequest_Class/Reference/Reference.html#//apple_ref/occ/instm/NSMutableURLRequest/setHTTPBody:
 */
- (void)setHTTPPostBody:(NSDictionary *)bodyDictionary;

/*!
 *  @brief Sets the request body of the receiver to the specified data from bodyDictionary as url form format.
 *  @param bodyDictionary The new request body of the receiver to the specified data from dictionary with url form encoding. Objects should be NSString compatible objects only.
 *  @param encoding String encoding of bodyDictionary values.
 *  @see [setHTTPBody:][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSMutableURLRequest_Class/Reference/Reference.html#//apple_ref/occ/instm/NSMutableURLRequest/setHTTPBody:
 */
- (void)setHTTPPostBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding
#if __MAC_OS_X_VERSION_MAX_ALLOWED >= 101100 || __IPHONE_OS_VERSION_MAX_ALLOWED >= 90000
NS_DEPRECATED(10_0, 10_11, 2_0, 9_0, "Use -setHTTPPostBody: instead, which always uses the recommended UTF-8 encoding.")
#endif
;

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
- (instancetype)initWithEncoding:(NSStringEncoding)encoding;
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

/*!
 *  @brief Deprecated creation shortcuts
 *  @deprecated Use [NSURLRequest initWithURL:](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSURLRequest_Class/Reference/Reference.html#//apple_ref/occ/instm/NSURLRequest/initWithURL:), @ref NSString(Shortcuts) and @ref NSURL(Creations)
 */
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
__deprecated @interface NSURLRequest (Creations_deprecated)
#pragma clang diagnostic pop

//! @deprecated
- (nullable id)initWithURLFormat:(NSString *_Nonnull)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
//! @deprecated
- (nullable id)initWithFilePath:(NSString *_Nonnull)filePath __deprecated;
//! @deprecated
- (nullable id)initWithFilePathFormat:(NSString *_Nonnull)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
//! @deprecated
- (nullable id)initWithAbstractPath:(NSString *_Nonnull)filePath __deprecated;
//! @deprecated
- (nullable id)initWithAbstractPathFormat:(NSString *_Nonnull)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;

//! @deprecated
+ (nullable id)URLRequestWithURLFormat:(NSString *_Nonnull)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
//! @deprecated
+ (nullable id)URLRequestWithFilePath:(NSString *_Nonnull)filepath __deprecated;
//! @deprecated
+ (nullable id)URLRequestWithFilePathFormat:(NSString *_Nonnull)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
//! @deprecated
+ (nullable id)URLRequestWithAbstractPath:(NSString *_Nonnull)filePath __deprecated;
//! @deprecated
+ (nullable id)URLRequestWithAbstractPathFormat:(NSString *_Nonnull)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;

@end

NS_ASSUME_NONNULL_END
