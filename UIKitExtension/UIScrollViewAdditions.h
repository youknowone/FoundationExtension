//
//  UIScrollViewAdditions.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 11. 6. 15..
//  Copyright 2011 youknowone.org All rights reserved.
//

/*!
 *  @brief UIScrollView shortcuts
 */
@interface UIScrollView (FE_Shortcuts)

/*!
 *  @brief frame representation for -contentSize
 */
@property(nonatomic, readonly) CGRect contentFrame;
/*!
 *  @brief bounds representation for -contentSize
 */
@property(nonatomic, readonly) CGRect contentBounds;

@end
