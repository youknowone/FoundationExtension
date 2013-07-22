//
//  UIAResultDisplayController.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 3. 30..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <UIKit/UIKit.h>

#if NS_BLOCKS_AVAILABLE
@protocol UIADimmingViewDelegate;

/*!
 *  @brief A general dimming view to implement dimming like UISearchDisplayController is dimmed.
 */
@interface UIADimmingView : UIView

/*!
 *  @brief The view's delegate.
 */
@property(nonatomic, assign) IBOutlet id<UIADimmingViewDelegate> delegate;

@end

/*!
 *  @brief This protocol defines delegate methods for UIDimmingView objects.
 */
@protocol UIADimmingViewDelegate<NSObject>

@optional
/*!
 *  @brief Tells the delegate that the dimming view has been touched.
 *  @param view The dimming view.
 */
- (void)dimmingViewDidCancel:(UIADimmingView *)view;

@end


@protocol UIAResultDisplayDelegate;

/*!
 *  @brief A result display controller manages display of a input view and a result view that displays the results of a search of data by view insertion. This is working as a general version of UISearchDisplayController.
    @details
        You initialize a search display controller with a view controller responsible for managing the input view. When reloading is requested, the result display controller is responsible for superimposing the result interface over the original view controller’s view and showing the result view. The results are fully custumizable through delegate.
        The delegate conforms to the UIAResultDisplayDelegate protocol. It is a wrapped interface to simplify output from raw inputs. 
        Note that inputView should be subview of contentsViewController.view. And the contentsViewController's implementation should not depend on its view order. This controller will insert and remove others views to below and above of the inputView.
 */
@interface UIAResultDisplayController : NSObject<UIADimmingViewDelegate> {
@private
    UIViewController *_contentsController;
    UIADimmingView *_dimmingView;
    UIView *_resultView;
    id<UIAResultDisplayDelegate> _delegate;
    UIView *_inputView;
    struct {
        unsigned int visible:1;
        unsigned int animating:1;
        unsigned int hidNavigationBar:1;
        unsigned int navigationBarHidingEnabled:1;
        unsigned int resultViewLoaded:1;
        unsigned int delegateWillShowSearchResultView:1;
        unsigned int delegateDidShowSearchResultView:1;
        unsigned int delegateWillHideSearchResultView:1;
        unsigned int delegateDidHideSearchResultView:1;
        unsigned int delegateShouldShowDimmingView:1;
        unsigned int delegateShouldReloadResultView:1;
        unsigned int delegateReloadResultView:1;
    } _resultDisplayControllerFlags;
}

/*!
 *  @brief Returns a display controller initialized with the given contents controller.
 *  @param viewController The view controller that manages display of the original contents. The view of view controller must have inputView as its top level subview.
 */
- (id)initWithContentsController:(UIViewController *)viewController;

/*!
 *  @brief Request to reload result view.
 *  @details Call whenever any change is found in input. Its specific behavior is determined by delegate.
 */
- (void)reloadResult; // input

/*!
 *  @brief The controller's delegate.
 */
@property(nonatomic,assign) IBOutlet id<UIAResultDisplayDelegate> delegate;
/*!
 *  @brief The controller's dimming view.
 *  @details If nil, new one will be created.
 */
@property(nonatomic,retain) IBOutlet UIADimmingView *dimmingView;

/*!
 *  @brief The visibility state of the search interface.
 *  @details The default value is NO.
 *      If you set this value directly, any change is performed without animation. Use setActive:animated: if a change in state should be animated.
 *      When the controller receive a message reloadResult, the result display controller automatically displays the search interface. You can use this property to force the search interface to appear.
 */
@property(nonatomic,getter=isActive) BOOL active;
/*!
 *  @brief Displays or hides the result interface, optionally with animation.
 *  @param visible YES to display the result interface if it is not already displayed; NO to hide the result interface if it is currently displayed.
 *  @param animated YES to use animation for a change in visible state, otherwise NO.
 *  @see active
 */
- (void)setActive:(BOOL)visible animated:(BOOL)animated;

/*!
 *  @brief The view controller that manages the contents being searched. (read-only)
 *  @details The view controller must contain input view as one of its subviews.
 */
@property(nonatomic,readonly) IBOutlet UIViewController *contentsController;
/*!
 *  @brief The input view.
 *  @details When active becomes YES, the input view must not be nil. And it must should keep identical view unless active becomes NO.
 */
@property(nonatomic,assign) IBOutlet UIView *inputView; // this view must not be nil.
/*!
 *  @brief The result view.
 *  @details When active becomes YES, if the result view is nil, controller sends resultDisplayControllerLoadResultView: message to delegate. If the view is nil and delegate doesn't implement the message, controller raise an exception.
 */
@property(nonatomic,retain) IBOutlet UIView *resultView;

@end


/*
 *  @brief This protocol defines delegate methods for UIAResultDisplayController objects.
 */
@protocol UIAResultDisplayDelegate <NSObject>

@optional

/*!
 *  @brief Tells the delegate that the controller has loaded its result view.
 *  @param controller The result display controller which the receiver is the delegate.
 *  @param resultView The result view which did loaded.
 *  @details Called whenever active becomes YES, regardless of result view is set or not.
 */
- (void)resultDisplayController:(UIAResultDisplayController *)controller didLoadResultView:(id)resultView;
/*!
 *  @brief Tells the delegate that the controller will unload its result view.
 *  @param controller The result display controller which the receiver is the delegate.
 *  @param resultView The result view which will be unloaded.
 *  @details Called whenever active becomes NO, regardless of result view is unset or not.
 */
- (void)resultDisplayController:(UIAResultDisplayController *)controller willUnloadResultView:(id)resultView;
/*!
 *  @brief Tells the delegate that the controller has unloaded its result view.
 *  @param controller The result display controller which the receiver is the delegate.
 *  @param resultView The result view which did unloaded.
 *  @details Called whenever active becomes NO, regardless of result view is unset or not.
 */
- (void)resultDisplayController:(UIAResultDisplayController *)controller didUnloadResultView:(id)resultView;

/*!
 *  @brief Tells the delegate that the controller is about to display its result view.
 *  @param controller The result display controller which the receiver is the delegate.
 *  @param resultView The result view which is about to be displayed.
 */
- (void)resultDisplayController:(UIAResultDisplayController *)controller willShowSearchResultView:(id)resultView;
/*!
 *  @brief Tells the delegate that the controller just displayed its result view.
 *  @param controller The result display controller which the receiver is the delegate.
 *  @param resultView The result view which is just displayed.
 */
- (void)resultDisplayController:(UIAResultDisplayController *)controller didShowSearchResultView:(id)resultView;
/*!
 *  @brief Tells the delegate that the controller is about to hide its result view.
 *  @param controller The result display controller which the receiver is the delegate.
 *  @param resultView The result view which is about to be hidden.
 */
- (void)resultDisplayController:(UIAResultDisplayController *)controller willHideSearchResultView:(id)resultView;
/*!
 *  @brief Tells the delegate that the controller just hid its result view.
 *  @param controller The result display controller which the receiver is the delegate.
 *  @param resultView The result view which is just hidden.
 */
- (void)resultDisplayController:(UIAResultDisplayController *)controller didHideSearchResultView:(id)resultView;

/*!
 *  @brief Asks the delegate if the navigation bar should be hidden.
 *  @param controller The result display controller which the receiver is the delegate.
 *  @return YES if the display controller should hide its navigation bar when active becomes YES, otherwise NO.
 *  @details Default is YES. If YES, this affect the navigation bar of contents view controller's navigation controller.
 */
- (BOOL)resultDisplayControllerHidesNavigationBar:(UIAResultDisplayController *)controller;

/*!
 *  @brief Asks the delegate the result view.
 *  @param controller The result display controller which the receiver is the delegate.
 *  @details If the result view is nil when active goes YES, this delegate method is called.
 *  @return A view must not be nil.
 */
- (UIView *)resultDisplayControllerLoadResultView:(UIAResultDisplayController *)controller; // first load
/*!
 *  @brief Asks the delegate if the result view should show dimming view. The result view will be hidden.
 *  @param controller The result display controller which the receiver is the delegate.
 *  @details Called if -reloadResult is called. If you don't implement this method, dimming view is disabled.
 *  @return YES if the display controller should show dimming view now, otherwise NO.
 */
- (BOOL)resultDisplayControllerShouldShowDimmingView:(UIAResultDisplayController *)controller;
/*!
 *  @brief Asks the delegate if the result view should reload its result view.
 *  @param controller The result display controller which the receiver is the delegate.
 *  @details Called if -reloadResult is called and dimming view is not displayed. If you don't implement this method, result view is reloaded as soon as the -reloadResult is called.
 *  @return YES if the display controller should reload result view now, otherwise NO.
 */
- (BOOL)resultDisplayControllerShouldReloadResultView:(UIAResultDisplayController *)controller;
/*!
 *  @brief Tells the delegate that the controller needs reload the result view.
 *  @param controller The result display controller which the receiver is the delegate.
 *  @param resultView The result view which needs to be reloaded.
 */
- (void)resultDisplayController:(UIAResultDisplayController *)controller reloadResultView:(id)resultView;
/*!
 *  @brief Tells the delegate that the controller needs unload the result view.
 *  @param controller The result display controller which the receiver is the delegate.
 *  @param resultView The result view which needs to be unloaded.
 *  @details Called if view is loaded by delegate, otherwise not.
 */
- (void)resultDisplayController:(UIAResultDisplayController *)controller unloadResultView:(id)resultView;

@end
#endif
