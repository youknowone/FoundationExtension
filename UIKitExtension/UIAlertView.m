//
//  UIAlertView.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 3. 6..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "UIAlertView.h"

@implementation UIAlertView (Shortcuts)

+ (UIAlertView *)showLog:(NSString *)log file:(char *)filename line:(int)line {
    UIAlertView *alertView = [[self alloc] initWithTitle:[NSString stringWithFormat:@"%@:%d", @(filename), line]
                                                message:log
                                                delegate:nil
                                       cancelButtonTitle:NSLocalizedStringFromTable(@"OK", @"common", @"")
                                       otherButtonTitles:nil];
    [alertView show];
    return [alertView autorelease];
}


- (id)initNoticeWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle {
    self = [self initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    return self;
}

+ (UIAlertView *)showNoticeWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle {
    UIAlertView *alert = [[self alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    [alert show];
    return [alert autorelease];
}

@end
