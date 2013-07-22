//
//  UIView.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 3. 30..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIViewAutoresizingFlexibleVertical (UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin)
#define UIViewAutoresizingFlexibleHorizontal (UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleBottomMargin)
#define UIViewAutoresizingFlexibleSize (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight)
#define UIViewAutoresizingFlexibleAll (UIViewAutoresizingFlexibleVertical|UIViewAutoresizingFlexibleHorizontal)

/*!
 *  @brief The common animation duration constant of UIKit.
 *  @details This is just an assumation.
 */
FOUNDATION_EXTERN const NSTimeInterval UIAViewAnimationDefaultDuraton;

#if NS_BLOCKS_AVAILABLE
/*!
 *  @brief Animation block signature for UIView animation methods.
 */
typedef void (^UIAViewAnimationBlock)();
/*!
 *  @brief Animation completion block signature for UIView animation methods.
 */
typedef void (^UIAViewAnimationCompletionBlock)(BOOL finished);


/*!
 *  @brief A holder of UIView for interface builder instead of UIViewController.
 */
@interface UIAViewHolder: NSObject

@property(nonatomic, retain) IBOutlet id view;

@end

/*!
 *  @brief UIView loader from InterfaceBuilder
 */
@interface UIView (InterfaceBuilder)

/*!
 *  @brief Pick a view from nib file.
 *  @warning This method load view from UIViewController or UIViewHolder nib file.
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

- (id)initWithPlatformSuffixedNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

@end

/*!
 *  @brief UIView animation shortcuts
 */
@interface UIView (Animation)

/*!
 *  @brief Animate changes to one or more views using the UIKit deafult animation duration @ref UIAViewAnimationDefaultDuraton.
 *  @param animations A block object containing the changes to commit to the views. This is where you programmatically change any animatable properties of the views in your view hierarchy. This block takes no parameters and has no return value. This parameter must not be NULL.
 *  @details
        This method performs the specified animations immediately using the UIViewAnimationOptionCurveEaseInOut and UIViewAnimationOptionTransitionNone animation options.
        During an animation, user interactions are temporarily disabled for the views being animated. (Prior to iOS 5, user interactions are disabled for the entire application.)
 *  @see [animateWithDuration:animations:][0]
 *      [0]: http://developer.apple.com/library/ios/documentation/UIKit/Reference/UIView_Class/UIView/UIView.html#//apple_ref/occ/clm/UIView/animateWithDuration:animations:
 */
+ (void)animateWithDefaultDurationAnimations:(UIAViewAnimationBlock)animations;

/*!
 *  @brief Set whether the view is hidden.
 *  @details If 'animated' property is NO, this method calls [-setHidden:][0]; Otherwise, when starting, object's 'hidden' property is set to NO. If given hidden parameter is YES, 'hidden' property is set to YES after end of animation. This may cause confliction with other animations or accessors.
 *  @param hidden If YES, the view become hidden; otherwise, NO.
 *  @param animated If YES, animates the transition; otherwise, does not.
 *  @see [hidden][0]
    [0]: http://developer.apple.com/library/ios/documentation/UIKit/Reference/UIView_Class/UIView/UIView.html#//apple_ref/occ/instp/UIView/hidden
 */
- (void)setHidden:(BOOL)hidden animated:(BOOL)animated;

@end

#endif
