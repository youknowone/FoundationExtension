//
//  UIApplication.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 3. 27..
//  Copyright 2010 youknowone.org All rights reserved.
//

//! @brief UIApplication extensions
@interface UIApplication (Shortcuts)

//! @brief statusbar size calculated for current orientation
@property(nonatomic, readonly) CGRect statusBarFrameForCurrentOrientation;
//! @brief statusbar size calculated for a given orientation
- (CGRect)statusBarFrameForOrientation:(UIInterfaceOrientation)orientation;

//! @deprecated Use statusBarFrameForCurrentOrientation
- (CGSize)statusBarOrientationReducedSize __deprecated;
//! @deprecated Use statusBarFrameForOrientation:
- (CGSize)statusBarSizeForOrientation:(UIInterfaceOrientation)orientation __deprecated;

@end
