//
//  UITResultDisplayViewController.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 3. 31..
//  Copyright (c) 2013년 youknowone.org. All rights reserved.
//

#import <UIKitExtension/UIKitExtension.h>

@interface UITResultDisplayViewController : UIViewController<UITextFieldDelegate, UIAResultDisplayDelegate>

@property(nonatomic, retain) IBOutlet UIAResultDisplayController *controller;
@property(nonatomic, retain) IBOutlet UITextField *inputField;
@property(nonatomic, retain) IBOutlet UILabel *label;
@property(nonatomic, retain) IBOutlet UIButton *cancelButton;

- (IBAction)valueChanged:(id)sender;
- (IBAction)cancel:(id)sender;

@end
