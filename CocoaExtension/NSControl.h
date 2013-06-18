//
//  NSControl.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 24..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief [NSControl]0] category extension collections.
 *      [0]: http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ApplicationKit/Classes/NSControl_Class/Reference/Reference.html
 */

/*!
 *  @brief [NSControl][0] missing properties.
 *      [0]: http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ApplicationKit/Classes/NSControl_Class/Reference/Reference.html
 */
@interface NSControl (Properties)

/*!
 *  @brief The value of enabled.
 */
@property(nonatomic, assign, getter=isEnabled, setter=setEnabled:) BOOL enabled;

@end
