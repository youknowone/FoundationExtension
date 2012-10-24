//
//  NSStringAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @brief Creation method extension
 */
@interface NSString (FoundationExtensionCreations)

/*!
 *  @brief Creates and returns an NSString object initialized by using a given format string as a template into which the remaining argument values are substituted according to the user’s default locale.
 *  @see initWithFormat:arguments:
 */
+ (id)stringWithFormat:(NSString *)format arguments:(va_list)argList NS_FORMAT_FUNCTION(1,0);

/*!
 *  @brief Creates and returns an NSString object initialized by converting given data into Unicode characters using a given encoding.
 *  @see initWithData:encoding:
 */
+ (id)stringWithData:(NSData *)data encoding:(NSStringEncoding)encoding;

/*!
 *  @brief Initialize an NSString object with concatnating given arguments.
 */
- (id)initWithConcatnatingStrings:(NSString *)first, ... NS_REQUIRES_NIL_TERMINATION;

/*!
 *  @brief Creates and returns an NSString object with concatnating given arguments.
 */
+ (id)stringWithConcatnatingStrings:(NSString *)first, ... NS_REQUIRES_NIL_TERMINATION;

@end

/*!
 *  @brief NSString method shortcuts
 */
@interface NSString (FoundationExtensionShortcuts)

/*!
 *  @brief Returns a string made by using self as a format string template into which the argument values are substituted.
 *  @param first, ...
 *      A comma-separated list of arguments to substitute into format. first should be id type.
 *  @return A string created by using self as a template into which the argument values are substituted according to the canonical locale.
 *  @details This requires first argument type to be id. And implementation of this is not optimized enough so this is slow for some case. To avoid this problems, use '-format0:'.
 *  @see format0:
 *  @see stringWithFormat:
 */
- (NSString *)format:(id)first, ...;
/*!
 *  @brief Returns a string made by using self as a format string template into which the remaining argument values are substituted.
 *  @param dummyLikeNil
 *      Do nothing. Value will be ignored. This is placeholder
 *  @param ...
 *      A comma-separated list of arguments to substitute into format.
 *  @return A string created by using self as a template into which the remaining argument values are substituted according to the canonical locale.
 *  @details This ignores first argument. Pass anything.
 *  @see format:
 *  @see stringWithFormat:
 */
- (NSString *)format0:(id)dummyLikeNil, ...;

/*!
 *  @brief Returns a new string containing the characters of the receiver from the one at a given index with a given length.
 *  @param from
 *      An index. The value must lie within the bounds of the receiver, or be equal to the length of the receiver.
 *  @param length
 *      A length. The summation of this value and from index must lie within the bounds of the receiver, or be equal to the length of the receiver.
 *  @return new string containing the characters of the receiver from the one at from index with given length.
 *  @see substringWithRange:
 */
- (NSString *)substringFromIndex:(NSUInteger)from length:(NSUInteger)length;
/*!
 *  @brief Returns a new string containing the characters of the receiver from the one at a given index to the other given index.
 *  @param from
 *      An index. The value must lie within the bounds of the receiver, or be equal to the length of the receiver.
 *  @param to
*       An index. The value must lie within the bounds of the receiver, or be equal to the length of the receiver.
 *  @return new string containing the characters of the receiver from the one at from index to to index.
 *  @see substringWithRange:
 */
- (NSString *)substringFromIndex:(NSUInteger)from toIndex:(NSUInteger)to;

@end

/*!
 *  @brief Shortcut for UTF8
 */
@interface NSString (FoundationExtensionUTF8)

/*!
 *  @brief Creates and returns an NSString object initialized by converting given data into Unicode characters using UTF8 encoding.
 *  @see initWithData:encoding:
 *  @see stringWithData:encoding:
 */
+ (NSString *)stringWithUTF8Data:(NSData *)data;

/*!
 *  @brief Returns a representation of the receiver using UTF8 encoding to determine the percent escapes necessary to convert the receiver into a legal URL string.
 *  @see stringByAddingPercentEscapesUsingEncoding:
 */
- (NSString *)stringByAddingPercentEscapesUsingUTF8Encoding;
/*!
 *  @brief Returns a new string made by replacing in the receiver all percent escapes with the matching characters as determined by UTF8 encoding.
 *  @see stringByReplacingPercentEscapesUsingEncoding:
 */
- (NSString *)stringByReplacingPercentEscapesUsingUTF8Encoding;

/*!
 *  @brief Returns an NSData object containing a representation of the receiver encoded using UTF8 encoding.
 *  @see dataUsingEncoding:
 */
- (NSData *)dataUsingUTF8Encoding;

@end


/*!
 *  @brief Extensions of NSStringPathExtensions
 */
@interface NSString (FoundationExtensionPathExtensions)

/*!
 *  @brief Returns a new string made by appending to the receiver a given string.
 *  @param format
 *      A format string.
 *  @param ...
 *      A comma-separated list of arguments to substitute into format.
 *  @see stringByAppendingPathComponent:
 */
- (NSString *)stringByAppendingPathFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1, 2);

@end


/*!
 *  @brief Numeric value decoder
 */
@interface NSString (FoundationExtensionNumericValues)

/*!
 *  @brief Returns the NSInteger value of the receiver’s text by given base radix.
 *  @param radix
 *      Base radix of text reperesentation.
 *  @return The NSInteger value of the receiver’s text with given base radix.
 *  @see integerValue
 */
- (NSInteger)integerValueBase:(NSInteger)radix;
/*!
 *  @brief Returns the NSInteger value of the receiver’s text by 16 base.
 *  @return The NSInteger value of the receiver’s text with 16 base.
 *  @see integerValue
 *  @see integerValueBase:
 */
- (NSInteger)hexadecimalValue;

@end
