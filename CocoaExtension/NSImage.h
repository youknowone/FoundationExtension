//
//  NSImage.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 23..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

@interface NSImage (Shortcuts)

+ (id)imageWithContentsOfURL:(NSURL *)url;
+ (id)imageByReferencingURL:(NSURL *)url;
+ (id)imageWithPasteboard:(NSPasteboard *)pasteboard;

@end
