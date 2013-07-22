//
//  UIAlertView.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 3. 6..
//  Copyright 2010 youknowone.org All rights reserved.
//

#if IC_DEBUG
#define UILog(TAG, ...) { if ( TAG ) { NSString *logText = [NSString stringWithFormat:__VA_ARGS__]; __ICLog(logText, __FILE__, __LINE__); [UIAlertView showLog:logText file:__FILE__ line:__LINE__]; } }
#else
#define UILog(TAG, ...)
#endif

#import <UIKit/UIKit.h>

@interface UIAlertView (Shortcuts)

+ (UIAlertView *)showLog:(NSString *)log file:(char *)filename line:(int)line;

- (id)initNoticeWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle;
+ (UIAlertView *)showNoticeWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle;

@end
