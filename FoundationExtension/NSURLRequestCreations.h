//
//  NSURLRequestCreations.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 11. 2..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief Creation category extension for various objects using NSURLRequest
 */

#import <Foundation/Foundation.h>

/*!
 *  @brief Creation methods extension using NSURLRequest
 */
@interface NSData (NSURLRequest)

/*!
 *  @brief Initializes a newly allocated data object initialized with the data from the result specified by a given request.
 *  @param request The URLRequest from which to read data.
 *  @return An NSData object initialized with the data from contents specified by request. The returned object might be different than the original receiver.
 *  @see initWithContentsOfURLRequest:error:
 *  @see dataWithContentsOfURLRequest:error:
 */
- (id)initWithContentsOfURLRequest:(NSURLRequest *)request;
/*!
 *  @brief Returns a data object with the data from the result specified by a given request.
 *  @see initWithContentsOfURLRequest:
 */
+ (id)dataWithContentsOfURLRequest:(NSURLRequest *)request;

/*!
 *  @brief Initializes a newly allocated data object initialized with the data from the result specified by a given request.
 *  @param request The URLRequest from which to read data.
 *  @param errorPtr If there is an error reading in the data, upon return contains an NSError object that describes the problem.
 *  @return An NSData object initialized with the data from contents specified by request. The returned object might be different than the original receiver.
 *  @see initWithContentsOfURLRequest:
 *  @see dataWithContentsOfURLRequest:
 */
- (id)initWithContentsOfURLRequest:(NSURLRequest *)request error:(NSError **)errorPtr;
/*!
 *  @brief Returns a data object with the data from the result specified by a given request.
 *  @see initWithContentsOfURLRequest:error:
 */
+ (id)dataWithContentsOfURLRequest:(NSURLRequest *)request error:(NSError **)errorPtr;

/*! @name Deprecated */

/*!
 *  @deprecated Use initWithContentsOfURLRequest: with NSMutableURLRequest
 */
- (id)initWithContentsOfURL:(NSURL *)url postBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding __deprecated;
/*!
 *  @deprecated Use dataWithContentsOfURLRequest: with NSMutableURLRequest
 */
+ (NSData *)dataWithContentsOfURL:(NSURL *)url postBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding __deprecated;

@end


/*!
 *  @brief Creation methods extension using NSURLRequest
 */
@interface NSArray (NSURLRequest)

/*!
 *  @brief Initializes a newly allocated array with the contents of the result specified by a given request.
 *  @param request The URLRequest of a file containing a string representation of an array produced by the [NSData writeToURL:atomically:][0] method.
 *  @return An array initialized to contain the contents specified by request. Returns nil if the location can’t be opened or if the contents of the request can’t be parsed into an array. The returned object might be different than the original receiver.
 *  @see initWithContentsOfURLRequest:format:error:
 *  @see arrayWithContentsOfURLRequest:format:error:
 */
- (id)initWithContentsOfURLRequest:(NSURLRequest *)request;
/*!
 *  @brief Creates and returns an array containing the contents of the result specified by a given request.
 *  @see initWithContentsOfURLRequest:
 */
+ (id)arrayWithContentsOfURLRequest:(NSURLRequest *)request;

/*!
 *  @brief Initializes a newly allocated array with the contents of the result specified by a given request.
 *  @param request The URLRequest of a file containing a string representation of an array produced by the '-writeToURL:atomically:' method.
 *  @param format A property list format. Possible values for format are described in 'NSPropertyListFormat'.
 *  @param error If the method does not complete successfully, upon return contains an NSError object that describes the problem.
 *  @result An array initialized to contain the contents specified by request. Returns nil if the location can’t be opened or if the contents of the request can’t be parsed into an array. The returned object might be different than the original receiver.
 *  @see initWithContentsOfURLRequest:
 *  @see arrayWithContentsOfURLRequest:
 */
- (id)initWithContentsOfURLRequest:(NSURLRequest *)request format:(NSPropertyListFormat *)format error:(NSError **)error;
/*!
 *  @brief Creates and returns an array containing the contents of the result specified by a given request.
 *  @see initWithContentsOfURLRequest:format:error:
 */
+ (id)arrayWithContentsOfURLRequest:(NSURLRequest *)request format:(NSPropertyListFormat *)format error:(NSError **)error;

@end


/*!
 *  @brief Creation methods extension using NSURLRequest
 */
@interface NSDictionary (NSURLRequest)

/*!
 *  @brief Initializes a newly allocated dictionary with the contents of the result specified by a given request.
 *  @param request The URLRequest of a file containing a string representation of a dictionary produced by the '-writeToURL:atomically:' method.
 *  @return A dictionary initialized to contain the contents specified by request. Returns nil if the location can’t be opened or if the contents of the request can’t be parsed into a dictionary. The returned object might be different than the original receiver.
 *  @see initWithContentsOfURLRequest:format:error:
 *  @see dictionaryWithContentsOfURLRequest:format:error:
 */
- (id)initWithContentsOfURLRequest:(NSURLRequest *)request;
/*!
 *  @brief Creates and returns a dictionary containing the contents of the result specified by a given request.
 *  @see initWithContentsOfURLRequest:
 */
+ (id)dictionaryWithContentsOfURLRequest:(NSURLRequest *)request;

/*!
 *  @brief Initializes a newly allocated dictionary with the contents of the result specified by a given request.
 *  @param request The URLRequest of a file containing a string representation of a dictionary produced by the '-writeToURL:atomically:' method.
 *  @param format A property list format. Possible values for format are described in 'NSPropertyListFormat'.
 *  @param error If the method does not complete successfully, upon return contains an NSError object that describes the problem.
 *  @result A dictionary initialized to contain the contents specified by request. Returns nil if the location can’t be opened or if the contents of the request can’t be parsed into a dictionary. The returned object might be different than the original receiver.
 *  @see initWithContentsOfURLRequest:
 *  @see dictionaryWithContentsOfURLRequest:
 */
- (id)initWithContentsOfURLRequest:(NSURLRequest *)request format:(NSPropertyListFormat *)format error:(NSError **)error;
/*!
 *  @brief Creates and returns a dictionary containing the contents of the result specified by a given request.
 *  @see initWithContentsOfURLRequest:format:error:
 */
+ (id)dictionaryWithContentsOfURLRequest:(NSURLRequest *)request format:(NSPropertyListFormat *)format error:(NSError **)error;

@end
