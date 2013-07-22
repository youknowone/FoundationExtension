//
//  NSDate.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 11. 7. 27..
//  Copyright 2011 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [NSDate][0] extension cateogory collection.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSDate_Class/Reference/Reference.html
 */

#import <Foundation/Foundation.h>

/*!
 *  @brief NSDate common shortcuts.
 */
@interface NSDate (Shortcuts)

//! @brief Get components from current Calendar.
@property(readonly) NSDateComponents *components;

@end
