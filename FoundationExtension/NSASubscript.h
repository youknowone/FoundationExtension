//
//  NSASubscript.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 2014. 9. 19..
//  Copyright (c) 2014년 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief Protocols to handle indexed or keyed subscript of modern Objective-C.
 *  @details
 *      These protocols are defined to make subscript interface clear.
 *      Because Foundation doesn't suggest any protocols to implement subscription, this is a kind of hidden protocol.
 */

#import <Foundation/Foundation.h>

/*!
 *  @brief The indexed subscript getter protocol @ref NSAIndexedSubscript must be adopted and implemented by immutable objects used for indexed subscript in modern Objective-C.
 */
@protocol NSAIndexedSubscript

/*!
 *  @brief Returns the object located at the specified index.
 *  @param index An index within the bounds of the container object.
 *  @return The object located at index.
 *  @details
 *      If index is beyond the end of the container (that is, if index is greater than or equal to the value of the container size), raise an NSRangeException.
 *      This method is expected to be identical to objectAtIndex:.
 */
- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end

/*!
 *  @brief The indexed subscript setter protocol @ref NSAMutableIndexedSubscript must be adopted and implemented by mutable objects used for indexed subscript in modern Objective-C.
 */
@protocol NSAMutableIndexedSubscript<NSAIndexedSubscript>

/*!
 *  @brief Replaces the object at the index with the new object, possibly adding the object.
 *  @param anObject The object with which to replace the object at index index in the container.
 *  @param index The index of the object to be replaced. This value is expected not to exceed the bounds of the container.
 *  @details If the index is equal to size of the container the element is expected to be added to the end of the container, growing the container.
 */
- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)index;

@end

/*!
 *  @brief The keyed subscript getter protocol @ref NSAKeyedSubscript must be adopted and implemented by immutable objects used for keyed subscript in modern Objective-C.
 */
@protocol NSAKeyedSubscript

/*!
 *  @brief Returns the value associated with a given key.
 *  @param key The key for which to return the corresponding value.
 *  @return The value associated with key, or nil if no value is associated with key.
 *  @details This method is expected to be identical to objectForKey:.
 */
- (id)objectForKeyedSubscript:(id)key;

@end

/*!
 *  @brief The keyed subscript setter protocol @ref NSAMutableKeyedSubscript must be adopted and implemented by mutable objects used for keyed subscript in modern Objective-C.
 */
@protocol NSAMutableKeyedSubscript<NSAKeyedSubscript>

/*!
 *  @brief Adds a given key-value pair to the container.
 *  @param object The value for key. The container should maintain a strong reference to the object. Raise an NSInvalidArgumentException if object shouldn't be a nil.
 *  @param key The key for value. The key should be copied (using copyWithZone:; keys must conform to the NSCopying protocol). Raise an NSInvalidArgumentException if key is nil. If key already exists in the container object takes its place.
 *  @details This method is expected to be identical to setObject:forKey:.
 */
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;

@end
