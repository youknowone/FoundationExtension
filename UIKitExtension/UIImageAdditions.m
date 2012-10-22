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
    CGRect thumbRect = CGRectZero;
    thumbRect.size = size;
    CGImageRef imageRef = [self CGImage];

    CGContextRef bitmap = CGBitmapContextCreate(
                                                NULL,
                                                (size_t)thumbRect.size.width,        // width
                                                (size_t)thumbRect.size.height,        // height
                                                CGImageGetBitsPerComponent(imageRef),
                                                CGImageGetBytesPerRow(imageRef),    // rowbytes
                                                CGImageGetColorSpace(imageRef),
                                                CGImageGetBitmapInfo(imageRef)
                                                );

    CGContextDrawImage(bitmap, thumbRect, imageRef);

    CGImageRef    ref = CGBitmapContextCreateImage(bitmap);
    UIImage *result = [UIImage imageWithCGImage:ref];

    CGContextRelease(bitmap);    // ok if NULL
    CGImageRelease(ref);

    return result;
}

@end
