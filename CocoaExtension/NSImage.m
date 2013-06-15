//
//  NSImage.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 23..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

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

- (NSData *)dataRepresentationUsingType:(NSBitmapImageFileType)fileType  properties:(NSDictionary *)properties {
    NSBitmapImageRep *imageRep = [NSBitmapImageRep imageRepsWithData:self.TIFFRepresentation][0];
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
