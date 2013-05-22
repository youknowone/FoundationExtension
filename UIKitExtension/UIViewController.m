//
//  UIViewController.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 5. 22..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "UIViewController.h"

@implementation UIViewController (Shortcuts)

- (id)initWithPlatformSuffixedNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSString *suffix = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone ? @"_iPhone" : @"_iPad";
    return [self initWithNibName:[nibNameOrNil stringByAppendingString:suffix] bundle:nibBundleOrNil];
}

@end
