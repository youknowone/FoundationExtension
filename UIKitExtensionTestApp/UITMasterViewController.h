//
//  UITMasterViewController.h
//  UIKitExtensionTestApp
//
//  Created by Jeong YunWon on 12. 10. 24..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UITDetailViewController;

@interface UITMasterViewController : UITableViewController

@property (strong, nonatomic) UITDetailViewController *detailViewController;

@end
