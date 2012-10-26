//
//  NSADictionary.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 25..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @brief Subclass available dictionary implementation;
 */
@interface NSADictionary : NSDictionary {
    NSDictionary *_impl;
}

@end

/*!
 *  @brief Subclass available mutable array implementation;
 */
@interface NSAMutableDictionary : NSMutableDictionary {
    NSMutableDictionary *_impl;
}

@end
