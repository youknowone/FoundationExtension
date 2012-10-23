//
//  UIImageAdditions.m
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>

#import "UIImageAdditions.h"

@implementation UIImage (UIKitExtension)

- (UIImage *)imageByResizingToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(.0, .0, size.width, size.height)];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

@end
