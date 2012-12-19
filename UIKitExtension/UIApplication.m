//
//  UIApplication.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 3. 27..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "UIApplication.h"

@implementation UIApplication (Shortcuts)

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
