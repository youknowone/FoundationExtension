//
//  UIWebViewAdditions.m
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 18..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "UIWebViewAdditions.h"

@implementation UIWebView (FoundationExtension)

- (void)loadRequestForURL:(NSURL *)URL {
	[self loadRequest:[NSURLRequest requestWithURL:URL]];
}
	 
- (void)loadRequestForFilePath:(NSString *)filePath {
	[self loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
}		 

@end
