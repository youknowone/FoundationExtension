//
//  NSDictionaryAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 11. 1. 24..
//  Copyright 2011 youknowone.org All rights reserved.
//

/*!
 *  @brief Creation methods extension
 */
@interface NSDictionary (FoundationExtensionCreation)

/*!
 *  @brief Initializes a newly allocated dictionary with the contents of data. (plist)
 *  @param data
 *      An NSData object containing bytes of plist file representation.
 *  @return A dictionary initialized to contain the contents in data. Returns nil if the contents of the request can’t be parsed into a dictionary. The returned object might be different than the original receiver.
 *  @see initWithData:options:format:error:
 *  @see dictionaryWithData:options:format:error:
 */
- (id)initWithData:(NSData *)data;
/*!
 *  @brief Creates and returns a dictionary containing the contents of data. (plist)
 *  @see initWithData:
 */
+ (id)dictionaryWithData:(NSData *)data;

/*!
 *  @brief Initializes a newly allocated dictionary with the contents of data. (plist)
 *  @param data
 *      An NSData object containing bytes of plist file representation.
 *  @param format
 *      A property list format. Possible values for format are described in 'NSPropertyListFormat'.
 *  @param error
 *      If the method does not complete successfully, upon return contains an NSError object that describes the problem.
 *  @return A dictionary initialized to contain the contents in data. Returns nil if the contents of the request can’t be parsed into a dictionary. The returned object might be different than the original receiver.
 *  @see initWithData:
 *  @see dictionaryWithData:
 */
- (id)initWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error;
/*!
 *  @brief Creates and returns a dictionary containing the contents of data. (plist)
 *  @see initWithData:options:format:error:
 */
+ (id)dictionaryWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error;

/*!
 *  @brief Initializes a newly allocated dictionary with the contents of the result specified by a given request.
 *  @param request
 *      The URLRequest of a file containing a string representation of a dictionary produced by the '-writeToURL:atomically:' method.
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
 *  @param request
 *      The URLRequest of a file containing a string representation of a dictionary produced by the '-writeToURL:atomically:' method.
 *  @param format
 *      A property list format. Possible values for format are described in 'NSPropertyListFormat'.
 *  @param error
 *      If the method does not complete successfully, upon return contains an NSError object that describes the problem.
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

/*!
 *  @brief Common shortcuts
 */
@interface NSDictionary (FoundationExtensionShortcuts)

/*!
 *  @brief Returns if dictionary has a given key.
 *  @param key
 *      A key to test dictionary has it.
 *  @return YES if key exists. Or NO.
 */
- (BOOL)containsKey:(id)key;

@end