//
//  UIKitExtension.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 2..
//  Copyright (c) 2012 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief Unified header collection for [Foundation.framework][0] and [UIKit.framework][1] extensions.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/ObjC_classic/_index.html
 *      [1]: https://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIKit_Framework/_index.html
 *  @details
 *  UIKitExtension is iOS dependent extension collections. This includes FoundationExtension.
 *
 *  For concept,
 *  @see @ref FoundationExtension
 */

#import <FoundationExtension/FoundationExtension.h>

#import <UIKit/UIKit.h>
// depenency level 0
#import <UIKitExtension/NSAttributedString+UIKit.h>         // level: 0 / deps(1): NSADictionary / internal(0):
#import <UIKitExtension/UIActivityIndicatorView.h>          // level: 0 / deps(0):  / internal(0):
#import <UIKitExtension/UIAlertView.h>                      // level: 0 / deps(0):  / internal(0):
#import <UIKitExtension/UIApplication.h>                    // level: 0 / deps(0):  / internal(0):
#import <UIKitExtension/UIColor.h>                          // level: 0 / deps(0):  / internal(2): NSString, NSDictionary
#import <UIKitExtension/UIControl.h>                        // level: 0 / deps(0):  / internal(1): NSArray
#import <UIKitExtension/UIDevice.h>                         // level: 0 / deps(0):  / internal(1): NSString
#import <UIKitExtension/UIImage.h>                          // level: 0 / deps(0):  / internal(0):
#import <UIKitExtension/UIScrollView.h>                     // level: 0 / deps(0):  / internal(0):
#import <UIKitExtension/UITableView.h>                      // level: 0 / deps(0):  / internal(0):
#import <UIKitExtension/UIView.h>                           // level: 0 / deps(0):  / internal(0):
#import <UIKitExtension/UIViewController.h>                           // level: 0 / deps(0):  / internal(0):
#import <UIKitExtension/UIWebView.h>                        // level: 0 / deps(0):  / internal(0):
// depenency level 20
#import <UIKitExtension/UIASubviewTableView.h>        // level: 20 / deps(0):  / internal(2): NSString, UITableView
#import <UIKitExtension/UIAPlaceholderTextView.h>           // level: 20 / deps(0):  / internal(1): UIView
#import <UIKitExtension/UIAPreparedCellTableView.h>         // level: 20 / deps(0):  / internal(1): NSArray
#import <UIKitExtension/UIAResultDisplayController.h>       // level: 20 / deps(0):  / internal(2): NSTimer, UIView
#import <UIKitExtension/UIATableView.h>                     // level: 20 / deps(0):  / internal(0):
