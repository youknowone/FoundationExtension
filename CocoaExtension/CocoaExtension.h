//
//  CocoaExtension.h
//  CocoaExtension
//
//  Created by Jeong YunWon on 12. 10. 28..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief Unified header collection for [Foundation.framework][0] and [AppKit.framework][1] - the main parts of Cocoa - extensions.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/ObjC_classic/_index.html
 *      [1]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ApplicationKit/ObjC_classic/_index.html
 *  @details
 *  CocoaExtension is OS X dependent extension collections. This includes FoundationExtension.
 *
 *  For concept,
 *  @see @ref FoundationExtension
 */

#import <Cocoa/Cocoa.h>

//! Project version number for FoundationExtension.
FOUNDATION_EXPORT double CocoaExtensionVersionNumber;

//! Project version string for FoundationExtension.
FOUNDATION_EXPORT const unsigned char CocoaExtensionVersionString[];

#import <FoundationExtension/FoundationExtension.h>

// depenency level 0
#import <CocoaExtension/NSPasteboard.h>
#import <CocoaExtension/FSEventStream.h>                    // level: 0 / deps(0):  / internal(0):
#import <CocoaExtension/NSAttributedString+Cocoa.h>         // level: 0 / deps(1): NSADictionary / internal(0):
#import <CocoaExtension/NSControl.h>                        // level: 0 / deps(0):  / internal(0):
#import <CocoaExtension/NSGeometry.h>                       // level: 0 / deps(0):  / internal(0):
#import <CocoaExtension/NSImage.h>                          // level: 0 / deps(0):  / internal(0):
#import <CocoaExtension/NSPasteboard.h>                     // level: 0 / deps(0):  / internal(0):
#import <CocoaExtension/NSTextView.h>                       // level: 0 / deps(0):  / internal(0):
#import <CocoaExtension/NSView.h>
// depenency level 20
#import <CocoaExtension/NSAImageWell.h>                     // level: 20 / deps(0):  / internal(3): NSGeometry, NSImage, NSPasteboard
#import <CocoaExtension/NSAVersion+System.h>                // level: 20 / deps(1): NSAVersion / internal(0):
