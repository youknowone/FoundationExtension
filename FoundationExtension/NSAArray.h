//
//  NSAArray.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 24..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @page CoreFoundation-Subclass
 *  @brief Subclass support objects for CoreFoundation object.
 *
 *  In Foundation.framework, there is some classes not implemented in Foundation.
 *  They are implemented in CoreFoundation and wrapped like Objective-C object.
 *
 *  This helps boost Foundation.framework being fast, but subclassing these classes makes some problem.
 *  FoundationExtension supports subclass-available interface for these objects.
 *
 *  These classes are filling missing part of Foundation implementation with an original class object.
 *  You can subclass this and implement your own features, rather than adding purpose-specific categories.
 *  Additional variables are available easily too.
 *
 *  @see NSAArray
 *  @see NSAMutableArray
 *  @see NSADictionary
 *  @see NSAMutableDictionary
 *  @see NSAString
 *  @see NSAMutableString
 */

#import <Foundation/Foundation.h>

/*!
 *  @file
 *  @brief See @ref CoreFoundation-Subclass for concept of these objects.
 */

/*!
 *  @brief [NSArray][0] subclass-available implementation.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSArray_Class/NSArray.html
 *  @details See @ref CoreFoundation-Subclass for concept of these objects.
 */
@interface NSAArray : NSArray {
    NSArray *_impl;
}

@end


/*!
 *  @brief [NSMutableArray][1] subclass-available implementation.
 *      [1]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSMutableArray_Class/Reference/Reference.html
 *  @details See @ref CoreFoundation-Subclass for concept of these objects.
 */
@interface NSAMutableArray : NSMutableArray {
    NSMutableArray *_impl;
}

@end
