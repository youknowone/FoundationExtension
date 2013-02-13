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
 */

/*!
 *  @brief Manages ordered collections of 2 objects.
 */
@interface NSATuple: NSObject<NSCopying, NSMutableCopying, NSFastEnumeration> {
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

/*!
 *  @brief Returns the object located at index.
 *  @param index
 *      0 or 1 to points first or second.
 *  @return first for index 0 or second for index 1
 */
- (id)objectAtIndex:(NSUInteger)index;

@end


/*!
 *  @brief Manages ordered collections of 2 objects.
 */
@interface NSAMutableTuple: NSATuple<NSFastEnumeration>

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
@interface NSATriple: NSObject<NSCopying, NSFastEnumeration> {
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

/*!
 *  @brief Returns the object located at index.
 *  @param index
 *      0, 1 or 2 to points first or second.
 *  @return first for index 0, second for index 1 or third for index 2
 */
- (id)objectAtIndex:(NSUInteger)index;

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
