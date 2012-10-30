//
//  NSAString.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 25..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @brief Subclass available string implementation.
 *  @details See @ref CoreFoundation-Subclass for concept of these objects.
 */
@interface NSAString : NSString {
    NSString *_impl;
}

@end


/*!
 *  @brief Subclass available mutable string implementation.
 *  @details See @ref CoreFoundation-Subclass for concept of these objects.
 */
@interface NSAMutableString : NSMutableString {
    NSMutableString *_impl;
}

@end
