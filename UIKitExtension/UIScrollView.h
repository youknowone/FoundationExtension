//
//  UIScrollView.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 11. 6. 15..
//  Copyright 2011 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [UIScrollView][0] extension
 *      [0]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIScrollView_Class/Reference/UIScrollView.html
 */

#import <UIKit/UIKit.h>

/*!
 *  @brief UIScrollView shortcuts
 */
@interface UIScrollView (Shortcuts)

/*!
 *  @brief Frame representation for contentSize
 *  @see [contentSize][0]
 *      [0]: http://developer.apple.com/library/ios/documentation/UIKit/Reference/UIScrollView_Class/Reference/UIScrollView.html#//apple_ref/occ/instp/UIScrollView/contentSize
 */
@property(nonatomic, readonly) CGRect contentFrame;
/*!
 *  @brief Bounds representation for contentSize
 *  @see [contentSize][0]
 *      [0]: http://developer.apple.com/library/ios/documentation/UIKit/Reference/UIScrollView_Class/Reference/UIScrollView.html#//apple_ref/occ/instp/UIScrollView/contentSize
 */
@property(nonatomic, readonly) CGRect contentBounds;

@end
