//
//  NSBundle.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [NSBundle][0] extension cateogory collection.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSBundle_Class/Reference/Reference.html
 */

#if __has_feature(modules)
@import Foundation;
#else
#import <Foundation/Foundation.h>
#endif

NS_ASSUME_NONNULL_BEGIN

/*!
 *  @brief NSBundle extensions
 */
@interface NSBundle (Shortcuts)

/*!
 *  @brief Returns resource file path for given filename.
 */
- (NSString *)pathForResourceFile:(NSString *)filename;

@end

NS_ASSUME_NONNULL_END
