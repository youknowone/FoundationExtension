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
 *  @brief Extreme short form of 'ObjectAtIndex:'
 *  @deprecated Use (array)[index] syntax instead of this.
 */
- (id):(NSUInteger)index __deprecated;

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
- (id)initWithData:(NSData *)data;

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
- (id)initWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error;

/*!
 *  @brief Initializes a newly allocated array by placing in it the objects enumerated in a given enumerator.
 *  @details This initilizer is not optimized.
 *  @param enumerator An object with NSFastEnumeration implementation
 *  @return An array initialized to contain the objects — or if flag is YES, copies of the objects - enumerated in a given enumerator.
 *  @see initWithEnumerator:copyItems:
 */
- (id)initWithEnumerator:(id<NSFastEnumeration>)enumerator;
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
- (id)initWithEnumerator:(id<NSFastEnumeration>)enumerator copyItems:(BOOL)flag;

/*! @name Creating an Array */

/*!
 *  @brief Creates and returns an array containing the contents of data. Data must be property list.
 *  @see initWithData:
 */
+ (id)arrayWithData:(NSData *)data;

/*!
 *  @brief Creates and returns an array containing the contents of data. Data must be property list.
 *  @see initWithData:format:error:
 */
+ (id)arrayWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error;

/*!
 *  @brief Creates and returns an array containing the objects enumerated in a given enumerator.
 *  @see initWithEnumerator:
 */
+ (id)arrayWithEnumerator:(id<NSFastEnumeration>)enumerator;

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
 *  @brief Select random object from NSArray.
 */
- (id)randomObject;

/*!
 *  @brief Select the given count number of random objects form NSArray.
 *  @param count The number of items to select.
 */
- (NSArray *)randomObjectsOfCount:(NSUInteger)count;

@end
