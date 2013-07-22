//
//  NSADictionary.h
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
 *  @brief [NSDictionary][0] subclass-available implementation.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSDictionary_Class/Reference/Reference.html
 *  @details See @ref CoreFoundation-Subclass for concept of these objects.
 */
@interface NSADictionary : NSDictionary {
    NSDictionary *_impl;
}

@end

/*!
 *  @brief [NSMutableDictionary][1] subclass-available implementation.
 *      [1]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSMutableDictionary_Class/Reference/Reference.html
 *  @details See @ref CoreFoundation-Subclass for concept of these objects.
 */
@interface NSAMutableDictionary : NSMutableDictionary {
    NSMutableDictionary *_impl;
}

@end
