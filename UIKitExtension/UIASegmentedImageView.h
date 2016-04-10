//
//  UIASegmentedImageView.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 6. 16..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <UIKit/UIKit.h>

#if !defined(TARGET_OS_IOS) || TARGET_OS_IOS

@interface UIASegmentedImageView : UIImageView

@property(nonatomic, strong) UIImage *centerImage;

@property(nonatomic, strong) UIImage *topImage;
@property(nonatomic, strong) UIImage *bottomImage;
@property(nonatomic, strong) UIImage *leftImage;
@property(nonatomic, strong) UIImage *rightImage;

@property(nonatomic, strong) UIImage *topLeftImage;
@property(nonatomic, strong) UIImage *topRightImage;
@property(nonatomic, strong) UIImage *bottomLeftImage;
@property(nonatomic, strong) UIImage *bottomRightImage;

@property(nonatomic, assign) BOOL autosizing;

@property(nonatomic, assign) CGFloat topMargin, bottomMargin, leftMargin, rightMargin;

- (instancetype)initWithCenterImage:(UIImage *)image;
//- (instancetype)initWithCenterImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage;

- (instancetype)initWithTopImage:(UIImage *)topImage centerImage:(UIImage *)centerImage bottomImage:(UIImage *)bottomImage;
- (instancetype)initWithLeftImage:(UIImage *)leftImage centerImage:(UIImage *)centerImage rightImage:(UIImage *)rightImage;

- (void)arrange;

@end

#endif
