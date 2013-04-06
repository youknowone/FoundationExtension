//
//  UIActivityIndicatorView.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 6..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "UIActivityIndicatorView.h"

@implementation UIActivityIndicatorView (Property)

- (BOOL)animating {
    return [self isAnimating]; // avoid naming warning...
}

- (void)setAnimating:(BOOL)animating {
    if (animating) {
        [self startAnimating];
    } else {
        [self stopAnimating];
    }
}

@end
