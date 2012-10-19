//
//  NSURLAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @header NSURLAdditions.h NSURL extensions
 */

/*!
 *  @brief Creation method extension
 */
@interface NSURL (FoundationExtension)

- (id)initResourceURLWithPath:(NSString *)path;
- (id)initConfigurationURLWithPath:(NSString *)path;
- (id)initSmartURLWithPath:(NSString *)path;

+ (id)resourceURLWithPath:(NSString *)path;
+ (id)configurationURLWithPath:(NSString *)path;
+ (id)smartURLWithPath:(NSString *)path;

// abstract renamed abstract-> smart
- (id)initWithAbstractPath:(NSString *)path __deprecated;

// format shortcut deprecations
// use as like below:
// [NSURL URLWithFormat:@"http://github.com/%@", @"youknowone"]
// => [@"http://github.com/%@" format0:nil, @"youknowone"].URL
- (id)initWithAbstractFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
- (id)initWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
- (id)initFileURLWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;

+ (NSURL *)URLWithAbstractPath:(NSString *)path __deprecated;
+ (NSURL *)URLWithAbstractFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
+ (NSURL *)URLWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;
+ (NSURL *)fileURLWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) __deprecated;

@end

/*!
 *  @brief NSString shortcut to create NSURL
 */
@interface NSString (FoundationExtensionNSURLAdditions)

- (BOOL)hasHTTPPrefix;
- (BOOL)hasSmartURLPrefix;

- (NSString *)URLProtocol;
- (NSURL *)URL;
- (NSURL *)fileURL;
- (NSURL *)resourceURL;
- (NSURL *)configurationURL;
- (NSURL *)smartURL;

// abstract renamed abstract -> smart
- (NSURL *)abstractURL __deprecated;
// renamed hasURLPrefix -> hasHTTPPrefix
- (BOOL)hasURLPrefix __deprecated;
// renamed pathProtocol -> URLProtocol
- (NSString *)pathProtocol;

@end
