//
//  NSAString.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 25..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief See @ref CoreFoundation-Subclass for concept of these objects.
 */

#import <Foundation/Foundation.h>

/*!
 *  @brief [NSString][0] subclass-available implementation.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html
 *  @details See @ref CoreFoundation-Subclass for concept of these objects.
 */
@interface NSAString : NSString {
    NSString *_impl;
}

@end


/*!
 *  @brief [NSMutableString][1] subclass-available implementation.
 *      [1]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSMutableString_Class/Reference/Reference.html
 *  @details See @ref CoreFoundation-Subclass for concept of these objects.
 */
@interface NSAMutableString : NSMutableString {
    NSMutableString *_impl;
}

@end
