//
//  NSData.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [NSData][0] extension category collection
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSData_Class/Reference/Reference.html
 */

#if __has_feature(modules)
@import Foundation;
#else
#import <Foundation/Foundation.h>
#endif

NS_ASSUME_NONNULL_BEGIN

/*!
 *  @brief NSData serialization/deserialization extension collection.
 */
@interface NSData (Serialization)

/*! @name Property list */

/*!
 *  @brief Deserialize property list data to object.
 *  @param format A property list format. Possible values for format are described in 'NSPropertyListFormat'.
 *  @param error If the method does not complete successfully, upon return contains an NSError object that describes the problem.
 *  @return Property list object. Usually NSArray or NSDictionary.
 *  @see [NSPropertyListSerialization propertyListWithData:options:format:error:] [0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSPropertyListSerialization_Class/Reference/Reference.html#//apple_ref/occ/clm/NSPropertyListSerialization/propertyListWithData:options:format:error:
 */
- (id)propertyListObjectUsingFormat:(NSPropertyListFormat *_Nullable)format error:(out NSError **)error;


/*! @name Hexadecimal */

/*!
 *  @brief Serialized string in hexadecimal format.
 *  @return Hexadecimal string.
 */
- (NSString *)hexadecimalString;
/*!
 *  @brief Initialize with deserialized data from hexadecimal string.
 *  @param hexadecimal Hexadecimal string.
 */
- (instancetype)initWithHexadecimalString:(NSString *)hexadecimal;
/*!
 *  @brief Creates and returns deserialized data from hexadecimal string.
 *  @see initWithHexadecimalString:
 */
+ (instancetype)dataWithHexadecimalString:(NSString *)hexadecimal;

@end

NS_ASSUME_NONNULL_END
