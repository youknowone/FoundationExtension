//
//  UIScrollView.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 11. 6. 15..
//  Copyright 2011 youknowone.org All rights reserved.
//

#import "UIScrollView.h"

#import "UIView.h"


@implementation UIScrollView (Shortcuts)

- (CGRect) contentFrame {
    CGRect f;
    f.origin = self.frame.origin;
    f.size = self.contentSize;
    return f;
}

- (CGRect) contentBounds {
    CGRect f;
    f.origin = CGPointZero;
    f.size = self.contentSize;
    return f;
}

- (void)setContentSizeBySubviewBoundary {
    [self setContentSizeBySubviewBoundaryWithAdditionalMargins:CGPointZero];
}

- (void)setContentSizeBySubviewBoundaryWithAdditionalMargins:(CGPoint)margins {
    BOOL showsHorizontalScrollIndicator = self.showsHorizontalScrollIndicator;
    BOOL showsVerticalScrollIndicator = self.showsVerticalScrollIndicator;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    if (self.subviews.count == 0) {
        [self setContentSize:CGSizeZero];
    } else {
        CGSize maximumSize = CGSizeZero;
        for (UIView *view in self.subviews) {
            maximumSize = CGSizeMake(MAX(maximumSize.width, view.frameEnd.x), MAX(maximumSize.height, view.frameEnd.y));
        }
        CGSize contentSize = CGSizeMake(maximumSize.width + margins.x, maximumSize.height + margins.y);
        self.contentSize = contentSize;
    }
    self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator;
    self.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
}

- (void)setContentSizeBySubviewBoundaryWithAutoMargins {
    if (self.subviews.count == 0) {
        [self setContentSize:CGSizeZero];
    } else {
        CGPoint basePoint = CGPointMake(INFINITY, INFINITY);
        for (UIView *view in self.subviews) {
            CGRect frame = view.frame;
            basePoint = CGPointMake(MIN(basePoint.x, frame.origin.x), MIN(basePoint.y, frame.origin.y));
        }
        [self setContentSizeBySubviewBoundaryWithAdditionalMargins:basePoint]; // not efficient, but ok for most of cases
    }
}

@end
