//
//  NSAFunctional.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 30..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#if NS_BLOCKS_AVAILABLE

/*!
 *  @brief Object unary operation block. Take an object and returns an object.
 */
typedef id (^NSAObjectUnaryOperator)(id obj);
/*!
 *  @brief Object selection block. Take an object and returns a boolean.
 */
typedef BOOL (^NSAObjectPicker)(id obj);
/*!
 *  @brief Object binary operation block. Take 2 objects and returns an object.
 */
typedef id (^NSAObjectBinaryOperator)(id obj1, id obj2);


/*!
 *  @brief Applies mapper to every item of enumerator and returns an enumerator with every result items.
 *  @param enumerator
 *      Input object source enumerator.
 *  @param mapper
 *      Object mapper to apply every item.
 *  @return An enumerator with every mapper applied result.
 */
FOUNDATION_EXTERN NSEnumerator *NSAMap(id<NSFastEnumeration> enumerator, NSAObjectUnaryOperator mapper);
/*!
 *  @brief Applies mapper to every item of enumerator and returns an enumerator with every result items except nil.
 *  @param enumerator
 *      Input object source enumerator.
 *  @param mapper
 *      Object mapper to apply every item. Return nil to pass.
 *  @return Take each object from given enumerator and returns an enumerator with mapped value by mapper. If the result is nil, it will not be enumerated.
 *  @see NSAMap
 *  @see NSAFilter
 */
FOUNDATION_EXTERN NSEnumerator *NSAMapFilter(NSEnumerator *enumerator, NSAObjectUnaryOperator mapper);

/*!
 *  @brief Applies filter to every item of given enumerator and returns an enumerator with the filter result is YES.
 *  @param enumerator
 *      Input object source enumerator.
 *  @param filter
 *      Object filter to decide inclues or not.
 *  @return An enumerator with filter result of items of given enumerater is YES.
 */
FOUNDATION_EXTERN NSEnumerator *NSAFilter(NSEnumerator *enumerator, NSAObjectPicker filter);

/*!
 *  @brief Apply operation of two arguments cumulatively to the items of enumerator, from left to right, so as to reduce the iterable to a single value. Uses first and second value as seed.
 *  @details Given enumerator must enumerate more than a object.
 *  @param enumerator
 *      Input object source enumerator.
 *  @param operation
 *      An operator to apply every item and latest result. If it is first object, operation is not used and keep the object as latest result.
 *  @return An object.
 *  @see NSAReduceWithInitialObject
 */
FOUNDATION_EXTERN id NSAReduce(NSEnumerator *enumerator, NSAObjectBinaryOperator operation);
/*!
 *  @brief Apply operation of two arguments cumulatively to the items of enumerator, from left to right, so as to reduce the iterable to a single value.
 *  @details Given enumerator must enumerate more than a object.
 *  @param enumerator
 *      Input object source enumerator.
 *  @param operation
 *      An operator to apply every item and latest result. If it is first object, uses initialObject as latest result.
 *  @return An object.
 *  @see NSAReduce
 */
FOUNDATION_EXTERN id NSAReduceWithInitialObject(id<NSFastEnumeration> enumerator, NSAObjectBinaryOperator operation, id initialObject);


/*!
 *  @brief Functional feature extension.
 */
@interface NSArray (FoundationExtensionFunctional)

/*!
 *  @brief Maps mapper to objects and returns the result as array.
 *  @see NSAMap
 */
- (NSArray *)arrayByMappingOperator:(NSAObjectUnaryOperator)mapper;
/*!
 *  @brief Maps mapper to objects and filters nil result and returns the result as array.
 *  @see NSAMapFilter
 */
- (NSArray *)arrayByMapFilteringOperator:(NSAObjectUnaryOperator)mapper;
/*!
 *  @brief Filter objects and returns result as array.
 *  @see NSAFilter
 */
- (NSArray *)arrayByFilteringOperator:(NSAObjectPicker)filter;
/*!
 *  @brief Reduce objects and returns the result.
 *  @see NSAReduce
 */
- (id)reduce:(NSAObjectBinaryOperator)reduce;
/*!
 *  @brief Reduce objects and returns the result.
 *  @see NSAReduceWithInitialObject
 */
- (id)reduce:(NSAObjectBinaryOperator)reduce initialObject:(id)initialObject;

@end


/*!
 *  @brief Functional feature extension.
 */
@interface NSMutableArray (FoundationExtensionFunctional)

/*!
 *  @brief Maps objects
 *  @see NSAMap
 */
- (void)map:(NSAObjectUnaryOperator)mapper;
/*!
 *  @brief Maps objects and remove nil
 *  @see NSAMapFilter
 */
- (void)mapFilter:(NSAObjectUnaryOperator)mapper;
/*!
 *  @brief Filter objects
 *  @see NSAFilter
 */
- (void)filter:(NSAObjectPicker)mapper;

@end

#endif
