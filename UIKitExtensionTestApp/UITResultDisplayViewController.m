//
//  UITResultDisplayViewController.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 3. 31..
//  Copyright (c) 2013년 youknowone.org. All rights reserved.
//

#import "UITResultDisplayViewController.h"

@interface UITResultDisplayViewController ()

@end

@implementation UITResultDisplayViewController

@synthesize controller=_controller, label=_label, cancelButton=_cancelButton, inputField=_inputField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cancel:(id)sender {
    [self.controller setActive:NO animated:YES];
}

#pragma mark -

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.controller setActive:YES animated:YES];
}

- (void)valueChanged:(id)sender {
    [self.controller reloadResult];
}

#pragma mark -

- (BOOL)resultDisplayControllerShouldShowDimmingView:(UIAResultDisplayController *)controller {
    return ((UITextField *)self.controller.inputView).text.length == 0;
}

-(void)resultDisplayController:(UIAResultDisplayController *)controller willUnloadResultView:(id)resultView {

    [self.cancelButton setHidden:YES animated:YES];
    
    [(UITextField *)self.controller.inputView endEditing:YES];
    NSLog(@"!! will UNLOAD");
}

- (void)resultDisplayController:(UIAResultDisplayController *)controller didUnloadResultView:(id)resultView {
    NSLog(@"!! did UNLOAD");
}

- (void)resultDisplayController:(UIAResultDisplayController *)controller didLoadResultView:(id)resultView {
    CGRect contentsFrame = controller.contentsController.view.frame;
    CGFloat height = controller.inputView.frame.size.height;
    ((UIView *)resultView).frame = CGRectMake(0, height, contentsFrame.size.width, contentsFrame.size.height - height);

    [self.cancelButton setHidden:NO animated:YES];
    NSLog(@"!! did LOAD");
}

-(BOOL)resultDisplayControllerHidesNavigationBar:(UIAResultDisplayController *)controller {
    return YES;
}

- (void)resultDisplayController:(UIAResultDisplayController *)controller willHideSearchResultView:(id)resultView {
    NSLog(@"!!!! will HIDE");
}

- (void)resultDisplayController:(UIAResultDisplayController *)controller didHideSearchResultView:(id)resultView {
    NSLog(@"!!!! did HIDE");
}

- (void)resultDisplayController:(UIAResultDisplayController *)controller willShowSearchResultView:(id)resultView {
    NSLog(@"!!!! will SHOW");
}

- (void)resultDisplayController:(UIAResultDisplayController *)controller didShowSearchResultView:(id)resultView {
    NSLog(@"!!!! did SHOW");
}

- (void)resultDisplayController:(UIAResultDisplayController *)controller reloadResultView:(id)resultView {
    self.label.text = [(UITextField *)self.controller.inputView text];
}

@end
