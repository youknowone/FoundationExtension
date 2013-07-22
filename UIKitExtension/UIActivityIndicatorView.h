//
//  UIActivityIndicatorView.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 6..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  @brief [UIActivityIndicatorView][0] shortcut properties.
 *      [0]: http://developer.apple.com/library/ios/#documentation/uikit/reference/UIActivityIndicatorView_Class/Reference/UIActivityIndicatorView.html
 */
@interface UIActivityIndicatorView (Property)

/*!
 *  @brief The animating state of the activity indicator view.
 *  @details
 *      If you get this value, it redirects to [-isAnimating:][1]
 *      If you set this value YES, it redirects to [-startAnimating:][2]
 *      if you set this value NO, it redirects to [-stopAnimating:][3]
 *      [1]: http://developer.apple.com/library/ios/documentation/uikit/reference/UIActivityIndicatorView_Class/Reference/UIActivityIndicatorView.html#//apple_ref/occ/instm/UIActivityIndicatorView/isAnimating
 *      [2]: http://developer.apple.com/library/ios/documentation/uikit/reference/UIActivityIndicatorView_Class/Reference/UIActivityIndicatorView.html#//apple_ref/occ/instm/UIActivityIndicatorView/startAnimating
 *      [3]: http://developer.apple.com/library/ios/documentation/uikit/reference/UIActivityIndicatorView_Class/Reference/UIActivityIndicatorView.html#//apple_ref/occ/instm/UIActivityIndicatorView/stopAnimating
 */
@property(nonatomic, assign/*, getter=isAnimating*/) BOOL animating;

@end
