//
//  NSURLAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

@interface NSURL (FoundationExtension)

- (id)initWithAbstractPath:(NSString *)path;
- (id)initWithAbstractFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
- (id)initWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
- (id)initFileURLWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

+ (NSURL *)URLWithAbstractPath:(NSString *)path;
+ (NSURL *)URLWithAbstractFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
+ (NSURL *)URLWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
+ (NSURL *)fileURLWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

@end

@interface NSString (FoundationExtensionNSURLAdditions)

- (BOOL)hasURLPrefix;
- (NSString *)pathProtocol;
- (NSURL *)URL;
- (NSURL *)fileURL;
- (NSURL *)smartURL;

@end
