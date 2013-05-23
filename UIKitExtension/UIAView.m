//
//  UIAView.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 5. 24..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "UIAView.h"

@implementation UIAView

- (void)viewDidLoad {
    for (id view in self.subviews) {
        if ([view respondsToSelector:@selector(viewDidLoad)]) {
            [view viewDidLoad];
        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    for (id view in self.subviews) {
        if ([view respondsToSelector:@selector(viewWillAppear:)]) {
            [view viewWillAppear:animated];
        }
    }
}

- (void)viewDidAppear:(BOOL)animated {
    for (id view in self.subviews) {
        if ([view respondsToSelector:@selector(viewDidAppear:)]) {
            [view viewDidAppear:animated];
        }
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    for (id view in self.subviews) {
        if ([view respondsToSelector:@selector(viewWillDisappear:)]) {
            [view viewWillDisappear:animated];
        }
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    for (id view in self.subviews) {
        if ([view respondsToSelector:@selector(viewDidDisappear:)]) {
            [view viewDidDisappear:animated];
        }
    }
}

- (void)viewWillUnload {
    for (id view in self.subviews) {
        if ([view respondsToSelector:@selector(viewWillUnload)]) {
            [view viewWillUnload];
        }
    }
}

- (void)viewDidUnload {
    for (id view in self.subviews) {
        if ([view respondsToSelector:@selector(viewDidUnload)]) {
            [view viewDidUnload];
        }
    }
}

- (void)didReceiveMemoryWarning {
    for (id view in self.subviews) {
        if ([view respondsToSelector:@selector(didReceiveMemoryWarning)]) {
            [view didReceiveMemoryWarning];
        }
    }
}

@end
