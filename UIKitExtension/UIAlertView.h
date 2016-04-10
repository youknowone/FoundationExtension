//
//  UIAlertView.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 3. 6..
//  Copyright 2010 youknowone.org All rights reserved.
//

#if DEBUG
    #define UILog(TAG, ...) { if ( TAG ) { NSString *logText = [NSString stringWithFormat:__VA_ARGS__]; if (TAG) NSLog(__VA_ARGS__); [UIAlertView showLog:logText file:__FILE__ line:__LINE__]; } }
#else
    #define UILog(TAG, ...)
#endif

#import <UIKit/UIKit.h>

#if !defined(TARGET_OS_IOS) || TARGET_OS_IOS

@interface UIAlertView (Shortcuts)

+ (instancetype)showLog:(NSString *)log file:(char *)filename line:(int)line __deprecated;

- (instancetype)initNoticeWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle __deprecated;
+ (instancetype)showNoticeWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle __deprecated;

@end

#endif
