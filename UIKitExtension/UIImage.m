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

@end
