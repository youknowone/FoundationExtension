//
//  UIApplicationAdditions.m
//  FoundationExtension
//
//  Created by youknowone on 10. 3. 27..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "UIApplicationAdditions.h"

@implementation UIApplication (FoundationExtension)

- (CGSize) statusBarOrientationReducedSize {
    return [self statusBarSizeForOrientation:self.statusBarOrientation];
}

- (CGSize) statusBarSizeForOrientation:(UIInterfaceOrientation)orientation {
    if ( UIInterfaceOrientationIsPortrait(orientation) ) return self.statusBarFrame.size;
	return CGSizeMake(self.statusBarFrame.size.height, self.statusBarFrame.size.width);
}

@end
