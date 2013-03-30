//
//  UIView.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 3. 30..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "UIView.h"

#if NS_BLOCKS_AVAILABLE
@implementation UIView (Animation)

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated {
    #define UIKIT_DEFAULT_ANIMATION_DURATION 0.2 // assumation
    if (!animated || self.hidden == hidden) {
        self.hidden = hidden;
        return;
    }

    CGFloat backupAlpha = self.alpha;
    CGFloat endAlpha;

    if (hidden) {
        endAlpha = .0;
    } else {
        self.alpha = .0;
        endAlpha = backupAlpha;
        self.hidden = NO;
    }

    [[self class] animateWithDuration:UIKIT_DEFAULT_ANIMATION_DURATION animations:^(void) {
        self.alpha = endAlpha;
    } completion:^(BOOL finished) {
        if (hidden) {
            self.alpha = backupAlpha;
            self.hidden = YES; // value compatibility - this delayed action may be cause of unknown strange behavior.
        }
    }];
    #undef UIKIT_DEFAULT_ANIMATION_DURATION
}

@end
#endif
