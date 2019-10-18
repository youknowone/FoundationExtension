//
//  UIApplication.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 3. 27..
//  Copyright 2010 youknowone.org All rights reserved.
//

@import FoundationExtension;
#import "UIApplication.h"


#if !defined(TARGET_OS_IOS) || TARGET_OS_IOS

@implementation UIApplication (PrivatePatch)

- (CGRect)__statusBarFrameForOrientation:(UIInterfaceOrientation)orientation {
    assert(NO);
    return CGRectZero;
}

@end


@implementation UIApplication (Shortcuts)

- (CGRect)statusBarFrameForCurrentOrientation {
    Class class = [UIApplication class];
    NSString *selectorName = [@"statusBarFrame" stringByAppendingString:@"ForOrientation:"];
    [class methodObjectForSelector:@selector(__statusBarFrameForOrientation:)].implementation = [class methodObjectForSelector:NSSelectorFromString(selectorName)].implementation;
    return [self __statusBarFrameForOrientation:self.statusBarOrientation];
}

@end

#endif
