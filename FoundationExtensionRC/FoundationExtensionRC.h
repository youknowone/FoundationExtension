//
//  FoundationExtensionRC.h
//  FoundationExtensionRC
//
//  Created by Jeong YunWon on 2016. 3. 20..
//  Copyright © 2016년 youknowone.org. All rights reserved.
//


/*!
 *  @page FoundationExtensionRC
 *  @brief FoundationExtensionRC is non-ARC collections of FoundationExtension.
 *
 *  @see FoundationExtention
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

//! Project version number for FoundationExtensionRC.
FOUNDATION_EXPORT double FoundationExtensionRCVersionNumber;

//! Project version string for FoundationExtensionRC.
FOUNDATION_EXPORT const unsigned char FoundationExtensionRCVersionString[];


#import <FoundationExtensionRC/NSArrayRC.h>
#import <FoundationExtensionRC/NSObjectRC.h>
#import <FoundationExtensionRC/NSTimerRC.h>

