//
//  NSAArray.h
//  FoundationExtension
//
//  Created by youknowone on 12. 10. 24..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @brief Subclass available array implementation;
 */
@interface NSAArray : NSArray {
    NSArray *_impl;
}

@end


/*!
 *  @brief Subclass available mutable array implementation;
 */
@interface NSAMutableArray : NSMutableArray {
    NSMutableArray *_impl;
}

@end
