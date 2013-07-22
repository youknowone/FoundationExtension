//
//  NSValue.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 6. 15..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief [NSValue][0] related extension cateogory collection.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSValue_Class/Reference/Reference.html
 */

#import <Foundation/Foundation.h>

/*!
 *  @brief NSObject extension cateogory collection for [NSValue][0].
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSValue_Class/Reference/Reference.html
 */
@interface NSObject (NSValue)

/*!
 *  @brief NSValue instant creation method for NSObject.
 *  @details NSValue -valueWithNonretainedObject:
 */
- (NSValue *)value;

@end
