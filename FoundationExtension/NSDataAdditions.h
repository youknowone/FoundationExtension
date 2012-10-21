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

- (NSString *)hexadecimalString;
- (id)initWithHexadecimalString:(NSString *)hexadecimal;
+ (id)dataWithHexadecimalString:(NSString *)hexadecimal;

- (NSString *)base64String;
- (id)initWithBase64String:(NSString *)base64;
+ (id)dataWithBase64String:(NSString *)base64;

@end
