//
//  UIAViewController.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 5. 24..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "UIAViewController.h"

@interface UIAViewController ()

@end

@implementation UIAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.view respondsToSelector:@selector(viewDidLoad)]) {
        [self.view viewDidLoad];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([self.view respondsToSelector:@selector(viewWillAppear:)]) {
        [self.view viewWillAppear:animated];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ([self.view respondsToSelector:@selector(viewDidAppear:)]) {
        [self.view viewDidAppear:animated];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    if ([self.view respondsToSelector:@selector(viewWillDisappear:)]) {
        [self.view viewWillDisappear:animated];
    }
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    if ([self.view respondsToSelector:@selector(viewDidDisappear:)]) {
        [self.view viewDidDisappear:animated];
    }
    [super viewDidDisappear:animated];
}

- (void)viewWillUnload __deprecated {
    if ([self.view respondsToSelector:@selector(viewWillUnload)]) {
        [self.view viewWillUnload];
    }
    [super viewWillUnload];
}

- (void)viewDidUnload __deprecated {
    if ([self.view respondsToSelector:@selector(viewDidUnload)]) {
        [self.view viewDidUnload];
    }
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning {
    if ([self.view respondsToSelector:@selector(didReceiveMemoryWarning)]) {
        [self.view didReceiveMemoryWarning];
    }
    [super didReceiveMemoryWarning];
}

@end
