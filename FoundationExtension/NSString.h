//
//  NSString.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [NSString][0] and [NSMutableString][1] extension category collection
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html
 *      [1]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSMutableString_Class/Reference/Reference.html
 */

#import <Foundation/Foundation.h>

#import <FoundationExtension/NSMacro.h>

NS_ASSUME_NONNULL_BEGIN

/*!
 *  @brief NSString creation method extension
 */
@interface NSString (Creations)

/*! @name Initilizing a String */

/*!
 *  @brief Initialize an NSString from integer value.
 *  @details Implemented with [NSString initWithFormat:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/initWithFormat:
 */
- (instancetype)initWithInteger:(NSInteger)value;

/*!
 *  @brief Initialize an NSString object with concatnating given arguments.
 *  @details Appends all arguments to first string one by one by order.
 */
- (instancetype)initWithConcatnatingStrings:(NSString *)first, ... NS_REQUIRES_NIL_TERMINATION;

/*! @name Creating a String */

/*!
 *  @brief Creates and returns an NSString from integer value.
 *  @see initWithInteger:
 */
+ (instancetype)stringWithInteger:(NSInteger)value;

/*!
 *  @brief Creates and returns an NSString object initialized by using a given format string as a template into which the remaining argument values are substituted according to the user’s default locale.
 *  @see [initWithFormat:arguments:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/initWithFormat:arguments:
 */
+ (instancetype)stringWithFormat:(NSString *)format arguments:(va_list)argList NS_FORMAT_FUNCTION(1,0);

/*!
 *  @brief Creates and returns an NSString object initialized by converting given data into Unicode characters using a given encoding.
 *  @see [initWithData:encoding:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/initWithData:encoding:
 */
+ (nullable instancetype)stringWithData:(NSData *)data encoding:(NSStringEncoding)encoding;

/*!
 *  @brief Creates and returns an NSString object with concatnating given arguments.
 */
+ (instancetype)stringWithConcatnatingStrings:(NSString *)first, ... NS_REQUIRES_NIL_TERMINATION;

@end


/*!
 *  @brief NSString method shortcuts
 */
@interface NSString (Shortcuts)

/*! @name Format */

/*!
 *  @brief Returns a string made by using self as a format string template into which the argument values are substituted.
 *  @param first, ... A comma-separated list of arguments to substitute into format. first should be id type.
 *  @return A string created by using self as a template into which the argument values are substituted according to the canonical locale.
 *  @details This requires first argument type to be id. To avoid this problems, use @link format0: @endlink.
 *  @warning Implementation of this method is not optimized enough so this is slow for some case.
 *  @see format0:
 *  @see [stringWithFormat:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/clm/NSString/stringWithFormat:
 */
- (NSString *)format:(id)first, ...;
/*!
 *  @brief Returns a string made by using self as a format string template into which the remaining argument values are substituted.
 *  @param dummyLikeNil Do nothing. Value will be ignored. This is placeholder
 *  @param ... A comma-separated list of arguments to substitute into format.
 *  @return A string created by using self as a template into which the remaining argument values are substituted according to the canonical locale.
 *  @details This ignores first argument. Pass anything.
 *  @see format:
 *  @see [stringWithFormat:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/clm/NSString/stringWithFormat:
 */
- (NSString *)format0:(nullable id)dummyLikeNil, ...;

/*! @name Range */

/*!
 *  @brief Returns range of string.
 *  @see [NSRangeFromString][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Miscellaneous/Foundation_Functions/Reference/reference.html#//apple_ref/c/func/NSRangeFromString
 */
- (NSRange)range;

/*!
 *  @brief Returns a new string containing the characters of the receiver from the one at a given index with a given length.
 *  @param from An index. The value must lie within the bounds of the receiver, or be equal to the length of the receiver.
 *  @param length A length. The summation of this value and from index must lie within the bounds of the receiver, or be equal to the length of the receiver.
 *  @return new string containing the characters of the receiver from the one at from index with given length.
 *  @see [substringWithRange:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/substringWithRange:
 */
- (NSString *)substringFromIndex:(NSUInteger)from length:(NSUInteger)length;
/*!
 *  @brief Returns a new string containing the characters of the receiver from the one at a given index to the other given index.
 *  @param from An index. The value must lie within the bounds of the receiver, or be equal to the length of the receiver.
 *  @param to An index. The value must lie within the bounds of the receiver, or be equal to the length of the receiver.
 *  @return new string containing the characters of the receiver from the one at from index to to index.
 *  @see [substringWithRange:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/substringWithRange:
 */
- (NSString *)substringFromIndex:(NSUInteger)from toIndex:(NSUInteger)to;

/*!
 *  @brief Returns a new string made by removing from both ends of the receiver characters contained in whitespace character set.
 *  @return A new string made by removing from both ends of the receiver characters contained in whitespace character set. If the receiver is composed entirely of characters from whitespace character set, the empty string is returned.
 *  @see [stringByTrimmingCharactersInSet:][0]
 *  @see [NSCharacterSet whitespaceCharacterSet][1]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/stringByTrimmingCharactersInSet:
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSCharacterSet_Class/Reference/Reference.html#//apple_ref/occ/clm/NSCharacterSet/whitespaceCharacterSet
 */
- (NSString *)stringByTrimmingWhitespaceCharacters;
/*!
 *  @brief Returns a new string made by removing from both ends of the receiver characters contained in whitespace and newline character set.
 *  @return A new string made by removing from both ends of the receiver characters contained in whitespace and newline character set. If the receiver is composed entirely of characters from whitespace and newline character set, the empty string is returned.
 *  @see [stringByTrimmingCharactersInSet:][0]
 *  @see [NSCharacterSet whitespaceAndNewlineCharacterSet][1]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/stringByTrimmingCharactersInSet:
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSCharacterSet_Class/Reference/Reference.html#//apple_ref/occ/clm/NSCharacterSet/whitespaceAndNewlineCharacterSet
 */
- (NSString *)stringByTrimmingWhitespaceAndNewlineCharacters;
/*!
 *  @brief Returns a new string made by removing from both ends of the receiver characters contained in newline character set.
 *  @return A new string made by removing from both ends of the receiver characters contained in newline character set. If the receiver is composed entirely of characters from newline character set, the empty string is returned.
 *  @see [stringByTrimmingCharactersInSet:][0]
 *  @see [NSCharacterSet newlineCharacterSet][1]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/stringByTrimmingCharactersInSet:
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSCharacterSet_Class/Reference/Reference.html#//apple_ref/occ/clm/NSCharacterSet/newlineCharacterSet
 */
- (NSString *)stringByTrimmingNewlineCharacters;

@end


/*!
 *  @brief Shortcut for UTF8
 *  @see [NSUTF8StringEncoding][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/c/econst/NSUTF8StringEncoding
 */
@interface NSString (NSUTF8StringEncoding)

/*!
 *  @brief Creates and returns an NSString object initialized by converting given data into Unicode characters using UTF8 encoding.
 *  @see @ref NSString(Creations)::stringWithData:encoding:
 */
+ (instancetype)stringWithUTF8Data:(NSData *)data;

/*!
 *  @brief Returns an NSData object containing a representation of the receiver encoded using UTF8 encoding.
 *  @see [dataUsingEncoding:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/dataUsingEncoding:
 */
- (nullable NSData *)dataUsingUTF8Encoding;

@end


/*!
 *  @brief Numeric value evaluation
 */
@interface NSString (Evaluation)

/*!
 *  @brief Returns the NSInteger value of the receiver’s text by given base radix.
 *  @param radix Base radix of text reperesentation.
 *  @return The [NSInteger][0] value of the receiver’s text with given base radix.
 *  @see [integerValue][1]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Miscellaneous/Foundation_DataTypes/Reference/reference.html#//apple_ref/doc/c_ref/NSInteger
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/integerValue
 */
- (NSInteger)integerValueBase:(NSInteger)radix;
/*!
 *  @brief Returns the NSInteger value of the receiver’s text by 16 base.
 *  @return The [NSInteger][0] value of the receiver’s text with 16 base.
 *  @see [integerValue][1]
 *  @see integerValueBase:
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Miscellaneous/Foundation_DataTypes/Reference/reference.html#//apple_ref/doc/c_ref/NSInteger
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/integerValue
 */
- (NSInteger)hexadecimalValue;

@end


@interface NSString (RegularExpression)

- (nullable NSString *)stringByReplacingRegularExpressionWithPattern:pattern withTemplate:(nonnull NSString *)templ error:(NSError * __nullable __autoreleasing *)error;

@end


/*!
 *  @brief NSData extension for NSString
 */
@interface NSData (NSStringUTF8)

/*!
 *  @brief Creates and returns an NSString object initialized by converting given data into Unicode characters using UTF8 encoding.
 *  @details For other encodings, see @ref NSString(Creations)::stringWithData:encoding:
 *  @see @ref NSString(Creations)::stringWithData:encoding:
 */
@property(nonatomic, readonly) NSString *stringUsingUTF8Encoding;

@end


@interface NSString (Deprecation)

/*!
 *  @brief Returns a Boolean value that indicates whether a given string is contained in the receiver.
 *  @param aString A string.
 *  @returns YES if aString is contained in the receiver, otherwise NO. Returns NO if aString is empty.
 *  @see [rangeOfString:][1]
 *  @deprecated [containsString:][2]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/rangeOfString:
 *      [2]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/occ/instm/NSString/containsString:
 */
- (BOOL)hasSubstring:(NSString *)aString __deprecated;

@end

NS_ASSUME_NONNULL_END
