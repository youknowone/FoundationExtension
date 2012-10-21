//
//  UIScrollViewAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 11. 6. 15..
//  Copyright 2011 youknowone.org All rights reserved.
//

/*!
 *  @headerfile UIScrolViewAdditions.h UIScrollView extension
 */

/*!
 *  @brief UIScrollView shortcuts
 */
@interface UIScrollView (FoundationExtension)

/*!
 *  @brief frame representation for -contentSize
 */
@property(nonatomic, readonly) CGRect contentFrame;
/*!
 *  @brief bounds representation for -contentSize
 */
@property(nonatomic, readonly) CGRect contentBounds;

@end
