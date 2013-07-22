//
//  UIAViewController.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 5. 24..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIAViewLifeCycle <NSObject>

@optional
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (void)viewDidDisappear:(BOOL)animated;
- (void)viewWillUnload __deprecated;
- (void)viewDidUnload __deprecated;
- (void)didReceiveMemoryWarning;

@end

/*!
 *  @brief UIView with refined lifecycle. (testing)
 */
@interface UIAViewController : UIViewController

@property(nonatomic, retain) UIView<UIAViewLifeCycle> *view;

@end
