//
//  NSBundle.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [NSBundle][0] extension cateogory collection.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSBundle_Class/Reference/Reference.html
 */

#import <Foundation/Foundation.h>

/*!
 *  @brief Returns directory path for main bundle.
 *  @return [[NSBundle mainBundle] resourcePath]
 */
FOUNDATION_EXTERN NSString *NSMainBundleResourceDirectory(void);
/*!
 *  @brief Returns file path in resource directory for main bundle.
 *  @param filename Resource file name.
 *  @return NSMainBundleResourceDirectory() result with appended filename.
 *  @warning This implementation is not suitable for localized resource.
 */
FOUNDATION_EXTERN NSString *NSMainBundleResourcePathForFile(NSString *filename);

/*!
 *  @brief NSBundle extensions
 */
@interface NSBundle (Shortcuts)

/*!
 *  @brief Returns resource file path for given filename.
 */
- (NSString *)pathForResourceFile:(NSString *)filename;

/*! @name Deprecated */

//! @deprecated Use @link pathForResourceFile: @endlink
- (NSString *)pathForResource:(NSString *)filename __deprecated;

@end
