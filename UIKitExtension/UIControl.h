//
//  UIControl.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 3. 11..
//  Copyright 2010 youknowone.org All rights reserved.
//

#if __has_feature(modules)
@import UIKit;
#else
#import <UIKit/UIKit.h>
#endif


@interface UIControl (Shortcuts)

- (void)sendActionsForControlEvents:(UIControlEvents)controlEvents withEvent:(UIEvent *)event;

@end
