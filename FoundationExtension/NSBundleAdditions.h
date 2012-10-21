//
//  NSBundleAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @header NSBundleAdditions.h NSBundle extension
 */

/*!
 *  @brief Returns directory path for main bundle.
 */
FOUNDATION_EXTERN NSString *NSMainBundleResourceDirectory(void);
/*!
 *  @brief Returns file path in resource directory for main bundle.
 */
FOUNDATION_EXTERN NSString *NSMainBundleResourcePathForFile(NSString *filename);

/*!
 *  @brief NSBundle extensions
 */
@interface NSBundle (FoundationExtension)

/*!
 *  @brief Returns resource file path for given filename.
 */
- (NSString *)pathForResourceFile:(NSString *)filename;

// deprecated by renaming
- (NSString *)pathForResource:(NSString *)filename __deprecated;

@end
