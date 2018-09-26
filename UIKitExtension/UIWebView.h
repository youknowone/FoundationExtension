//
//  UIWebView.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 18..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [UIWebView][0] extension
 *      [0]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIWebView_Class/Reference/Reference.html
 */

#if __has_feature(modules)
@import UIKit;
#else
#import <UIKit/UIKit.h>
#endif


#if !defined(TARGET_OS_IOS) || TARGET_OS_IOS

/*!
 *  @brief UIWebView extension
 */
@interface UIWebView (Shortcuts)

/*!
 *  @brief Creates URLRequest from given URL and call loadRequest:
 *  @see [loadRequest:][1]
 *      [1]: http://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWebView_Class/Reference/Reference.html#//apple_ref/occ/instm/UIWebView/loadRequest:
 */
- (void)loadRequestForURL:(NSURL *)URL;

@end

#endif
