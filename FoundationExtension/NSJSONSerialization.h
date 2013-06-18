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

#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1070 || __IPHONE_OS_VERSION_MIN_REQUIRED >= 50000

/*!
 *  @brief [NSJSONSerialization][0] shortcuts
 *      [0]: http://developer.apple.com/library/mac/#documentation/Foundation/Reference/NSJSONSerialization_Class/Reference/Reference.html
 */
@interface NSJSONSerialization (Shortcuts)

+ (id)JSONObjectWithString:(NSString *)string options:(NSJSONReadingOptions)opt error:(NSError **)error;
+ (NSString *)stringWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError **)error;
+ (id)JSONObjectWithURLRequest:(NSURLRequest *)URLRequest options:(NSJSONWritingOptions)opt error:(NSError **)error;;
+ (id)JSONObjectWithURL:(NSURL *)URL options:(NSJSONWritingOptions)opt error:(NSError **)error;;

@end

#endif
