//
//  UIControl.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 3. 11..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "UIControl.h"

@implementation UIControl (Shortcuts)

- (void)sendActionsForControlEvents:(UIControlEvents)controlEvents withEvent:(UIEvent *)event {
    NSArray *targets = self.allTargets.allObjects;
    for (NSUInteger i = 0; i < targets.count; i++) {
        NSArray *actions = [self actionsForTarget:targets[i] forControlEvent:controlEvents];
        for (NSUInteger j = 0; j < actions.count; j++) {
            SEL selector = NSSelectorFromString(actions[j]);
            id target = targets[i];
            if ([target respondsToSelector:selector]) {
                [self sendAction:selector to:target forEvent:event];
            }
        }
    }
}

@end
