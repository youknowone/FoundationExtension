//
//  NSDictionary.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 11. 1. 24..
//  Copyright 2011 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [NSDictionary][0] extension cateogory collection
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSDictionary_Class/Reference/Reference.html
 */

#if __has_feature(modules)
@import Foundation;
#else
#import <Foundation/Foundation.h>
#endif

NS_ASSUME_NONNULL_BEGIN

/*!
 *  @brief NSDictionary shortcut methods extension.
 */
@interface NSDictionary (Shortcuts)

/*!
 *  @brief Returns a Boolean value that indicates whether a given object is present in the keys.
 *  @param aKey A key to test dictionary has it.
 *  @return YES if aKey is present in the dictionary, otherwise NO.
 */
- (BOOL)containsKey:(id)aKey;

/*!
 *  @brief Returns one of the keys in the dictionary, or nil if the dictionary contains no objects.
 *  @return One of the keys in the dictionary, or nil if the dictionary contains no objects. The key returned is chosen at the dictionary's convenience—the selection is not guaranteed to be random.
 */
- (nullable id)anyKey;

/*!
 *  @brief Returns one of the objects in the dictionary, or nil if the dictionary contains no objects.
 *  @return One of the objects in the dictionary, or nil if the dictionary contains no objects. The object returned is chosen at the dictionary's convenience—the selection is not guaranteed to be random.
 */
- (nullable id)anyObject;

@end

/*!
 *  @brief NSDictionary creation methods extension with [NSData][1].
 *      [1]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSData_Class/Reference/Reference.html
 *  @details Data must be property list.
 */
@interface NSDictionary (NSData)

/*! @name Initializing a Dictionary */

/*!
 *  @brief Initializes a newly allocated dictionary with the contents of data. Data must be property list.
 *  @param data An NSData object containing bytes of plist file representation.
 *  @return A dictionary initialized to contain the contents in data. Returns nil if the contents of the request can’t be parsed into a dictionary. The returned object might be different than the original receiver.
 *  @see initWithData:format:error:
 *  @see dictionaryWithData:
 */
- (instancetype)initWithData:(NSData *)data;

/*!
 *  @brief Initializes a newly allocated dictionary with the contents of data. Data must be property list.
 *  @param data An NSData object containing bytes of plist file representation.
 *  @param format A property list format. Possible values for format are described in [NSPropertyListFormat][1].
 *  @param error If the method does not complete successfully, upon return contains an NSError object that describes the problem.
 *  @return A dictionary initialized to contain the contents in data. Returns nil if the contents of the request can’t be parsed into a dictionary. The returned object might be different than the original receiver.
 *  @see initWithData:
 *  @see dictionaryWithData:format:error:
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSPropertyListSerialization_Class/Reference/Reference.html#//apple_ref/c/tdef/NSPropertyListFormat
 */
- (instancetype)initWithData:(NSData *)data format:(NSPropertyListFormat *_Nullable)format error:(out NSError **)error;

/*! @name Creating a Dictionary */

/*!
 *  @brief Creates and returns a dictionary containing the contents of data. Data must be property list.
 *  @see initWithData:
 */
+ (instancetype)dictionaryWithData:(NSData *)data;

/*!
 *  @brief Creates and returns a dictionary containing the contents of data. Data must be property list.
 *  @see initWithData:format:error:
 */
+ (instancetype)dictionaryWithData:(NSData *)data format:(NSPropertyListFormat *_Nullable)format error:(out NSError **)error;

@end

NS_ASSUME_NONNULL_END
