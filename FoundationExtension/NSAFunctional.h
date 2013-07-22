//
//  NSAFunctional.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 30..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @page Map/Filter/Reduce
 *  @brief This document describes basic concept of functional tools: Map/Filter/Reduce
 *
 *  FoundationExtension adds small functional programming tools, called Map, Filter and Reduce.
 *  These are useful when used with array.
 *
 *  In short:
 *  - Map applies a function to all items.
 *  - Filter filters some items by a function.
 *  - Reduce derive a value from items.
 *
 *  If you are not familliar with this concept, see python document below - because I referenced it too:
 *
 *      http://docs.python.org/2/tutorial/datastructures.html#functional-programming-tools
 *
 *  If you are playing with array,
 *  @see @ref NSArray(Functional)
 *  @see @ref NSMutableArray(Functional)
 *
 *  If you are playing with enumerator,
 *  @see NSAMap
 *  @see NSAFilter
 *  @see NSAMapFilter
 *  @see NSAReduce
 *  @see NSAReduceWithInitialObject
 *  @see @ref NSEnumerator(Functional)
 *
 *  About files,
 *  @see NSAFunctional.h
 */

/*!
 *  @file
 *  @brief See @ref Map/Filter/Reduce for concept of functional tools.
 */

#import <Foundation/Foundation.h>

#if NS_BLOCKS_AVAILABLE

/*!
 *  @brief Procedure take an object. Take an object and execute job.
 */
typedef void (^NSAObjectProcedure)(id obj);
/*!
 *  @brief Procedure take an object with index. Take an object and execute job.
 */
typedef void (^NSAObjectProcedureWithIndex)(id obj, NSUInteger index);
/*!
 *  @brief Procedure take an object with key. Take an object and execute job.
 */
typedef void (^NSAObjectProcedureWithKey)(id obj, id key);
/*!
 *  @brief Object unary operation block. Take an object and returns an object.
 */
typedef id (^NSAObjectUnaryOperator)(id obj);
/*!
 *  @brief Object unary operation block. Take an object with index and returns an object.
 */
typedef id (^NSAObjectUnaryOperatorWithIndex)(id obj, NSUInteger index);
/*!
 *  @brief Object unary operation block. Take an object with key and returns an object.
 */
typedef id (^NSAObjectUnaryOperatorWithKey)(id obj, id key);
/*!
 *  @brief Object selection block. Take an object and returns a boolean.
 */
typedef BOOL (^NSAObjectPicker)(id obj);
/*!
 *  @brief Object selection block. Take an object with index and returns a boolean.
 */
typedef BOOL (^NSAObjectPickerWithIndex)(id obj, NSUInteger index);
/*!
 *  @brief Object selection block. Take an object with key and returns a boolean.
 */
typedef BOOL (^NSAObjectPickerWithKey)(id obj, id key);
/*!
 *  @brief Object binary operation block. Take 2 objects and returns an object.
 */
typedef id (^NSAObjectBinaryOperator)(id obj1, id obj2);


/*!
 *  @brief Applies mapper to every item of enumerator.
 *  @param enumerator Input object source enumerator.
 *  @param procedure A procedure to apply every item.
 */
FOUNDATION_EXTERN void NSAApply(id<NSFastEnumeration> enumerator, NSAObjectProcedure procedure);

/*!
 *  @brief Applies mapper with index to every item of enumerator.
 *  @param enumerator Input object source enumerator.
 *  @param procedure A procedure to apply every item.
 */
FOUNDATION_EXTERN void NSAApplyWithIndex(id<NSFastEnumeration> enumerator, NSAObjectProcedureWithIndex procedure);

/*!
 *  @brief Applies mapper to every item of enumerator and returns an enumerator with every result items.
 *  @param enumerator Input object source enumerator.
 *  @param mapper Object mapper to apply every item.
 *  @return An enumerator with every mapper applied result.
 */
FOUNDATION_EXTERN NSEnumerator *NSAMap(id<NSFastEnumeration> enumerator, NSAObjectUnaryOperator mapper);

/*!
 *  @brief Applies mapper with index to every item of enumerator and returns an enumerator with every result items.
 *  @param enumerator Input object source enumerator.
 *  @param mapper Object mapper to apply every item.
 *  @return An enumerator with every mapper applied result.
 */
FOUNDATION_EXTERN NSEnumerator *NSAMapWithIndex(id<NSFastEnumeration> enumerator, NSAObjectUnaryOperatorWithIndex mapper);

/*!
 *  @brief Applies mapper to every item of enumerator and returns an enumerator with every result items except nil.
 *  @param enumerator Input object source enumerator.
 *  @param mapper Object mapper to apply every item. Return nil to pass.
 *  @return Take each object from given enumerator and returns an enumerator with mapped value by mapper. If the result is nil, it will not be enumerated.
 *  @see NSAMap
 *  @see NSAFilter
 */
FOUNDATION_EXTERN NSEnumerator *NSAMapFilter(NSEnumerator *enumerator, NSAObjectUnaryOperator mapper);

/*!
 *  @brief Applies mapper with index to every item of enumerator and returns an enumerator with every result items except nil.
 *  @param enumerator Input object source enumerator.
 *  @param mapper Object mapper to apply every item. Return nil to pass.
 *  @return Take each object from given enumerator and returns an enumerator with mapped value by mapper. If the result is nil, it will not be enumerated.
 *  @see NSAMap
 *  @see NSAFilter
 */
FOUNDATION_EXTERN NSEnumerator *NSAMapFilterWithIndex(NSEnumerator *enumerator, NSAObjectUnaryOperatorWithIndex mapper);

/*!
 *  @brief Applies filter to every item of given enumerator and returns an enumerator with the filter result is YES.
 *  @param enumerator Input object source enumerator.
 *  @param filter Object filter to decide inclues or not.
 *  @return An enumerator with filter result of items of given enumerater is YES.
 */
FOUNDATION_EXTERN NSEnumerator *NSAFilter(NSEnumerator *enumerator, NSAObjectPicker filter);

/*!
 *  @brief Applies filter with index to every item of given enumerator and returns an enumerator with the filter result is YES.
 *  @param enumerator Input object source enumerator.
 *  @param filter Object filter to decide inclues or not.
 *  @return An enumerator with filter result of items of given enumerater is YES.
 */
FOUNDATION_EXTERN NSEnumerator *NSAFilterWithIndex(NSEnumerator *enumerator, NSAObjectPickerWithIndex filter);

/*!
 *  @brief Applies operation of two arguments cumulatively to the items of enumerator, from left to right, so as to reduce the iterable to a single value. Uses first and second value as seed.
 *  @details Given enumerator must enumerate more than a object.
 *  @param enumerator Input object source enumerator.
 *  @param operation An operator to apply every item and latest result. If it is first object, operation is not used and keep the object as latest result.
 *  @return An object.
 *  @see NSAReduceWithInitialObject
 */
FOUNDATION_EXTERN id NSAReduce(NSEnumerator *enumerator, NSAObjectBinaryOperator operation);
/*!
 *  @brief Applies operation of two arguments cumulatively to the items of enumerator, from left to right, so as to reduce the iterable to a single value.
 *  @details Given enumerator must enumerate more than a object.
 *  @param enumerator Input object source enumerator.
 *  @param operation An operator to apply every item and latest result. If it is first object, uses initialObject as latest result.
 *  @param initialObject The initial value to reduce with first element of enumerator.
 *  @return An object.
 *  @see NSAReduce
 */
FOUNDATION_EXTERN id NSAReduceWithInitialObject(id<NSFastEnumeration> enumerator, NSAObjectBinaryOperator operation, id initialObject);


/*!
 *  @brief See @ref Map/Filter/Reduce for concept of functional tools.
 *  @see NSAFunctional.h
 *  @see @ref NSMutableArray(Functional)
 */
@interface NSEnumerator (Functional)

/*!
 *  @brief Apply procedure to objects.
 *  @details Shallow wrapper of @link NSAApply @endlink
 *  @see NSAApply
 */
- (void)applyProcedure:(NSAObjectProcedure)procedure;

/*!
 *  @brief Apply procedure with index to objects.
 *  @details Shallow wrapper of @link NSAApply @endlink
 *  @see NSAApply
 */
- (void)applyProcedureWithIndex:(NSAObjectProcedureWithIndex)procedure;

/*!
 *  @brief Maps mapper to objects and returns the result as array.
 *  @details Shallow wrapper of @link NSAMap @endlink
 *  @see NSAMap
 */
- (NSArray *)arrayByMappingOperator:(NSAObjectUnaryOperator)mapper;

/*!
 *  @brief Maps mapper with index to objects and returns the result as array.
 *  @details Shallow wrapper of @link NSAMapWithIndex @endlink
 *  @see NSAMap
 */
- (NSArray *)arrayByMappingOperatorWithIndex:(NSAObjectUnaryOperatorWithIndex)mapper;

/*!
 *  @brief Maps mapper to objects and filters nil result and returns the result as array.
 *  @details Shallow wrapper of @link NSAMapFilter @endlink
 *  @see NSAMapFilter
 */
- (NSArray *)arrayByMapFilteringOperator:(NSAObjectUnaryOperator)mapper;

/*!
 *  @brief Maps mapper with index to objects and filters nil result and returns the result as array.
 *  @details Shallow wrapper of @link NSAMapFilterWithIndex @endlink
 *  @see NSAMapFilter
 */
- (NSArray *)arrayByMapFilteringOperatorWithIndex:(NSAObjectUnaryOperatorWithIndex)mapper;

/*!
 *  @brief Filters objects and returns result as array.
 *  @details Shallow wrapper of @link NSAFilter @endlink
 *  @see NSAFilter
 */
- (NSArray *)arrayByFilteringOperator:(NSAObjectPicker)filter;

/*!
 *  @brief Filters objects with index and returns result as array.
 *  @details Shallow wrapper of @link NSAFilterWithIndex @endlink
 *  @see NSAFilter
 */
- (NSArray *)arrayByFilteringOperatorWithIndex:(NSAObjectPickerWithIndex)filter;

/*!
 *  @brief Reduces objects and returns the result.
 *  @details Shallow wrapper of @link NSAReduce @endlink
 *  @see NSAReduce
 */
- (id)reduce:(NSAObjectBinaryOperator)reduce;
/*!
 *  @brief Reduces objects and returns the result.
 *  @details Shallow wrapper of @link NSAReduceWithInitialObject @endlink
 *  @see NSAReduceWithInitialObject
 */
- (id)reduce:(NSAObjectBinaryOperator)reduce initialObject:(id)initialObject;

@end


/*!
 *  @brief See @ref Map/Filter/Reduce for concept of functional tools.
 *  @see NSAFunctional.h
 *  @see @ref NSMutableArray(Functional)
 */
@interface NSArray (Functional)

/*!
 *  @brief Apply procedure to objects.
 *  @details Shallow wrapper of @link NSAApply @endlink
 *  @see NSAApply
 */
- (void)applyProcedure:(NSAObjectProcedure)procedure;

/*!
 *  @brief Apply procedure with index to objects.
 *  @details Shallow wrapper of @link NSAApply @endlink
 *  @see NSAApply
 */
- (void)applyProcedureWithIndex:(NSAObjectProcedureWithIndex)procedure;

/*!
 *  @brief Maps mapper to objects and returns the result as array.
 *  @details Shallow wrapper of @link NSAMap @endlink
 *  @see NSAMap
 */
- (NSArray *)arrayByMappingOperator:(NSAObjectUnaryOperator)mapper;

/*!
 *  @brief Maps mapper with index to objects and returns the result as array.
 *  @details Shallow wrapper of @link NSAMapWithIndex @endlink
 *  @see NSAMap
 */
- (NSArray *)arrayByMappingOperatorWithIndex:(NSAObjectUnaryOperatorWithIndex)mapper;

/*!
 *  @brief Maps mapper to objects and filters nil result and returns the result as array.
 *  @details Shallow wrapper of @link NSAMapFilter @endlink
 *  @see NSAMapFilter
 */
- (NSArray *)arrayByMapFilteringOperator:(NSAObjectUnaryOperator)mapper;

/*!
 *  @brief Maps mapper with index to objects and filters nil result and returns the result as array.
 *  @details Shallow wrapper of @link NSAMapFilterWithIndex @endlink
 *  @see NSAMapFilter
 */
- (NSArray *)arrayByMapFilteringOperatorWithIndex:(NSAObjectUnaryOperatorWithIndex)mapper;

/*!
 *  @brief Filters objects and returns result as array.
 *  @details Shallow wrapper of @link NSAFilter @endlink
 *  @see NSAFilter
 */
- (NSArray *)arrayByFilteringOperator:(NSAObjectPicker)filter;

/*!
 *  @brief Filters objects with index and returns result as array.
 *  @details Shallow wrapper of @link NSAFilterWithIndex @endlink
 *  @see NSAFilter
 */
- (NSArray *)arrayByFilteringOperatorWithIndex:(NSAObjectPickerWithIndex)filter;

/*!
 *  @brief Reduces objects and returns the result.
 *  @details Shallow wrapper of @link NSAReduce @endlink
 *  @see NSAReduce
 */
- (id)reduce:(NSAObjectBinaryOperator)reduce;
/*!
 *  @brief Reduces objects and returns the result.
 *  @details Shallow wrapper of @link NSAReduceWithInitialObject @endlink
 *  @see NSAReduceWithInitialObject
 */
- (id)reduce:(NSAObjectBinaryOperator)reduce initialObject:(id)initialObject;

@end


/*!
 *  @brief See @ref Map/Filter/Reduce for concept of functional tools.
 *  @see NSAFunctional.h
 *  @see @ref NSArray(Functional)
 */
@interface NSMutableArray (Functional)

/*!
 *  @brief Applies mapper to every item and replace original item to new one.
 *  @see NSAMap
 */
- (void)map:(NSAObjectUnaryOperator)mapper;

/*!
 *  @brief Applies mapper with index to every item and replace original item to new one.
 *  @see NSAMap
 */
- (void)mapWithIndex:(NSAObjectUnaryOperatorWithIndex)mapper;

/*!
 *  @brief Applies mapper to every item and replace original item to new one or remove if new one is nil.
 *  @see NSAMapFilter
 */
- (void)mapFilter:(NSAObjectUnaryOperator)mapper;

/*!
 *  @brief Applies mapper with index to every item and replace original item to new one or remove if new one is nil.
 *  @see NSAMapFilter
 */
- (void)mapFilterWithIndex:(NSAObjectUnaryOperatorWithIndex)mapper;

/*!
 *  @brief Applies filter to every item and remove it if result is NO.
 *  @see NSAFilter
 */
- (void)filter:(NSAObjectPicker)filter;

/*!
 *  @brief Applies filter with index to every item and remove it if result is NO.
 *  @see NSAFilter
 */
- (void)filterWithIndex:(NSAObjectPickerWithIndex)filter;

@end


/*!
 *  @brief See @ref Map/Filter/Reduce for concept of functional tools.
 *  @details Dictionary is not fit for this functional tools. But this implementation takes concept of them.
 *  @see NSAFunctional.h
 *  @see @ref NSMutableDictionary(Functional)
 */
@interface NSDictionary (Functional)

/*!
 *  @brief Apply procedure with key to objects.
 *  @details Works as like NSAApply is adjusted to values of dictionary.
 *  @see NSAApply
 */
- (void)applyProcedureWithKey:(NSAObjectProcedureWithKey)procedure;

/*!
 *  @brief Maps mapper to objects and returns the result as dictionary.
 *  @details Works as like @link NSAMap @endlink
 *  @see NSAMap
 */
- (NSDictionary *)dictionaryByMappingOperator:(NSAObjectUnaryOperator)mapper;

/*!
 *  @brief Maps mapper with key to objects and returns the result as array.
 *  @details Works as like @link NSAMapWithIndex @endlink
 *  @see NSAMap
 */
- (NSDictionary *)dictionaryByMappingOperatorWithKey:(NSAObjectUnaryOperatorWithKey)mapper;

/*!
 *  @brief Maps mapper to objects and filters nil result and returns the result as array.
 *  @details Works as like @link NSAMapFilter @endlink
 *  @see NSAMapFilter
 */
- (NSDictionary *)dictionaryByMapFilteringOperator:(NSAObjectUnaryOperator)mapper;

/*!
 *  @brief Maps mapper with index to objects and filters nil result and returns the result as array.
 *  @details Works as like @link NSAMapFilterWithIndex @endlink
 *  @see NSAMapFilter
 */
- (NSDictionary *)dictionaryByMapFilteringOperatorWithKey:(NSAObjectUnaryOperatorWithKey)mapper;

/*!
 *  @brief Filters objects and returns result as array.
 *  @details Works as like @link NSAFilter @endlink
 *  @see NSAFilter
 */
- (NSDictionary *)dictionaryByFilteringOperator:(NSAObjectPicker)filter;

/*!
 *  @brief Filters objects with key and returns result as array.
 *  @details Works as like @link NSAFilterWithIndex @endlink
 *  @see NSAFilter
 */
- (NSDictionary *)dictionaryByFilteringOperatorWithKey:(NSAObjectPickerWithKey)filter;

@end


/*!
 *  @brief See @ref Map/Filter/Reduce for concept of functional tools.
 *  @details Dictionary is not fit for this functional tools. But this implementation takes concept of them.
 *  @see NSAFunctional.h
 *  @see @ref NSDictionary(Functional)
 */
@interface NSMutableDictionary (Functional)

/*!
 *  @brief Applies mapper to every item and replace original item to new one.
 *  @see NSAMap
 */
- (void)map:(NSAObjectUnaryOperator)mapper;

/*!
 *  @brief Applies mapper with key to every item and replace original item to new one.
 *  @see NSAMap
 */
- (void)mapWithKey:(NSAObjectUnaryOperatorWithKey)mapper;

/*!
 *  @brief Applies mapper to every item and replace original item to new one or remove if new one is nil.
 *  @see NSAMapFilter
 */
- (void)mapFilter:(NSAObjectUnaryOperator)mapper;

/*!
 *  @brief Applies mapper with key to every item and replace original item to new one or remove if new one is nil.
 *  @see NSAMapFilter
 */
- (void)mapFilterWithKey:(NSAObjectUnaryOperatorWithKey)mapper;

/*!
 *  @brief Applies filter to every item and remove it if result is NO.
 *  @see NSAFilter
 */
- (void)filter:(NSAObjectPicker)filter;

/*!
 *  @brief Applies filter with key to every item and remove it if result is NO.
 *  @see NSAFilter
 */
- (void)filterWithKey:(NSAObjectPickerWithKey)filter;

@end

#endif
