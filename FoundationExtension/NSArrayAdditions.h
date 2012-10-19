//
//  NSArrayAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 11. 1. 25..
//  Copyright 2011 youknowone.org All rights reserved.
//

@interface NSArray (FoundationExtensionCreation)

/*!
 *  @brief Initializes a newly allocated array with the contents of data. (plist)
 *  @param data
 *      An NSData object containing bytes of plist file representation.
 *  @return An array initialized to contain the contents in data. Returns nil if the contents of the request can’t be parsed into an array. The returned object might be different than the original receiver.
 *  @seealso -initWithData:options:format:error:
 *  @seealso +arrayWithData:options:format:error:
 */
- (id)initWithData:(NSData *)data;
/*!
 *  @brief Creates and returns an array containing the contents of data. (plist)
 *  @see -initWithData:
 */
+ (id)arrayWithData:(NSData *)data;

/*!
 *  @brief Initializes a newly allocated array with the contents of data. (plist)
 *  @param data
 *      An NSData object containing bytes of plist file representation.
 *  @param format
 *      A property list format. Possible values for format are described in @link NSPropertyListFormat @/link.
 *  @param error
 *      If the method does not complete successfully, upon return contains an NSError object that describes the problem.
 *  @return An array initialized to contain the contents in data. Returns nil if the contents of the request can’t be parsed into an array. The returned object might be different than the original receiver.
 *  @seealso -initWithData:
 *  @seealso +arrayWithData:
 */
- (id)initWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error;
/*!
 *  @brief Creates and returns an array containing the contents of data. (plist)
 *  @see -initWithData:options:format:error:
 */
+ (id)arrayWithData:(NSData *)data format:(NSPropertyListFormat *)format error:(NSError **)error;

/*!
 *  @brief Initializes a newly allocated array by placing in it the objects enumerated in a given enumerator.
 *  @param enumerator
 *      An NSEnumerator
 *  @return An array initialized to contain the objects — or if flag is YES, copies of the objects - enumerated in a given enumerator.
 *  @discussion This initilizer is not optimized.
 *  @seealso -initWithEnumerator:copyItems:
 */
- (id)initWithEnumerator:(NSEnumerator *)enumerator;
/*!
 *  @brief Creates and returns an array containing the objects enumerated in a given enumerator.
 *  @see -initWithEnumerator:
 */
+ (id)arrayWithEnumerator:(NSEnumerator *)enumerator;
/*!
 *  @brief Initializes a newly allocated array by placing in it the objects enumerated in a given enumerator.
 *  @param enumerator
 *      An NSEnumerator
 *  @return An array initialized to contain the objects — or if flag is YES, copies of the objects - enumerated in a given enumerator.
 *  @discussion This initilizer is not optimized.
 *  @seealso -initWithEnumerator:
 *  @seealso +arrayWithEnumerator:
 */
- (id)initWithEnumerator:(NSEnumerator *)enumerator copyItems:(BOOL)flag;

/*!
 *  @brief Initializes a newly allocated array with the contents of the result specified by a given request.
 *  @param request
 *      The URLRequest of a file containing a string representation of an array produced by the @link writeToURL:atomically: @/link method.
 *  @return An array initialized to contain the contents specified by request. Returns nil if the location can’t be opened or if the contents of the request can’t be parsed into an array. The returned object might be different than the original receiver.
 *  @seealso -initWithContentsOfURLRequest:format:error:
 *  @seealso +arrayWithContentsOfURLRequest:format:error: 
 */
- (id)initWithContentsOfURLRequest:(NSURLRequest *)request;
/*!
 *  @brief Creates and returns an array containing the contents of the result specified by a given request.
 *  @see -initWithContentsOfURLRequest:
 */
+ (id)arrayWithContentsOfURLRequest:(NSURLRequest *)request;

/*!
 *  @brief Initializes a newly allocated array with the contents of the result specified by a given request.
 *  @param request
 *      The URLRequest of a file containing a string representation of an array produced by the @link writeToURL:atomically: @/link method.
 *  @param format
 *      A property list format. Possible values for format are described in @link NSPropertyListFormat @/link.
 *  @param error
 *      If the method does not complete successfully, upon return contains an NSError object that describes the problem.
 *  @result An array initialized to contain the contents specified by request. Returns nil if the location can’t be opened or if the contents of the request can’t be parsed into an array. The returned object might be different than the original receiver.
 *  @seealso -initWithContentsOfURLRequest:
 *  @seealso +arrayWithContentsOfURLRequest:
 */
- (id)initWithContentsOfURLRequest:(NSURLRequest *)request format:(NSPropertyListFormat *)format error:(NSError **)error;
/*!
 *  @brief Creates and returns an array containing the contents of the result specified by a given request.
 *  @see initWithContentsOfURLRequest:format:error:
 */
+ (id)arrayWithContentsOfURLRequest:(NSURLRequest *)request format:(NSPropertyListFormat *)format error:(NSError **)error;

@end


@interface NSArray (FoundationExtensionNSNumber)

/*!
 *  @brief Returns the integer located at index.
 *  @param index
 *      An index within the bounds of the array.
 *  @result The integer decoded from NSNumber object located at index.
 *  @see -objectAtIndex:
 *  @seealso NSNumber-integer
 */
- (NSInteger)integerAtIndex:(NSUInteger)index;

/*!
 *  @brief Returns the lowest index whose corresponding array value is equal to a given integer.
 *  @param value
 *      A value.
 *  @result The lowest index whose corresponding array value is equal to value. If none of the objects in the array is equal to NSNumber with value, returns NSNotFound.
 *  @see -indexOfObject:
 *  @seealso NSNumber+numberWithInteger:
 */
- (NSUInteger)indexOfInteger:(NSInteger)value;

@end


@interface NSMutableArray (FoundationExtensionNSNumber)

/*!
 *  @brief Inserts a given integer at the end of the array.
 *  @param value
 *      The value to add to the end of the array's content.
 *  @see -addObject:
 *  @seealso NSNumber+numberWithInteger:
 */
- (void)addInteger:(NSInteger)value;

/*!
 *  @brief Inserts a given integer at a given index.
 *  @param value
 *      The value to add to the array's content.
 *  @param index
 *      The index in the array at which to insert value. This value must not be greater than the count of elements in the array.
 *  @see -insertObject:atIndex:
 *  @seealso NSNumber+numberWithInteger:
 */
- (void)insertInteger:(NSInteger)value atIndex:(NSUInteger)index;

@end