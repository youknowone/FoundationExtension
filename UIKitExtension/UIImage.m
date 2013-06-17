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

- (id)initWithContentsOfURL:(NSURL *)URL {
    NSData *data = [NSData dataWithContentsOfURL:URL];
    if (data == nil) {
        [self release];
        return nil;
    }
    return [self initWithData:data];
}

+ (id)imageWithContentsOfURL:(NSURL *)URL {
    return [[[self alloc] initWithContentsOfURL:URL] autorelease];
}

- (id)initWithContentsOfURLRequest:(NSURLRequest *)request {
    NSData *data = [NSData dataWithContentsOfURLRequest:request];
    if (data == nil) {
        [self release];
        return nil;
    }
    return [self initWithData:data];
}

+ (id)imageWithContentsOfURLRequest:(NSURLRequest *)request {
    return [[[self alloc] initWithContentsOfURLRequest:request] autorelease];
}

- (id)initWithContentsOfURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy {
    NSURLRequest *request = [NSURLRequest requestWithURL:URL cachePolicy:cachePolicy timeoutInterval:60.0];
    return [self initWithContentsOfURLRequest:request];
}

+ (id)imageWithContentsOfURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy {
    return [[[self alloc] initWithContentsOfURL:URL cachePolicy:cachePolicy] autorelease];
}

@end


@implementation UIImage (UIGraphics)

- (UIImage *)imageByResizingToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(.0, .0, size.width, size.height)];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

- (UIImage *)imageByFilledWithColor:(UIColor *)color {
    UIGraphicsBeginImageContext(self.size);
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

+ (UIImage *)imageWithBezierPath:(UIBezierPath *)path color:(UIColor *)color backgroundColor:(UIColor *)backgroundColor {
    UIGraphicsBeginImageContext(path.bounds.size);
    UIGraphicsGetCurrentContext();

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

+ (UIImage *)imageWithBezierPath:(UIBezierPath *)path color:(UIColor *)color; {
    return [self imageWithBezierPath:path color:color backgroundColor:nil];
}

@end


@implementation UIImageView (Creations)

+ (id)imageView {
    return [[[self alloc] init] autorelease];
}

@end


@implementation UIBezierPath (UIImage)

- (UIImage *)imageWithStrokeColor:(UIColor *)strokeColor fillColor:(UIColor *)fillColor {
    return [UIImage imageWithBezierPath:self color:strokeColor backgroundColor:fillColor];
}

@end
