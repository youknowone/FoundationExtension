//
//  UIWebViewAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 18..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @brief UIWebView extension
 */
@interface UIWebView (FoundationExtension)

/*!
 *  @brief Creates URLRequest from given URL and call -loadRequest:
 *  @see loadRequest:
 */
- (void)loadRequestForURL:(NSURL *)URL;

//! @deprecated use NSString::fileURL
- (void)loadRequestForFilePath:(NSString *)filePath __deprecated;

@end
