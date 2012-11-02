//
//  NSPathUtilities.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 11. 2..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief NSPathUtilities.h extension function collection
 */

/*! @name Path utilities */

/*!
 *  @brief Returns directory path relative to user directory.
 *  @see [NSSearchPathForDirectoriesInDomains][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/cocoa/reference/foundation/miscellaneous/foundation_functions/reference/reference.html#//apple_ref/c/func/NSSearchPathForDirectoriesInDomains
 */
FOUNDATION_EXTERN NSString *NSPathForUserDirectory(NSSearchPathDirectory directory);
/*!
 *  @brief Returns file path relative to user directory.
 *  @see [NSSearchPathForDirectoriesInDomains][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/cocoa/reference/foundation/miscellaneous/foundation_functions/reference/reference.html#//apple_ref/c/func/NSSearchPathForDirectoriesInDomains
 */
FOUNDATION_EXTERN NSString *NSPathForUserFileInDirectory(NSSearchPathDirectory directory, NSString *filename);

/*!
 *  @brief Returns file path relative to home directory.
 *  @see [NSHomeDirectory][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/cocoa/reference/foundation/miscellaneous/foundation_functions/reference/reference.html#//apple_ref/c/func/NSHomeDirectory
 */
FOUNDATION_EXTERN NSString *NSPathForHomeFile(NSString *filename);
/*!
 *  @brief Returns file path relative to home directory for user.
 *  @see [NSHomeDirectoryForUser][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/cocoa/reference/foundation/miscellaneous/foundation_functions/reference/reference.html#//apple_ref/c/func/NSHomeDirectoryForUser
 */
FOUNDATION_EXTERN NSString *NSPathForHomeFileForUser(NSString *filename, NSString *userName);

/*!
 *  @brief Returns user configuration directory.
 *  @details For OS X, this returns ~/Library. For iOS, this returns ~/Documents. This is used for smart URL prefix 'conf://'
 *  @see [NSSearchPathForDirectoriesInDomains][0]
 *  @see [NSDocumentDirectory][1]
 *  @see [NSLibraryDirectory][2]
 *  @see [NSUserDomainMask][3]
 *      [0]: https://developer.apple.com/library/mac/documentation/cocoa/reference/foundation/miscellaneous/foundation_functions/reference/reference.html#//apple_ref/c/func/NSSearchPathForDirectoriesInDomains
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Miscellaneous/Foundation_Constants/Reference/reference.html#//apple_ref/doc/c_ref/NSDocumentDirectory
 *      [2]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Miscellaneous/Foundation_Constants/Reference/reference.html#//apple_ref/doc/c_ref/NSLibraryDirectory
 *      [3]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Miscellaneous/Foundation_Constants/Reference/reference.html#//apple_ref/doc/c_ref/NSUserDomainMask
 */
FOUNDATION_EXTERN NSString *NSUserConfigurationDirectory(void);
/*!
 *  @brief Returns user configuration file.
 *  @details For OS X, this returns ~/Library. For iOS, this returns ~/Documents. This is used for smart URL prefix 'conf://'
 *  @see NSUserConfigurationDirectory
 */
FOUNDATION_EXTERN NSString *NSPathForUserConfigurationFile(NSString *filename);

/*!
 *  @brief Returns file path relative to temporary directory.
 *  @details This is used for smart URL prefix 'tmp://'
 *  @see [NSTemporaryDirectory][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/cocoa/reference/foundation/miscellaneous/foundation_functions/reference/reference.html#//apple_ref/c/func/NSTemporaryDirectory
 */
FOUNDATION_EXTERN NSString *NSPathForTemporaryFile(NSString *filename);


/*!
 *  @brief Extensions of NSString(NSStringPathExtensions)
 */
@interface NSString (NSPathUtilities)

/*!
 *  @brief Returns a new string made by appending to the receiver a given string.
 *  @param format A format string.
 *  @param ... A comma-separated list of arguments to substitute into format.
 *  @see stringByAppendingPathComponent:
 */
- (NSString *)stringByAppendingPathFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1, 2);

@end
