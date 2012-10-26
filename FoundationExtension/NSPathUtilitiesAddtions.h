//
//  NSPathUtilitiesAddtions.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 11. 2..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @brief Returns directory path relative to user directory.
 *  @see NSSearchPathForDirectoriesInDomains
 */
FOUNDATION_EXTERN NSString *NSPathForUserDirectory(NSSearchPathDirectory directory);
/*!
 *  @brief Returns file path relative to user directory.
 *  @see NSSearchPathForDirectoriesInDomains
 */
FOUNDATION_EXTERN NSString *NSPathForUserFileInDirectory(NSSearchPathDirectory directory, NSString *filename);

/*!
 *  @brief Returns file path relative to home directory.
 *  @see NSHomeDirectory
 */
FOUNDATION_EXTERN NSString *NSPathForHomeFile(NSString *filename);
/*!
 *  @brief Returns file path relative to home directory for user.
 *  @see NSHomeDirectoryForUser
 */
FOUNDATION_EXTERN NSString *NSPathForHomeFileForUser(NSString *filename, NSString *userName);

/*!
 *  @brief Returns user configuration directory.
 *  @details For OS X, this returns ~/Library. For iOS, this returns ~/Documents. This is used for smart URL prefix 'conf://'
 *  @see NSSearchPathForDirectoriesInDomains
 */
FOUNDATION_EXTERN NSString *NSUserConfigurationDirectory(void);
/*!
 *  @brief Returns user configuration file.
 *  @details For OS X, this returns ~/Library. For iOS, this returns ~/Documents. This is used for smart URL prefix 'conf://'
 *  @see NSSearchPathForDirectoriesInDomains
 */
FOUNDATION_EXTERN NSString *NSPathForUserConfigurationFile(NSString *filename);

/*!
 *  @brief Returns file path relative to home directory.
 *  @see NSHomeDirectory
 */
FOUNDATION_EXTERN NSString *NSPathForTempFile(NSString *filename);
/*!
 *  @brief Returns file path relative to home directory for user.
 *  @see NSHomeDirectoryForUser
 */
FOUNDATION_EXTERN NSString *NSPathForHomeFileForUser(NSString *filename, NSString *userName);

/*!
 *  @brief Returns file path relative to temporary directory.
 *  @see NSTemporaryDirectory
 */
FOUNDATION_EXTERN NSString *NSPathForTemporaryFile(NSString *filename);
