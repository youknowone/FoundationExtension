//
//  UITDetailViewController.h
//  UIKitExtensionTestApp
//
//  Created by Jeong YunWon on 12. 10. 24..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import <UIKitExtension/UIKitExtension.h>

@interface UITDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UIASegmentedImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImageView *drawView;

@end
