//
//  UIView.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 3. 30..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

const NSTimeInterval UIAViewAnimationDefaultDuraton = 0.2;

#import "UIView.h"

#if NS_BLOCKS_AVAILABLE
@implementation UIView (Animation)

+ (void)animateWithDefaultDurationAnimations:(UIAViewAnimationBlock)animations {
    [self animateWithDuration:UIAViewAnimationDefaultDuraton animations:animations];
}

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated {
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

    [[self class] animateWithDuration:UIAViewAnimationDefaultDuraton animations:^(void) {
        self.alpha = endAlpha;
    } completion:^(BOOL finished) {
        if (hidden) {
            self.alpha = backupAlpha;
            self.hidden = YES; // value compatibility - this delayed action may be cause of unknown strange behavior.
        }
    }];
}

@end

#endif
