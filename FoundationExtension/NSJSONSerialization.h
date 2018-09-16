//
//  NSJSONSerialization.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 11. 4..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//


/*!
 *  @file
 *  @brief [NSJSONSerialization][0] extension cateogory collection.
 *      [0]: http://developer.apple.com/library/mac/#documentation/Foundation/Reference/NSJSONSerialization_Class/Reference/Reference.html
 */

#if __MAC_OS_X_VERSION_MAX_ALLOWED >= 1070 || __IPHONE_OS_VERSION_MAX_ALLOWED >= 50000

NS_ASSUME_NONNULL_BEGIN

/*!
 *  @brief [NSJSONSerialization][0] shortcuts
 *      [0]: http://developer.apple.com/library/mac/#documentation/Foundation/Reference/NSJSONSerialization_Class/Reference/Reference.html
 */
@interface NSJSONSerialization (Shortcuts)

+ (nullable id)JSONObjectWithString:(NSString *)string options:(NSJSONReadingOptions)opt error:(out NSError **)error;
+ (nullable NSString *)stringWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(out NSError **)error;
+ (nullable id)JSONObjectWithURLRequest:(NSURLRequest *)URLRequest options:(NSJSONReadingOptions)opt error:(out NSError **)error;
+ (nullable id)JSONObjectWithURL:(NSURL *)URL options:(NSJSONReadingOptions)opt error:(out NSError **)error;

@end

NS_ASSUME_NONNULL_END

#endif
