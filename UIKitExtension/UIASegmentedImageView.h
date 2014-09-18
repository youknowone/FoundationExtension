//
//  UIASegmentedImageView.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 6. 16..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIASegmentedImageView : UIImageView

@property(nonatomic, retain) UIImage *centerImage;

@property(nonatomic, retain) UIImage *topImage;
@property(nonatomic, retain) UIImage *bottomImage;
@property(nonatomic, retain) UIImage *leftImage;
@property(nonatomic, retain) UIImage *rightImage;

@property(nonatomic, retain) UIImage *topLeftImage;
@property(nonatomic, retain) UIImage *topRightImage;
@property(nonatomic, retain) UIImage *bottomLeftImage;
@property(nonatomic, retain) UIImage *bottomRightImage;

@property(nonatomic, assign) BOOL autosizing;

@property(nonatomic, assign) CGFloat topMargin, bottomMargin, leftMargin, rightMargin;

- (instancetype)initWithCenterImage:(UIImage *)image;
//- (instancetype)initWithCenterImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage;

- (instancetype)initWithTopImage:(UIImage *)topImage centerImage:(UIImage *)centerImage bottomImage:(UIImage *)bottomImage;
- (instancetype)initWithLeftImage:(UIImage *)leftImage centerImage:(UIImage *)centerImage rightImage:(UIImage *)rightImage;

- (void)arrange;

@end
