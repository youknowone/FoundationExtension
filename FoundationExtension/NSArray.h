//
//  NSArray.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 11. 1. 25..
//  Copyright 2011 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [NSArray][0] and [NSMutableArray][1] extension cateogry collections.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSArray_Class/NSArray.html
 *      [1]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSMutableArray_Class/Reference/Reference.html
 */

#import <Foundation/Foundation.h>

/*!
 *  @brief NSArray shortcut methods extension.
 */
@interface NSArray (Shortcuts)

/*!
 *  @brief index < self.count
 */
- (BOOL)hasIndex:(NSUInteger)index;

@end

/*!
 *  @brief NSArray creation methods extension with [NSData][1] or [NSFastEnumeration][2]
 *      [1]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSData_Class/Reference/Reference.html
 *      [2]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/NSFastEnumeration_protocol/Reference/NSFastEnumeration.html#//apple_ref/doc/uid/TP40004559
 *  @details Data must be property list.
 */
@interface NSArray (Creations)

/*! @name Initializing an Array */

/*!
 *  @brief Initializes a newly allocated array with the contents of data. Data must be property list.
 *  @param data An NSData object containing bytes of plist file representation.
 *  @return An array initialized to contain the contents in data. Returns nil if the contents of the request can’t be parsed into an array. The returned object might be different than the original receiver.
 *  @see initWithData:format:error:
 *  @see arrayWithData:format:error:
 */
- (instancetype)initWithData:(NSData *)data;

/*!
 *  @brief Initializes a newly allocated array with the contents of data. Data must be property list.
 *  @param data An NSData object containing bytes of plist file representation.
 *  @param format A property list format. Possible values for format are described in [NSPropertyListFormat][1].
 *  @param error If the method does not complete successfully, upon return contains an NSError object that describes the problem.
 *  @return An array initialized to contain the contents in data. Returns nil if the contents of the request can’t be parsed into an array. The returned object might be different than the original receiver.
 *  @see initWithData:
 *  @see arrayWithData:
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSPropertyListSerialization_Class/Reference/Reference.html#//apple_ref/c/tdef/NSPropertyListFormat
 */
- (instancetype)initWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error;

/*!
 *  @brief Initializes a newly allocated array by placing in it the objects enumerated in a given enumerator.
 *  @details This initilizer is not optimized.
 *  @param enumerator An object with NSFastEnumeration implementation
 *  @return An array initialized to contain the objects — or if flag is YES, copies of the objects - enumerated in a given enumerator.
 *  @see initWithEnumerator:copyItems:
 */
- (instancetype)initWithEnumerator:(id<NSFastEnumeration>)enumerator;
/*!
 *  @brief Initializes a newly allocated array by placing in it the objects enumerated in a given enumerator.
 *  @warning This initilizer is not optimized.
 *  @param enumerator An object with NSFastEnumeration implementation
 *  @param flag If YES, each object in array receives a [copyWithZone:][0] message to create a copy of the object—objects must conform to the [NSCopying][1] protocol. In a managed memory environment, this is instead of the retain message the object would otherwise receive. The object copy is then added to the returned array.
 *   If NO, then in a managed memory environment each object in array simply receives a retain message when it is added to the returned array.
 *  @return An array initialized to contain the objects — or if flag is YES, copies of the objects - enumerated in a given enumerator.
 *  @see initWithEnumerator:
 *  @see arrayWithEnumerator:
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Protocols/NSCopying_Protocol/Reference/Reference.html#//apple_ref/occ/intfm/NSCopying/copyWithZone:
 *      [1]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Protocols/NSCopying_Protocol/Reference/Reference.html
 */
- (instancetype)initWithEnumerator:(id<NSFastEnumeration>)enumerator copyItems:(BOOL)flag;

/*! @name Creating an Array */

/*!
 *  @brief Creates and returns an array containing the contents of data. Data must be property list.
 *  @see initWithData:
 */
+ (instancetype)arrayWithData:(NSData *)data;

/*!
 *  @brief Creates and returns an array containing the contents of data. Data must be property list.
 *  @see initWithData:format:error:
 */
+ (instancetype)arrayWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error;

/*!
 *  @brief Creates and returns an array containing the objects enumerated in a given enumerator.
 *  @see initWithEnumerator:
 */
+ (instancetype)arrayWithEnumerator:(id<NSFastEnumeration>)enumerator;

/*!
 *  @brief Returns a new array containing the receiving array’s elements from the one at a given index to the end.
 *  @param index An index. The value must lie within the bounds of the receiver, or be equal to the length of the receiver.
 *  @return A new array containing the elements of the receiver from the one at index to the end. If index is equal to the length of the array, returns an empty array.
 *  @details Raises an NSRangeException if (index - 1) lies beyond the end of the receiver.
 */
- (NSArray *)subarrayFromIndex:(NSUInteger)index;

/*!
 *  @brief Returns a new array containing the receiving array’s elements of the receiver up to, but not including, the one at a given index.
 *  @param index An index. The value must lie within the bounds of the receiver, or be equal to the length of the receiver.
 *  @return A new array containing the receiving array’s elements of the receiver up to, but not including, the one at anIndex. If anIndex is equal to the length of the array, returns a copy of the receiver.
 *  @details Raises an NSRangeException if (anIndex - 1) lies beyond the end of the receiver.
 */
- (NSArray *)subarrayToIndex:(NSUInteger)index;

/*!
 *  @brief Returns a new array containing the receiving array’s elements of the receiver from the one at a given index to up to, but not including, the one at a given index.
 *  @param fromIndex An index. The value must lie within the bounds of the receiver, or be equal to the length of the receiver.
 *  @param toIndex An index. The value must lie within the bounds of the receiver, or be equal to the length of the receiver.
 *  @return A new array containing the receiving array’s elements of the receiver from the one at fromIndex to up to, but not including, the one at toIndex.
 *  @details Raises an NSRangeException if (toIndex - 1) lies beyond the end of the receiver.
 */
- (NSArray *)subarrayFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

/*!
 *  @brief Returns a new array containing the receiving array’s elements that fall within the limits specified by a given range made by fromIndex and length.
 *  @param fromIndex An index. The value must lie within the bounds of the receiver, or be equal to the length of the receiver.
 *  @param length A length. The summation of the value and fromIndex must lie within the bounds of the receiver, or be equal to the length of the receiver.
 *  @return A new array containing the receiving array’s elements that fall within the limits specified by range made by fromIndex and length.
 */
- (NSArray *)subarrayFromIndex:(NSUInteger)fromIndex length:(NSUInteger)length;

@end


/*!
 *  @brief NSArray rearrangement methods extension.
 */
@interface NSArray (Rearrange)

/*!
 *  @brief Moves the object in the array at given index to another index.
 *  @param fromIndex The index of the object with which to moves.
 *  @param toIndex The index of the object wants moves to.
 */
- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end


/*!
 *  @brief NSArray shortcut methods for [NSNumber][1].
 *      [1]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSNumber_Class/Reference/Reference.html
 */
@interface NSArray (NSNumber)

/*!
 *  @brief Returns the integer located at index.
 *  @param index An index within the bounds of the array.
 *  @result The integer decoded from NSNumber object located at index.
 *  @see [objectAtIndex:][0]
 *  @see [NSNumber integerValue][1]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSArray_Class/NSArray.html#//apple_ref/occ/instm/NSArray/objectAtIndex:
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSNumber_Class/Reference/Reference.html#//apple_ref/occ/instm/NSNumber/integerValue
 */
- (NSInteger)integerAtIndex:(NSUInteger)index;

/*!
 *  @brief Returns the lowest index whose corresponding array value is equal to a given integer.
 *  @param value A value.
 *  @result The lowest index whose corresponding array value is equal to value. If none of the objects in the array is equal to NSNumber with value, returns [NSNotFound][NSNotFound].
 *  @see [indexOfObject:][0]
 *  @see [NSNumber numberWithInteger:][1]
 *      [NSNotFound]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Miscellaneous/Foundation_Constants/Reference/reference.html#//apple_ref/doc/c_ref/NSNotFound
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSArray_Class/NSArray.html#//apple_ref/occ/instm/NSArray/indexOfObject:
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSNumber_Class/Reference/Reference.html#//apple_ref/occ/clm/NSNumber/numberWithInteger:
 */
- (NSUInteger)indexOfInteger:(NSInteger)value;

@end

/*!
 *  @brief Random selection in NSArray objects.
 */
@interface NSArray (Random)

/*!
 *  @brief Returns one of the objects in the array, or nil if the array contains no objects.
 *  @return One of the objects in the array, or nil if the array contains no objects.
 */
- (id)randomObject;

/*!
 *  @brief Returns an array of random objects of given number in the array without duplication.
 *  @param count A number of items to select.
 *  @return An array of random objects of given number in the array without duplication. If given count is bigger than the size of receiver array, it returns a shuffled array of the array.
 */
- (NSArray *)randomObjectsOfCount:(NSUInteger)count;

/*!
 *  @brief Returns a new shuffled array from the array;
 */
- (NSArray *)shuffledArray;

@end

/*!
 *  @brief Random selection in NSMutableArray objects.
 */
@interface NSMutableArray (Random)

/*!
 *  @brief Removes a random object in the array
 */
- (id)removeRandomObject;

/*!
 *  @brief Shuffle
 */
- (void)shuffle;

@end


/*!
 *  @brief Deprecated methods of NSArray extensions.
 */
@interface NSArray (Deprecated)

/*!
 *  @brief Extreme short form of 'ObjectAtIndex:'
 *  @deprecated Use (array)[index] syntax of Modern Objective-C instead of this method.
 */
- (id):(NSUInteger)index __deprecated;

@end

/*!
 *  @brief Deprecated methods of NSMutableArray extensions.
 */
@interface NSMutableArray (Deprecated)

/*!
 *  @brief Pop random object from NSArray.
 *  @deprecated Use @ref removeRandomObject
 */
- (id)popRandomObject __deprecated;

@end
