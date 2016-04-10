//
//  FoundationExtension.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @page FoundationExtension
 *  @brief FoundationExtension is Foundation extension implementation for both OS X / iOS
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

//! Project version number for FoundationExtension.
FOUNDATION_EXPORT double FoundationExtensionVersionNumber;

//! Project version string for FoundationExtension.
FOUNDATION_EXPORT const unsigned char FoundationExtensionVersionString[];


#import <FoundationExtensionRC/FoundationExtensionRC.h>

// depenency level 0
#import <FoundationExtension/NSArray.h>                     // level: 0 / deps(0):  / internal(1): NSData
#import <FoundationExtension/NSAttributedString.h>          // level: 0 / deps(0):  / internal(0):
#import <FoundationExtension/NSBundle.h>                    // level: 0 / deps(0):  / internal(0):
#import <FoundationExtension/NSCharacterSet.h>              // level: 0 / deps(0):  / internal(0):
#import <FoundationExtension/NSData.h>                      // level: 0 / deps(0):  / internal(0):
#import <FoundationExtension/NSDate.h>                      // level: 0 / deps(0):  / internal(0):
#import <FoundationExtension/NSDictionary.h>                // level: 0 / deps(0):  / internal(1): NSData
#import <FoundationExtension/NSJSONSerialization.h>         // level: 0 / deps(0):  / internal(2): NSString, NSURLRequestCreations
#import <FoundationExtension/NSNull.h>                      // level: 0 / deps(0):  / internal(0):
#import <FoundationExtension/NSNumber.h>                    // level: 0 / deps(0):  / internal(2): NSObject, NSString
#import <FoundationExtension/NSNumberFormatter.h>           // level: 0 / deps(0):  / internal(0):
#import <FoundationExtension/NSObject.h>                    // level: 0 / deps(0):  / internal(0):
#import <FoundationExtension/NSPathUtilities.h>             // level: 0 / deps(0):  / internal(1): NSString
#import <FoundationExtension/NSSet.h>                       // level: 0 / deps(0):  / internal(1): NSArray
#import <FoundationExtension/NSString.h>                    // level: 0 / deps(0):  / internal(0):
#import <FoundationExtension/NSURL.h>                       // level: 0 / deps(0):  / internal(4): NSBundle, NSPathUtilities, NSCharacterSet, NSString
#import <FoundationExtension/NSURLRequest.h>                // level: 0 / deps(0):  / internal(3): NSString, NSData, NSURL
#import <FoundationExtension/NSURLRequestCreations.h>       // level: 0 / deps(0):  / internal(4): NSData, NSArray, NSDictionary, NSURLRequest
#import <FoundationExtension/NSValue.h>                     // level: 0 / deps(0):  / internal(0):
#import <FoundationExtension/NSTimer.h>
// depenency level 20
#import <FoundationExtension/NSAArray.h>                    // level: 20 / deps(0):  / internal(0):
#import <FoundationExtension/NSAClassDeprecated.h>          // level: 20 / deps(0):  / internal(1): NSObject
#import <FoundationExtension/NSACommonCrypto.h>             // level: 20 / deps(0):  / internal(1): NSString
#import <FoundationExtension/NSACommonDigest.h>             // level: 20 / deps(0):  / internal(0):
#import <FoundationExtension/NSADataObject.h>               // level: 20 / deps(1): NSASubscript / internal(1): NSArray
#import <FoundationExtension/NSADictionary.h>               // level: 20 / deps(0):  / internal(0):
#import <FoundationExtension/NSAEnumerator.h>               // level: 20 / deps(0):  / internal(0):
#import <FoundationExtension/NSAFunctional.h>               // level: 20 / deps(0):  / internal(0):
#import <FoundationExtension/NSAOrderedDictionary.h>        // level: 20 / deps(0):  / internal(0):
#import <FoundationExtension/NSAOverridingMediator.h>       // level: 20 / deps(0):  / internal(0):
#import <FoundationExtension/NSAString.h>                   // level: 20 / deps(0):  / internal(0):
#import <FoundationExtension/NSAVersion.h>                  // level: 20 / deps(0):  / internal(0):
