//
//  UIImage.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSURLRequestCreations.h"
#import "UIImage.h"

@implementation UIImage (Creations)

- (instancetype)initWithContentsOfURL:(NSURL *)URL {
    NSData *data = [NSData dataWithContentsOfURL:URL];
    if (data == nil) {
        return nil;
    }
    return [self initWithData:data];
}

+ (instancetype)imageWithContentsOfURL:(NSURL *)URL {
    return [[self alloc] initWithContentsOfURL:URL];
}

- (instancetype)initWithContentsOfURLRequest:(NSURLRequest *)request {
    NSData *data = [NSData dataWithContentsOfURLRequest:request];
    if (data == nil) {
        return nil;
    }
    return [self initWithData:data];
}

+ (instancetype)imageWithContentsOfURLRequest:(NSURLRequest *)request {
    return [[self alloc] initWithContentsOfURLRequest:request];
}

- (instancetype)initWithContentsOfURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy {
    NSURLRequest *request = [NSURLRequest requestWithURL:URL cachePolicy:cachePolicy timeoutInterval:60.0];
    return [self initWithContentsOfURLRequest:request];
}

+ (instancetype)imageWithContentsOfURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy {
    return [[self alloc] initWithContentsOfURL:URL cachePolicy:cachePolicy];
}

@end


@implementation UIImage (UIGraphics)

- (UIImage *)imageByResizingToSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, .0);
    [self drawInRect:CGRectMake(.0, .0, size.width, size.height)];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

- (UIImage *)imageByCroppedToRect:(CGRect)rect {
    CGFloat scale = self.scale;
    CGRect scaledRect = rect;
    scaledRect.origin.x *= scale;
    scaledRect.origin.y *= scale;
    scaledRect.size.width *= scale;
    scaledRect.size.height *= scale;
    CGImageRef ref = CGImageCreateWithImageInRect(self.CGImage, scaledRect);
    UIImage *image = [UIImage imageWithCGImage:ref scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(ref);
    return image;
}

- (UIImage *)imageByFilledWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, .0);
    [color set];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect bounds = CGRectZero;
    bounds.size = self.size;
    CGContextTranslateCTM(context, 0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextClipToMask(context, bounds, self.CGImage);
    CGContextFillRect(context, bounds);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, .0);
    CGContextRef context = UIGraphicsGetCurrentContext();

    [color set];
    CGContextFillRect(context, CGRectMake(.0, .0, size.width, size.height));

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)clearImage {
    static UIImage *image = nil;
    if (image == nil) {
        image = [UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(1.0, 1.0)];
    }
    return image;
}

+ (UIImage *)imageWithBezierPath:(UIBezierPath *)path color:(UIColor *)color backgroundColor:(UIColor *)backgroundColor {
    UIGraphicsBeginImageContextWithOptions((CGSizeMake(path.bounds.origin.x * 2 + path.bounds.size.width, path.bounds.origin.y * 2 + path.bounds.size.height)), NO, .0);

    if (backgroundColor) {
        [backgroundColor set];
        [path fill];
    }
    if (color) {
        [color set];
        [path stroke];
    }

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end


@implementation UIColor (UIImage)

- (UIImage *)imageOfSize:(CGSize)size {
    return [UIImage imageWithColor:self size:size];
}

- (UIImage *)image {
    return [self imageOfSize:CGSizeMake(1.0, 1.0)];
}

@end


@implementation UIBezierPath (UIImage)

- (UIImage *)imageWithStrokeColor:(UIColor *)strokeColor fillColor:(UIColor *)fillColor {
    return [UIImage imageWithBezierPath:self color:strokeColor backgroundColor:fillColor];
}

- (UIImage *)imageWithStrokeColor:(UIColor *)strokeColor {
    return [self imageWithStrokeColor:strokeColor fillColor:nil];
}

- (UIImage *)imageWithFillColor:(UIColor *)fillColor {
    return [self imageWithStrokeColor:nil fillColor:fillColor];
}

@end
