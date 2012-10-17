//
//  NSStringAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

@interface NSString (FoundationExtension)

- (NSString *)format:(id)first, ...;
- (NSString *)format0:(id)dummyLikeNil, ...;

+ (NSString *)stringWithFormat:(NSString *)format arguments:(va_list)argList NS_FORMAT_FUNCTION(1,0);
+ (NSString *)stringWithData:(NSData *)data encoding:(NSStringEncoding)encoding;
+ (NSString *)stringWithUTF8Data:(NSData *)data;

- (NSString *)stringByAddingPercentEscapesUsingUTF8Encoding;
- (NSString *)stringByReplacingPercentEscapesUsingUTF8Encoding;

- (NSData *)dataUsingUTF8Encoding;

- (NSInteger)integerValueBase:(NSInteger)radix;
- (NSInteger)hexadecimalValue;

- (NSString *)substringFromIndex:(NSUInteger)from length:(NSUInteger)length;
- (NSString *)substringFromIndex:(NSUInteger)from toIndex:(NSUInteger)to;

@end
