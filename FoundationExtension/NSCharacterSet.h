//
//  NSCharacterSet.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 2014. 10. 8..
//  Copyright (c) 2014 youknowone.org. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *  @file
 *  @brief [NSCharacterSet][0] extension cateogory collection.
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSCharacterSet_Class/Reference/Reference.html
 */

/*!
 *  @brief NSCharacterSet extensions
 */
@interface NSCharacterSet (Shortcut)

/*!
 *  @brief Returns a character set containing no character.
 *  @return A character set containing no character.
 */
+ (instancetype)emptyCharacterSet;

@end
