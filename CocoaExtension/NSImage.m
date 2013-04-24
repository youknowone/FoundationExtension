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

@end
