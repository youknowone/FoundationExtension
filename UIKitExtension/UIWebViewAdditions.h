//
//  UIWebViewAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 18..
//  Copyright 2010 youknowone.org All rights reserved.
//

@interface UIWebView (FoundationExtension)

- (void)loadRequestForURL:(NSURL *)URL;
- (void)loadRequestForFilePath:(NSString *)filePath;

@end
