//
//  NSImage.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 23..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <cdebug/debug.h>

#import "NSImage.h"

@implementation NSImage (Shortcuts)

+ (id)imageWithContentsOfURL:(NSURL *)url {
    return [[[self alloc] initWithContentsOfURL:url] autorelease];
}

+ (id)imageByReferencingURL:(NSURL *)url {
    return [[[self alloc] initByReferencingURL:url] autorelease];
}

+ (id)imageWithPasteboard:(NSPasteboard *)pasteboard {
    return [[[self alloc] initWithPasteboard:pasteboard] autorelease];
}

- (NSData *)dataRepresentationUsingType:(NSBitmapImageFileType)fileType properties:(NSDictionary *)properties {
    NSBitmapImageRep *imageRep = (NSBitmapImageRep *)([NSBitmapImageRep imageRepsWithData:self.TIFFRepresentation][0]);
    NSData *pngData = [imageRep representationUsingType:fileType properties:properties];
    return pngData;
}

- (NSData *)PNGRepresentation {
    return [self dataRepresentationUsingType:NSPNGFileType properties:@{}];
}

- (NSData *)JPEGRepresentationWithCompressionFactor:(CGFloat)compressionFactor {
    return [self dataRepresentationUsingType:NSJPEGFileType properties:@{NSImageCompressionFactor: @(compressionFactor)}];
}

- (NSData *)JPEGRepresentation {
    return [self JPEGRepresentationWithCompressionFactor:1.0];
}

@end


NSRect _NSRectWithSize(NSSize size);

@implementation NSImage (NSDrawNinePartImage)

NSRect _NSRectWithSize(NSSize size) {
    NSRect rect = NSZeroRect;
    rect.size = size;
    return rect;
}

- (NSImage *)_partImageWithSize:(NSSize)size fromRect:(NSRect)fromRect {
    if (size.width == 0.0f || size.height == 0.0f) {
        return [[NSImage alloc] initWithSize:NSZeroSize];
    }
    NSImage *part = [[NSImage alloc] initWithSize:size];
    [part lockFocus];
    [self drawInRect:_NSRectWithSize(part.size) fromRect:fromRect operation:NSCompositeCopy fraction:1.0f];
    [part unlockFocus];
    return part;
}

- (void)drawNinePartImageInRect:(NSRect)toRect capInsets:(NSEdgeInsets)capInsets {
    //   1 2 3
    //    A
    //   4 5 6
    //      B
    //   7 8 9
    // assert(toRect.size.width >= capInsets.left + capInsets.right);
    // assert(toRect.size.height >= capInsets.top + capInsets.bottom);
    NSSize fromSize = self.size;

    NSSize capInsetsMargin = NSMakeSize(capInsets.left + capInsets.right, capInsets.top + capInsets.bottom);

    NSSize fromCenterSize = NSMakeSize(fromSize.width - capInsetsMargin.width, fromSize.height - capInsetsMargin.height);
    NSSize toCenterSize = NSMakeSize(toRect.size.width - capInsetsMargin.width, toRect.size.height - capInsetsMargin.height);

    NSImage *part1, *part2, *part3, *part4, *part5, *part6, *part7, *part8, *part9;
    {
        NSSize partSize = NSMakeSize(capInsets.left, capInsets.top);
        NSRect fromRect = NSMakeRect(0.0f, fromSize.height - capInsets.top, capInsets.left, capInsets.top);
        part1 = [self _partImageWithSize:partSize fromRect:fromRect];
    }
    {
        NSSize partSize = NSMakeSize(toCenterSize.width, capInsets.top);
        NSRect fromRect = NSMakeRect(capInsets.left, fromSize.height - capInsets.top, fromCenterSize.width, capInsets.top);
        part2 = [self _partImageWithSize:partSize fromRect:fromRect];
    }
    {
        NSSize partSize = NSMakeSize(capInsets.right, capInsets.top);
        NSRect fromRect = NSMakeRect(capInsets.left + fromCenterSize.width, fromSize.height - capInsets.top, capInsets.right, capInsets.top);
        part3 = [self _partImageWithSize:partSize fromRect:fromRect];
    }
    {
        NSSize partSize = NSMakeSize(capInsets.left, toCenterSize.height);
        NSRect fromRect = NSMakeRect(0.0f, capInsets.bottom, capInsets.left, fromCenterSize.height);
        part4 = [self _partImageWithSize:partSize fromRect:fromRect];
    }
    {
        NSSize partSize = toCenterSize;
        NSRect fromRect = NSMakeRect(capInsets.left, capInsets.bottom, fromCenterSize.width, fromCenterSize.height);
        part5 = [self _partImageWithSize:partSize fromRect:fromRect];
    }
    {
        NSSize partSize = NSMakeSize(capInsets.right, toCenterSize.height);
        NSRect fromRect = NSMakeRect(capInsets.left + fromCenterSize.width, capInsets.bottom, capInsets.right, fromCenterSize.height);
        part6 = [self _partImageWithSize:partSize fromRect:fromRect];
    }
    {
        NSSize partSize = NSMakeSize(capInsets.left , capInsets.bottom);
        NSRect fromRect = NSMakeRect(0.0f, 0.0f, capInsets.left, capInsets.bottom);
        part7 = [self _partImageWithSize:partSize fromRect:fromRect];
    }
    {
        NSSize partSize = NSMakeSize(toCenterSize.width, capInsets.bottom);
        NSRect fromRect = NSMakeRect(capInsets.left, 0.0f, fromCenterSize.width, capInsets.bottom);
        part8 = [self _partImageWithSize:partSize fromRect:fromRect];
    }
    {
        NSSize partSize = NSMakeSize(capInsets.right, capInsets.bottom);
        NSRect fromRect = NSMakeRect(capInsets.left + fromCenterSize.width, 0.0f, capInsets.right, capInsets.bottom);
        part9 = [self _partImageWithSize:partSize fromRect:fromRect];
    }

    dassert(part1 && part2 && part3 && part4 && part5 && part6 && part7 && part8 && part9);

    NSDrawNinePartImage(toRect, part1, part2, part3, part4, part5, part6, part7, part8, part9, NSCompositeSourceOver, 1.0, NO);
}

- (NSImage *)ninePartImageWithSize:(NSSize)size capInsets:(NSEdgeInsets)capInsets {
    NSImage *image = [[NSImage alloc] initWithSize:size];
    [image lockFocus];
    [self drawNinePartImageInRect:_NSRectWithSize(size) capInsets:capInsets];
    [image unlockFocus];
    return image;
}

@end


@implementation CAANinePartImageLayer

@synthesize image, capInsets;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.capInsets = NSEdgeInsetsZero;
    }
    return self;
}

+ (instancetype)layer {
    return [[[self alloc] init] autorelease];
}

- (instancetype)initWithImage:(NSImage *)_image capInsets:(NSEdgeInsets)_capInsets {
    self = [self init];
    if (self) {
        self.capInsets = _capInsets;
        self.image = _image;
    }
    return self;
}

+ (instancetype)layerWithImage:(NSImage *)image capInsets:(NSEdgeInsets)capInsets {
    return [[[self alloc] initWithImage:image capInsets:capInsets] autorelease];
}

- (void)display {
    [super display];
    [self.image drawNinePartImageInRect:self.bounds capInsets:self.capInsets];
}

@end
