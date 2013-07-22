//
//  NSTextView.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 11. 18..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief [NSTextView][0] extension.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ApplicationKit/Classes/NSTextView_Class/Reference/Reference.html
 */

#import <Cocoa/Cocoa.h>

/*!
 *  @brief Append placeholder support.
 */
@interface NSTextView (Placeholder)

//! @brief Seems private API
@property(nonatomic, retain) NSString *placeholderString;

@end
