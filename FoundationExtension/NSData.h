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

#import <Foundation/Foundation.h>

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
- (id)propertyListObjectUsingFormat:(NSPropertyListFormat *)format error:(NSError **)error;


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
- (id)initWithHexadecimalString:(NSString *)hexadecimal;
/*!
 *  @brief Creates and returns deserialized data from hexadecimal string.
 *  @see initWithHexadecimalString:
 */
+ (id)dataWithHexadecimalString:(NSString *)hexadecimal;


/*! @name base64 */

/*!
 *  @brief Serialized string in base64 format.
 *  @return base64 string.
 *  @see initWithBase64String:
 *  @see dataWithBase64String:
 */
- (NSString *)base64String;
/*!
 *  @brief Initialize with deserialized data from base64 string.
 *  @param base64 base64 string.
 *  @return Initialized data object.
 *  @see base64String
 */
- (id)initWithBase64String:(NSString *)base64;
/*!
 *  @brief Creates and returns deserialized data from base64 string.
 *  @return Created data object.
 *  @see initWithBase64String:
 *  @see base64String
 */
+ (id)dataWithBase64String:(NSString *)base64;

@end
