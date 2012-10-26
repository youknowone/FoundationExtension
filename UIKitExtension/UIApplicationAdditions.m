//
//  UIApplicationAdditions.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 3. 27..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "UIApplicationAdditions.h"

@implementation UIApplication (FoundationExtension)

// this should be private method?
- (CGRect)statusBarFrameForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        return self.statusBarFrame;
    }
    CGRect rawFrame = self.statusBarFrame;
    return CGRectMake(rawFrame.origin.y, rawFrame.origin.x, rawFrame.size.height, rawFrame.size.width);
}

- (CGRect)statusBarFrameForCurrentOrientation {
    return [self statusBarFrameForOrientation:self.statusBarOrientation];
}

- (CGSize) statusBarOrientationReducedSize {
    return [self statusBarSizeForOrientation:self.statusBarOrientation];
}

- (CGSize) statusBarSizeForOrientation:(UIInterfaceOrientation)orientation {
    if ( UIInterfaceOrientationIsPortrait(orientation) ) return self.statusBarFrame.size;
    return CGSizeMake(self.statusBarFrame.size.height, self.statusBarFrame.size.width);
}

@end
