//
//  NSAString.h
//  FoundationExtension
//
//  Created by youknowone on 12. 10. 25..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @brief Subclass available string implementation;
 */
@interface NSAString : NSString {
    NSString *_impl;
}

@end


/*!
 *  @brief Subclass available mutable string implementation;
 */
@interface NSAMutableString : NSMutableString {
    NSMutableString *_impl;
}

@end
