//
//  NSAEnumerator.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 2014. 9. 21..
//  Copyright (c) 2014년 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief Enumerators for convinience.
 */

#import <Foundation/Foundation.h>

/*!
 *  @brief  Infinite loop
 */
@interface NSAInfiniteEnumerator : NSEnumerator {
    id _pool[16];
}

/*!
 *  @brief Initialize and returns an enumerator with given object which will generate infinitely.
 */
- (instancetype)initWithObject:(id)object;
/*!
 *  @brief Returns an enumerator with given object which will generate infinitely.
 */
+ (instancetype)enumeratorWithObject:(id)object;

@end

/*!
 *  @brief  This enumerator generate number through a range.
 */
@interface NSARangeEnumerator : NSEnumerator {
    NSRange _range;
}

/*!
 *  @brief Initialize and returns an enumerator with given count.
 *  @details Start point is assumed to 0.
 */
- (instancetype)initWithCount:(NSUInteger)count;
/*!
 *  @brief Initialize and returns an enumerator with given range.
 */
- (instancetype)initWithRange:(NSRange)range;

+ (instancetype)enumeratorWithCount:(NSUInteger)count;
+ (instancetype)enumeratorWithRange:(NSRange)range;

@end


#if NS_BLOCKS_AVAILABLE
/*!
 *  @brief Enumeration block for NSABlockEnumerator
 */
typedef id (^NSABlockEnumeration)(NSUInteger index, BOOL *stop);
/*!
 *  @brief  Enumerator using block.
 */
@interface NSABlockEnumerator : NSEnumerator {
    NSABlockEnumeration block;
}

/*!
 *  @brief block
 */
@property(nonatomic,copy) NSABlockEnumeration block;

/*!
 *  @brief Initialize and returns an enumerator with given block.
 */
- (instancetype)initWithBlock:(NSABlockEnumeration)block;
/*!
 *  @brief Returns an enumerator with given block.
 */
+ (instancetype)enumeratorWithBlock:(NSABlockEnumeration)block;

@end
#endif
