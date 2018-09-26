//
//  NSURL.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [NSURL][0] extension category collection
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSURL_Class/Reference/Reference.html
 */

#if __has_feature(modules)
@import Foundation;
#else
#import <Foundation/Foundation.h>
#endif


NS_ASSUME_NONNULL_BEGIN

/*!
 *  @brief Creation method extension
 */
@interface NSURL (Creations)

/*! @name Initializing an URL */

/*!
 *  @brief Initializes a newly created NSURL referencing the local file or directory at path based on resource directory of main bundle.
 *  @param path The path that the NSURL object will represent. path should be a valid system path. If path begins with the prefix 'res://', it will be removed. path should be a relative path from main bundle resource directory.
 *  @return An NSURL object initialized with path based on resource directory of main bundle.
 */
- (instancetype)initResourceURLWithPath:(NSString *)path;

/*!
 *  @brief Initializes a newly created NSURL referencing the local file or directory at path based on configuration directory.
 *  @param path The path that the NSURL object will represent. path should be a valid system path. If path begins with the prefix 'conf://', it will be removed. path should be a relative path from configuration directory
 *  @return An NSURL object initialized with path based on configuration directory.
 */
- (instancetype)initConfigurationURLWithPath:(NSString *)path;

/*!
 *  @brief Initializes a newly created NSURL referencing the local file or directory at path based on temporary directory.
 *  @param path The path that the NSURL object will represent. path should be a valid system path. If path begins with the prefix 'conf://', it will be removed. path should be a relative path from temporary directory
 *  @return An NSURL object initialized with path based on temporary directory.
 */
- (instancetype)initTemporaryURLWithPath:(NSString *)path;

/*!
 *  @brief Initializes a newly created NSURL referencing any URL decodable by protocol prefix.
 *  @param path The path that the NSURL object will represent. path should contains known protocol prefix or be a valid system path. If path begins with the prefix "http://" or "https://", it would be initialized with [initWithString:][1]. If path begins with the prefix "res://", it would be initialized with @link initResourceURLWithPath: @endlink. If path begins with the prefix "conf://", it would be initialized with @link initConfigurationURLWithPath: @endlink. Else path should be a valid file system path. It would be initialized with [initFileURLWithPath:][2].
 *  @return An NSURL object initialized with path based on protocol prefix.
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSURL_Class/Reference/Reference.html#//apple_ref/occ/instm/NSURL/initWithString:
 *      [2]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSURL_Class/Reference/Reference.html#//apple_ref/occ/instm/NSURL/initFileURLWithPath:
 */
- (instancetype)initSmartURLWithPath:(NSString *)path;

/*! @name Creating an URL */

/*!
 *  @brief Initializes and returns a newly created NSURL object as a file URL with a specified path based on resource directory of main bundle.
 *  @see initResourceURLWithPath:
 */
+ (instancetype)resourceURLWithPath:(NSString *)path;

/*!
 *  @brief Initializes and returns a newly created NSURL object as a file URL with a specified path based on configuration directory.
 *  @see initConfigurationURLWithPath:
 */
+ (instancetype)configurationURLWithPath:(NSString *)path;

/*!
 *  @brief Initializes and returns a newly created NSURL object as a file URL with a specified path based on temporary directory.
 *  @see initTemporaryURLWithPath:
 */
+ (instancetype)temporaryURLWithPath:(NSString *)path;

/*!
 *  @brief Initializes and returns a newly created NSURL referencing any URL decodable by protocol prefix.
 *  @see initSmartURLWithPath:
 */
+ (instancetype)smartURLWithPath:(NSString *)path;

@end

/*!
 *  @brief NSURL missing bridge of CFURL
 */
@interface NSURL (CFURL)

/*!
 *  @brief The URL status if a given URL's path represents a directory.
 *  @return YES if the URL represents a directory; otherwise NO.
 */
@property(nonatomic, readonly) BOOL hasDirectoryPath;

@end


/*!
 *  @brief NSString shortcut to detect URL and to create an NSURL
 */
@interface NSString (NSURL)

/*! @name UTF8 shortcuts */

/*!
 *  @brief Returns a new string made from the receiver by replacing all characters with percent encoded characters. UTF-8 encoding is used to determine the correct percent encoded characters. Entire URL strings cannot be percent-encoded. This method is intended to percent-encode an URL component or subcomponent string, NOT the entire URL string.
 *  @see [stringByAddingPercentEncodingWithAllowedCharacters:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/stringByAddingPercentEncodingWithAllowedCharacters:
 */
- (NSString *)stringByAddingPercentEncodingWithoutAllowedCharacters;

/*!
 *  @brief Returns a new string made from the receiver by replacing characters with percent encoded characters except for URL query characters. UTF-8 encoding is used to determine the correct percent encoded characters. Entire URL strings cannot be percent-encoded.
 *  @see [stringByAddingPercentEncodingWithAllowedCharacters:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/stringByAddingPercentEncodingWithAllowedCharacters:
 */
- (NSString *)stringByAddingPercentEncodingForURLQuery;

/*! @name URL prefix */

/*!
 *  @brief Returns a Boolean value that indicates whether 'http://' or 'https://' matches the beginning characters of the receiver.
 *  @return YES if 'http://' or 'https://' matches the beginning characters of the receiver, otherwise NO. Returns NO if aString is empty.
 *  @see [hasPrefix:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/hasPrefix:
 */
- (BOOL)hasHTTPPrefix;
/*!
 *  @brief Returns a Boolean value that indicates whether 'http://', 'https://', 'res://' or 'conf://' matches the beginning characters of the receiver.
 *  @return YES if 'http://', 'https://', 'res://' or 'conf://' matches the beginning characters of the receiver, otherwise NO. Returns NO if aString is empty.
 *  @see [hasPrefix:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/hasPrefix:
 */
- (BOOL)hasSmartURLPrefix;

/*!
 *  @brief Returns a String value that prefix matches "(^[a-zA-Z]*)://.*" or nil
 */
- (nullable NSString *)URLProtocol;

/*! @name Creating an URL */

/*!
 *  @brief Returns a URL from self value.
 *  @return Result of [NSURL -URLWithString:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSURL_Class/Reference/Reference.html#//apple_ref/occ/clm/NSURL/URLWithString:
 */
- (nullable NSURL *)URL;

/*!
 *  @brief Returns a file URL from self value.
 *  @return Result of [NSURL -fileURLWithPath:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSURL_Class/Reference/Reference.html#//apple_ref/occ/clm/NSURL/fileURLWithPath:
 */
- (nullable NSURL *)fileURL;

/*!
 *  @brief Returns a resource URL from self value.
 *  @return Result of @ref NSURL(Creations)::resourceURLWithPath:
 */
- (nullable NSURL *)resourceURL;

/*!
 *  @brief Returns a configuration URL from self value.
 *  @return Result of @ref NSURL(Creations)::configurationURLWithPath:
 */
- (nullable NSURL *)configurationURL;

/*!
 *  @brief Returns a temporary URL from self value.
 *  @return Result of @ref NSURL(Creations)::temporaryURLWithPath:
 */
- (nullable NSURL *)temporaryURL;

/*!
 *  @brief Returns a smart URL from self value.
 *  @return Result of @ref NSURL(Creations)::smartURLWithPath:
 */
- (nullable NSURL *)smartURL;

@end

NS_ASSUME_NONNULL_END
