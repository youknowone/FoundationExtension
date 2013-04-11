//
//  NSADataObject.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 3. 30..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief Object containers to handle various concept of data structure.
 *  @details
 *      These classes are designed to pass 2 or 3 objects in compact form, not a verbose NSArray or NSDictionary form.
 *      In these day, there are @[] as short array expression and -: as shotcut of -objectAtIndex:.
 *      These classes may be not very useful. Consider to use above short expressions.
 */


/*!
 *  @brief This protocol defines NSArray-like interface methods for data objects.
 */
@protocol NSAArrayLikeDataObject <NSObject>

/*!
 *  @brief Returns the number of objects currently in the data object.
 */
@property(nonatomic, readonly) NSUInteger count;

/*!
 *  @brief Returns the object located at index.
 *  @param index
 *      An index within the bounds of data object.
 *  @return The object located at index.
 */
- (id)objectAtIndex:(NSUInteger)index;

/*!
 *  @brief Returns the object located at index. Shortcut of @ref objectAtIndex:
 *  @param index
 *      An index within the bounds of data object.
 *  @return The object located at index.
 */
- (id):(NSUInteger)index;

/*!
 *  @brief Returns the lowest index whose corresponding member value is equal to a given object.
 *  @param anObject
        An object.
 *  @return The lowest index whose corresponding member value is equal to anObject. If none of the objects in the data object is equal to anObject, returns NSNotFound.
 */
- (NSUInteger)indexOfObject:(id)anObject;

/*!
 *  @brief Returns a Boolean value that indicates whether a given object is present in the array.
 *  @param anObject
 *      An object.
 *  @return YES if anObject is present in the array, otherwise NO.
 */
- (BOOL)containsObject:(id)anObject;

@end


/*!
 *  @brief Manages ordered collections of 2 objects.
 */
@interface NSATuple: NSObject<NSCopying, NSMutableCopying, NSFastEnumeration, NSAArrayLikeDataObject> {
    id _first, _second;
}
/*!
 *  @brief first object
 */
@property(nonatomic, readonly) id first;
/*!
 *  @brief second object
 */
@property(nonatomic, readonly) id second;

/*!
 *  @brief Creates and returns an empty tuple.
 *  @return An empty tuple.
 */
+ (id)tuple;

/*!
 *  @brief Initilize a tuple containing first as first object and second as second object.
 *  @param first
 *      Value for first
 *  @param second
 *      Value for second
 *  @return A tuple with first and second value.
 */
- (id)initWithFirst:(id)first second:(id)second;
/*!
 *  @brief Creates and returns a tuple containing first as first object and second as second object.
 *  @see initWithFirst:second:
 */
+ (id)tupleWithFirst:(id)first second:(id)second;

@end


/*!
 *  @brief Manages ordered collections of 2 objects.
 */
@interface NSAMutableTuple: NSATuple

/*!
 *  @brief first object
 */
@property(nonatomic, retain) id first;
/*!
 *  @brief second object
 */
@property(nonatomic, retain) id second;

/*!
 *  @brief Swap first and second.
 */
- (void)swap;

@end


/*!
 *  @brief Manages ordered collections of 3 objects.
 */
@interface NSATriple: NSObject<NSCopying, NSMutableCopying, NSFastEnumeration, NSAArrayLikeDataObject> {
    id _first, _second, _third;
}
/*!
 *  @brief first object
 */
@property(nonatomic, readonly) id first;
/*!
 *  @brief second object
 */
@property(nonatomic, readonly) id second;
/*!
 *  @brief third object
 */
@property(nonatomic, readonly) id third;

/*!
 *  @brief Creates and returns an empty triple.
 *  @return An empty triple.
 */
+ (id)triple;

/*!
 *  @brief Initilize a triple containing first as first object, second as second object and third as third object.
 *  @param first
 *      Value for first
 *  @param second
 *      Value for second
 *  @param third
 *      Value for third
 *  @return A tuple with first, second and third value.
 */
- (id)initWithFirst:(id)first second:(id)second third:(id)third;
/*!
 *  @brief Creates and returns a triple containing first as first object, second as second object and third as third object.
 *  @see initWithFirst:second:third:
 */
+ (id)tripleWithFirst:(id)first second:(id)second third:(id)third;

@end


/*!
 *  @brief Manages ordered collections of 3 objects.
 */
@interface NSAMutableTriple: NSATriple

/*!
 *  @brief first object
 */
@property(nonatomic, retain) id first;
/*!
 *  @brief second object
 */
@property(nonatomic, retain) id second;
/*!
 *  @brief third object
 */
@property(nonatomic, retain) id third;

@end
