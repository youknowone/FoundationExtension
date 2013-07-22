//
//  NSAOrderedDictionary.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 11. 4..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief Dictionary with ordered keys, guaranting its order is keeped.
 *  @see [NSDictionary][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSDictionary_Class/Reference/Reference.html
 */

#import <Foundation/Foundation.h>

/*!
 *  @brief Immutable ordered dictionary.
 */
@interface NSAOrderedDictionary : NSDictionary {
    NSDictionary *_impl;
    NSOrderedSet *_order;
}

- (id)keyAtIndex:(NSUInteger)index;
- (id)objectAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfKey:(id)key;
- (NSEnumerator *)reversedKeyEnumerator;

@end

/*!
 *  @brief Mutable ordered dictionary.
 */
@interface NSAMutableOrderedDictionary : NSMutableDictionary {
    NSMutableDictionary *_impl;
    NSMutableOrderedSet *_order;
}

- (id)keyAtIndex:(NSUInteger)index;
- (id)objectAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfKey:(id)key;
- (NSEnumerator *)reversedKeyEnumerator;

@end
