//
//  NSDataAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @headerfile NSDataAdditions.h NSData extension
 */

/*!
 *  @brief Creation methods extension
 */

@interface NSData (FoundationExtensionCreation)

/*!
 *  @brief Initializes a newly allocated data object initialized with the data from the result specified by a given request.
 *  @param request
 *      The URLRequest from which to read data.
 *  @return An NSData object initialized with the data from contents specified by request. The returned object might be different than the original receiver.
 *  @see -initWithContentsOfURLRequest:error:
 *  @see +dataWithContentsOfURLRequest:error:
 */
- (id)initWithContentsOfURLRequest:(NSURLRequest *)request;
/*!
 *  @brief Returns a data object with the data from the result specified by a given request.
 *  @see -initWithContentsOfURLRequest:
 */
+ (id)dataWithContentsOfURLRequest:(NSURLRequest *)request;

/*!
 *  @brief Initializes a newly allocated data object initialized with the data from the result specified by a given request.
 *  @param request
 *      The URLRequest from which to read data.
 *  @param errorPtr
 *      If there is an error reading in the data, upon return contains an NSError object that describes the problem.
 *  @return An NSData object initialized with the data from contents specified by request. The returned object might be different than the original receiver.
 *  @see -initWithContentsOfURLRequest:
 *  @see +dataWithContentsOfURLRequest:
 */
- (id)initWithContentsOfURLRequest:(NSURLRequest *)request error:(NSError **)errorPtr;
/*!
 *  @brief Returns a data object with the data from the result specified by a given request.
 *  @see -initWithContentsOfURLRequest:error:
 */
+ (id)dataWithContentsOfURLRequest:(NSURLRequest *)request error:(NSError **)errorPtr;

// deprecation: use NSString -smartURL
- (id)initWithContentsOfAbstractPath:(NSString *)path __deprecated;
+ (NSData *)dataWithContentsOfAbstractPath:(NSString *)path __deprecated;

- (id)initWithContentsOfAbstractPath:(NSString *)path options:(NSDataReadingOptions)opt error:(NSError **)error __deprecated;
+ (NSData *)dataWithContentsOfAbstractPath:(NSString *)path options:(NSDataReadingOptions)opt error:(NSError **)error __deprecated;

// deprecation: use -initWithCOntentsOfURLRequest:
- (id)initWithContentsOfURL:(NSURL *)url postBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding __deprecated;
+ (NSData *)dataWithContentsOfURL:(NSURL *)url postBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding __deprecated;

@end


@interface NSData (FoundationExtensionSerialization)

/*!
 *  @brief Deserialize property list data to object.
 *  @param format
 *      A property list format. Possible values for format are described in 'NSPropertyListFormat'.
 *  @param error
 *      If the method does not complete successfully, upon return contains an NSError object that describes the problem.
 *  @return Property list object. Usually NSArray or NSDictionary.
 *  @see NSPropertyListSerialization
 */
- (id)propertyListObjectUsingFormat:(NSPropertyListFormat *)format error:(NSError **)error;

/*!
 *  @brief Serialized string in hexadecimal format.
 *  @return Hexadecimal string.
 */
- (NSString *)hexadecimalString;
/*!
 *  @brief Initialize with deserialized data from hexadecimal string.
 *  @param hexadecimal
 *      Hexadecimal string.
 */
- (id)initWithHexadecimalString:(NSString *)hexadecimal;
/*!
 *  @brief Creates and returns deserialized data from hexadecimal string.
 *  @see -initWithHexadecimalString:
 */
+ (id)dataWithHexadecimalString:(NSString *)hexadecimal;

/*!
 *  @brief Serialized string in base64 format.
 *  @return base64 string.
 */
- (NSString *)base64String;
/*!
 *  @brief Initialize with deserialized data from base64 string.
 *  @param base64
 *      base64 string.
 */
- (id)initWithBase64String:(NSString *)base64;
/*!
 *  @brief Creates and returns deserialized data from base64 string.
 *  @see -initWithBase64String:
 */
+ (id)dataWithBase64String:(NSString *)base64;

@end
