//
//  FoundationExtension.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @page FoundationExtension
 *  @brief FoundationExtension is Foundation extension implementatino for both OS X / iOS
 *
 *  Prefix 'NS' means they are implemented as pure Foundation extension, in expected way for original framework.
 *  For example, there were property access extension for lagecy getter/setter available interface. This is now compiler supported feature.
 *
 *  Prefix 'NSA' means they are implemented as Additional functions working for Foundation, but in its own way.
 *  Apple never supports these features in this way. But they are useful.
 *
 *  @see CocoaExtension
 *  @see UIKitExtension
 *  @see FoundationExtension.h
 */

/*!
 *  @file
 *  @brief Unified header collection for [Foundation.framework][0] extension collection.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/ObjC_classic/_index.html
 *  @details
 *  NSStringEncoding is not imported in this unified header because of its verbose and rare usefulness.
 *
 *  For concept,
 *  @see @ref FoundationExtension
 */

#import <Foundation/Foundation.h>

#import <FoundationExtension/NSObject.h>
#import <FoundationExtension/NSArray.h>
#import <FoundationExtension/NSAttributedString.h>
#import <FoundationExtension/NSBundle.h>
#import <FoundationExtension/NSData.h>
#import <FoundationExtension/NSDate.h>
#import <FoundationExtension/NSDictionary.h>
#import <FoundationExtension/NSJSONSerialization.h>
#import <FoundationExtension/NSNumberFormatter.h>
#import <FoundationExtension/NSPathUtilities.h>
#import <FoundationExtension/NSString.h>
//#import <FoundationExtension/NSStringEncoding.h>
#import <FoundationExtension/NSTimer.h>
#import <FoundationExtension/NSURL.h>
#import <FoundationExtension/NSURLRequest.h>
#import <FoundationExtension/NSURLRequestCreations.h>

#import <FoundationExtension/NSAArray.h>
#import <FoundationExtension/NSADictionary.h>
#import <FoundationExtension/NSAString.h>
#import <FoundationExtension/NSAClass.h>
#import <FoundationExtension/NSADataObject.h>
#import <FoundationExtension/NSACommonDigest.h>
#import <FoundationExtension/NSAFunctional.h>
#import <FoundationExtension/NSAOrderedDictionary.h>
