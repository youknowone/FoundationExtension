//
//  NSDataAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

@interface NSData (FoundationExtension)

- (id)initWithContentsOfURLRequest:(NSURLRequest *)request;
+ (NSData *)dataWithContentsOfURLRequest:(NSURLRequest *)request;

- (id)initWithContentsOfURLRequest:(NSURLRequest *)request error:(NSError **)error;
+ (NSData *)dataWithContentsOfURLRequest:(NSURLRequest *)request error:(NSError **)error;

- (NSString *)hexadecimalString;
- (id)initWithHexadecimalString:(NSString *)hexadecimal;
+ (NSData *)dataWithHexadecimalString:(NSString *)hexadecimal;


// deprecation: use NSString -smartURL
- (id)initWithContentsOfAbstractPath:(NSString *)path __deprecated;
+ (NSData *)dataWithContentsOfAbstractPath:(NSString *)path __deprecated;

- (id)initWithContentsOfAbstractPath:(NSString *)path options:(NSDataReadingOptions)opt error:(NSError **)error __deprecated;
+ (NSData *)dataWithContentsOfAbstractPath:(NSString *)path options:(NSDataReadingOptions)opt error:(NSError **)error __deprecated;

// deprecation: use -initWithCOntentsOfURLRequest:
- (id)initWithContentsOfURL:(NSURL *)url postBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding __deprecated;
+ (NSData *)dataWithContentsOfURL:(NSURL *)url postBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding __deprecated;

@end
