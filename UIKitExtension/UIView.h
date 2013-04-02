//
//  UIView.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 3. 30..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

/*!
 *  @brief The common animation duration constant of UIKit.
 *  @details This is just an assumation.
 */
FOUNDATION_EXTERN const NSTimeInterval UIAViewAnimationDefaultDuraton;

#if NS_BLOCKS_AVAILABLE
/*!
 *  @brief UIView animation shortcuts
 */
@interface UIView (Animation)

/*!
 *  @brief Set whether the view is hidden.
 *  @details If 'animated' property is NO, this method calls [-setHidden:][0]; Otherwise, when starting, object's 'hidden' property is set to NO. If given hidden parameter is YES, 'hidden' property is set to YES after end of animation. This may cause confliction with other animations or accessors.
 *  @param If YES, the view become hidden; otherwise, NO.
 *  @param If YES, animates the transition; otherwise, does not.
 *  @see [hidden][0]
    [0]: http://developer.apple.com/library/ios/documentation/UIKit/Reference/UIView_Class/UIView/UIView.html#//apple_ref/occ/instp/UIView/hidden
 */
- (void)setHidden:(BOOL)hidden animated:(BOOL)animated;

@end

#endif
