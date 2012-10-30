//
//  NSADictionary.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 25..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @brief Subclass available dictionary implementation.
 *  @details See @ref CoreFoundation-Subclass for concept of these objects.
 */
@interface NSADictionary : NSDictionary {
    NSDictionary *_impl;
}

@end

/*!
 *  @brief Subclass available mutable dictionary implementation.
 *  @details See @ref CoreFoundation-Subclass for concept of these objects.
 */
@interface NSAMutableDictionary : NSMutableDictionary {
    NSMutableDictionary *_impl;
}

@end
