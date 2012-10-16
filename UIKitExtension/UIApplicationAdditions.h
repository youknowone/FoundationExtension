//
//  UIApplicationAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 3. 27..
//  Copyright 2010 youknowone.org All rights reserved.
//

@interface UIApplication (FoundationExtension)

- (CGSize) statusBarOrientationReducedSize;
- (CGSize) statusBarSizeForOrientation:(UIInterfaceOrientation)orientation;

@property(nonatomic, readonly) CGSize statusBarOrientationReducedSize;

@end
