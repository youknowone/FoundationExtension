//
//  UIAResultDisplayController.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 3. 30..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "NSTimer.h"
#import "UIView.h"

#import "UIAResultDisplayController.h"

@implementation UIADimmingView

@synthesize delegate=_delegate;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.7;
        self.contentMode = UIViewContentModeScaleToFill;
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.delegate dimmingViewDidCancel:self];
    [super touchesEnded:touches withEvent:event];
}

@end


#pragma mark -


#if NS_BLOCKS_AVAILABLE
@implementation UIAResultDisplayController

@synthesize contentsController=_contentsController;
@synthesize inputView=_inputView;

- (id)initWithContentsController:(UIViewController *)viewController {
    self = [super init];
    if (self != nil) {
        self->_contentsController = [viewController retain];
    }
    return self;
}

- (void)dealloc {
    [self->_contentsController release];
    self.dimmingView = nil;
    self.resultView = nil;
    [super dealloc];
}

- (id<UIAResultDisplayDelegate>)delegate {
    return self->_delegate;
}

- (void)setDelegate:(id<UIAResultDisplayDelegate>)delegate {
    self->_delegate = delegate;
    // cache it has selectors or not
    BOOL navigationBarHidingEnabled = ![self->_delegate respondsToSelector:@selector(resultDisplayControllerHidesNavigationBar:)] || [self->_delegate resultDisplayControllerHidesNavigationBar:self];
    self->_resultDisplayControllerFlags.navigationBarHidingEnabled = navigationBarHidingEnabled;

    self->_resultDisplayControllerFlags.delegateWillShowSearchResultView = [self->_delegate respondsToSelector:@selector(resultDisplayController:willShowSearchResultView:)];
    self->_resultDisplayControllerFlags.delegateDidShowSearchResultView = [self->_delegate respondsToSelector:@selector(resultDisplayController:didShowSearchResultView:)];
    self->_resultDisplayControllerFlags.delegateWillHideSearchResultView = [self->_delegate respondsToSelector:@selector(resultDisplayController:willHideSearchResultView:)];
    self->_resultDisplayControllerFlags.delegateDidHideSearchResultView = [self->_delegate respondsToSelector:@selector(resultDisplayController:didHideSearchResultView:)];
    self->_resultDisplayControllerFlags.delegateShouldShowDimmingView = [self->_delegate respondsToSelector:@selector(resultDisplayControllerShouldShowDimmingView:)];
    self->_resultDisplayControllerFlags.delegateShouldReloadResultView = [self->_delegate respondsToSelector:@selector(resultDisplayControllerShouldReloadResultView:)];
    self->_resultDisplayControllerFlags.delegateReloadResultView = [self->_delegate respondsToSelector:@selector(resultDisplayController:reloadResultView:)];
}

- (void)loadResultView {
    // delegate is required at this position
    if (![self->_delegate respondsToSelector:@selector(resultDisplayControllerLoadResultView:)]) {
        return;
    }
    // check it is not nil
    self->_resultView = [self->_delegate resultDisplayControllerLoadResultView:self];
    if (self->_resultView == nil) {
        return;
    }
    // mark loader by delegate
    self->_resultDisplayControllerFlags.resultViewLoaded = YES;
}

- (void)_loadResult:(BOOL)animated {
    BOOL needDim = self->_resultDisplayControllerFlags.delegateShouldShowDimmingView && [self->_delegate resultDisplayControllerShouldShowDimmingView:self];
    UIView *resultView = self.resultView;
    BOOL needChange = self->_resultView.hidden != needDim;
    if (needChange) {
        if (needDim) {
            // view will hide
            if (self->_resultDisplayControllerFlags.delegateWillHideSearchResultView) {
                [self->_delegate resultDisplayController:self willHideSearchResultView:self.resultView];
            }
        } else {
            // view will show
            if (self->_resultDisplayControllerFlags.delegateWillShowSearchResultView) {
                [self->_delegate resultDisplayController:self willShowSearchResultView:self.resultView];
            }
        }
        [resultView setHidden:needDim animated:animated];

        NSATimerBlock finish = ^(void) {
            if (needDim) {
                // view did hide
                if (self->_resultDisplayControllerFlags.delegateDidHideSearchResultView) {
                    [self->_delegate resultDisplayController:self didHideSearchResultView:self.resultView];
                }
            } else {
                // view did show
                if (self->_resultDisplayControllerFlags.delegateDidShowSearchResultView) {
                    [self->_delegate resultDisplayController:self didShowSearchResultView:self.resultView];
                }
            }
        };

        if (animated) {
            [NSTimer dispatchTimerWithTimeInterval:UIAViewAnimationDefaultDuraton block:finish];
        } else {
            finish();
        }
    }
    if (!needDim && self->_resultDisplayControllerFlags.delegateReloadResultView) {
        [self->_delegate resultDisplayController:self reloadResultView:self.resultView];
    }
}

- (void)reloadResult {
    BOOL needReload = YES;
    if (self->_resultDisplayControllerFlags.delegateShouldReloadResultView) {
        needReload = [self->_delegate resultDisplayControllerShouldReloadResultView:self];
    }
    if (!needReload) return;

    [self _loadResult:YES];
}

- (UIADimmingView *)dimmingView {
    if (self->_dimmingView == nil) {
        self.dimmingView = [[[UIADimmingView alloc] initWithFrame:self.contentsController.view.bounds] autorelease];
    }
    return self->_dimmingView;
}

- (void)setDimmingView:(UIADimmingView *)dimmingView {
    if (self->_dimmingView == dimmingView) return;
    [dimmingView retain];
    [self->_dimmingView release];
    self->_dimmingView = dimmingView;
    self->_dimmingView.delegate = self;
}

- (BOOL)isActive {
    return self->_resultDisplayControllerFlags.visible;
}

- (void)setActive:(BOOL)active {
    [self setActive:active animated:NO];
}

- (void)setActive:(BOOL)visible animated:(BOOL)animated {
    if (self.isActive == visible) return;

    // set marker
    self->_resultDisplayControllerFlags.visible = visible;

    // navigation bar animation - not controllable here
    UINavigationController *navigationController = self->_contentsController.navigationController;
    if (navigationController != nil) {
        if (self->_resultDisplayControllerFlags.navigationBarHidingEnabled) {
            [navigationController setNavigationBarHidden:visible animated:animated];
            self->_resultDisplayControllerFlags.hidNavigationBar = visible;
        }
    }

    BOOL needDim = self->_resultDisplayControllerFlags.delegateShouldShowDimmingView && [self->_delegate resultDisplayControllerShouldShowDimmingView:self];

    UIView *resultView = self.resultView;
    if (visible) {
        if ([self->_delegate respondsToSelector:@selector(resultDisplayController:didLoadResultView:)]) {
            [self->_delegate resultDisplayController:self didLoadResultView:resultView];
        }

        self.dimmingView.hidden = YES;
        if (needDim) {
            [self.dimmingView setHidden:NO animated:YES];
            self.resultView.hidden = YES;
        } else {
            self.resultView.hidden = NO;
        }
        [self.contentsController.view insertSubview:self.dimmingView belowSubview:self.inputView];
        [self.contentsController.view insertSubview:self.resultView aboveSubview:self.inputView];

        [self _loadResult:animated];
    } else {
        BOOL needHiding = !self.resultView.hidden;
        if (needHiding) {
            // view will hide
            if (self->_resultDisplayControllerFlags.delegateWillHideSearchResultView) {
                [self->_delegate resultDisplayController:self willHideSearchResultView:resultView];
            }
        }

        NSATimerBlock finish = ^(void) {
            [self.dimmingView removeFromSuperview];
            [self.resultView removeFromSuperview];

            if (needHiding) {
                // view did hide
                if (self->_resultDisplayControllerFlags.delegateDidHideSearchResultView) {
                    [self->_delegate resultDisplayController:self didHideSearchResultView:resultView];
                }
            }

            if (self->_resultDisplayControllerFlags.resultViewLoaded) {
                if ([self->_delegate respondsToSelector:@selector(resultDisplayController:unloadResultView:)]) {
                    [self->_delegate resultDisplayController:self unloadResultView:resultView];
                }
                self.resultView = nil;
            }

            if (!animated && [self->_delegate respondsToSelector:@selector(resultDisplayController:willUnloadResultView:)]) {
                [self->_delegate resultDisplayController:self willUnloadResultView:resultView];
            }

            if ([self->_delegate respondsToSelector:@selector(resultDisplayController:didUnloadResultView:)]) {
                [self->_delegate resultDisplayController:self didUnloadResultView:resultView];
            }
        };

        if (animated) {
            [self.dimmingView setHidden:YES animated:YES];
            if (needHiding) {
                [self.resultView setHidden:YES animated:YES];
            }

            if ([self->_delegate respondsToSelector:@selector(resultDisplayController:willUnloadResultView:)]) {
                [self->_delegate resultDisplayController:self willUnloadResultView:resultView];
            }
            
            [NSTimer dispatchTimerWithTimeInterval:UIAViewAnimationDefaultDuraton block:finish];
        } else {
            finish();
        }
    }

    self->_resultDisplayControllerFlags.visible = visible;
}

- (id)resultView {
    if (self->_resultView == nil) {
        [self loadResultView];
    }
    return self->_resultView;
}

- (void)setResultView:(id)resultView {
    if (self->_resultView == resultView) {
        return;
    }

    self->_resultDisplayControllerFlags.resultViewLoaded = NO;
    BOOL origHiden = (self->_resultView == nil) || self->_resultView.hidden;

    [self->_resultView release];

    if (resultView == nil) {
        self->_resultView = nil;
        return;
    }

    self->_resultView = [resultView retain];
    self->_resultView.hidden = origHiden;
}

#pragma mark dimming view delegate

- (void)dimmingViewDidCancel:(UIADimmingView *)view {
    [self setActive:NO animated:YES];
}

@end

#endif
