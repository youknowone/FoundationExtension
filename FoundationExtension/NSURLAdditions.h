//
//  NSURLAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @brief Creation method extension
 */
@interface NSURL (FoundationExtension)

/*!
 *  @brief Initializes a newly created NSURL referencing the local file or directory at path based on resource directory of main bundle.
 *  @param path
 *      The path that the NSURL object will represent. path should be a valid system path. If path begins with the prefix 'res://', it will be removed. path should be a relative path from main bundle resource directory.
 *  @return An NSURL object initialized with path based on resource directory of main bundle.
 */
- (id)initResourceURLWithPath:(NSString *)path;
/*!
 *  @brief Initializes and returns a newly created NSURL object as a file URL with a specified path based on resource directory of main bundle.
 *  @see initResourceURLWithPath:
 */
+ (id)resourceURLWithPath:(NSString *)path;
/*!
 *  @brief Initializes a newly created NSURL referencing the local file or directory at path based on configuration directory.
 *  @param path
 *      The path that the NSURL object will represent. path should be a valid system path. If path begins with the prefix 'conf://', it will be removed. path should be a relative path from configuration directory
 *  @return An NSURL object initialized with path based on configuration directory.
 */
- (id)initConfigurationURLWithPath:(NSString *)path;
/*!
 *  @brief Initializes and returns a newly created NSURL object as a file URL with a specified path based on configuration directory.
 *  @see initConfigurationURLWithPath:
 */
+ (id)configurationURLWithPath:(NSString *)path;

/*!
 *  @brief Initializes a newly created NSURL referencing any URL decodable by protocol prefix.
 *  @param path
 *      The path that the NSURL object will represent. path should contains known protocol prefix or be a valid system path. If path begins with the prefix "http://" or "https://", it would be  initialized with '-initWithString:'. If path begins with the prefix "res://", it would be initialized with '-initResourceURLWithPath:'. If path begins with the prefix "conf://", it would be initialized with '-initConfigurationURLWithPath:'. Else path should be a valid system path. It would be initialized with '-initFileURLWithPath:'
 *  @return An NSURL object initialized with path based on protocol prefix.
 */
- (id)initSmartURLWithPath:(NSString *)path;
/*!
 *  @brief Initializes and returns a newly created NSURL referencing any URL decodable by protocol prefix.
 *  @see initSmartURLWithPath:
 */
+ (id)smartURLWithPath:(NSString *)path;

//! @deprecated Use #initSmartURLWithPath:
- (id)initWithAbstractPath:(NSString *)path __deprecated;

//! @deprecated Use NSString::smartURL and NSString::format:...
- (id)initWithAbstractFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
//! @deprecated Use NSString::URL and NSString::format:...
- (id)initWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
//! @deprecated Use NSString::fileURL and NSString::format:...
- (id)initFileURLWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;

//! @deprecated Use NSString::smartURL
+ (NSURL *)URLWithAbstractPath:(NSString *)path __deprecated;
//! @deprecated Use NSString::smartURL and NSString::format:...
+ (NSURL *)URLWithAbstractFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
//! @deprecated Use NSString::URL and NSString::format:...
+ (NSURL *)URLWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
//! @deprecated Use NSString::fileURL and NSString::format:...
+ (NSURL *)fileURLWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;

@end

/*!
 *  @brief NSString shortcut to create NSURL
 */
@interface NSString (FoundationExtensionNSURL)

/*!
 *  @brief Returns a Boolean value that indicates whether 'http://' or 'https://' matches the beginning characters of the receiver.
 *  @return YES if 'http://' or 'https://' matches the beginning characters of the receiver, otherwise NO. Returns NO if aString is empty.
 *  @see hasPrefix:
 */
- (BOOL)hasHTTPPrefix;
/*!
 *  @brief Returns a Boolean value that indicates whether 'http://', 'https://', 'res://' or 'conf://' matches the beginning characters of the receiver.
 *  @return YES if 'http://', 'https://', 'res://' or 'conf://' matches the beginning characters of the receiver, otherwise NO. Returns NO if aString is empty.
 *  @see hasPrefix:
 */
- (BOOL)hasSmartURLPrefix;

/*!
 *  @brief Returns a String value that prefix matches "(^[a-zA-Z]*)://.*" or nil
 */
- (NSString *)URLProtocol;

/*!
 *  @brief Returns a URL from self value.
 *  @return Result of NSURL -URLWithString:
 */
- (NSURL *)URL;
/*!
 *  @brief Returns a file URL from self value.
 *  @return Result of NSURL -fileURLWithPath:
 */
- (NSURL *)fileURL;
/*!
 *  @brief Returns a resource URL from self value.
 *  @return Result of NSURL -resourceURLWithPath:
 */
- (NSURL *)resourceURL;
/*!
 *  @brief Returns a configuration URL from self value.
 *  @return Result of NSURL -configurationURLWithPath:
 */
- (NSURL *)configurationURL;
/*!
 *  @brief Returns a smart URL from self value.
 *  @return Result of NSURL -smartURLWithPath:
 */
- (NSURL *)smartURL;

//! @deprecated Use #smartURL
- (NSURL *)abstractURL __deprecated;
//! @deprecated Use #hasHTTPPrefix
- (BOOL)hasURLPrefix __deprecated;
//! @deprecated Use #URLProtocol
- (NSString *)pathProtocol;

@end
