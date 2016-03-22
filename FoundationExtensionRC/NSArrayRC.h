//
//  NSArrayRC.h
//  FoundationExtensionRC
//
//  Created by Jeong YunWon on 2016. 3. 21..
//  Copyright © 2016 youknowone.org. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (CreationRC)

/*!
 *  @brief Initializes a newly allocated array to include a given number of retained given object.
 *  @param object An object to retain.
 *  @param count The number of values.
 *  @return A newly allocated array including the count objects from object. The returned object might be different than the original receiver.
 */
- (instancetype)initWithObject:(id)object count:(NSUInteger)count;

/*!
 *  @brief Returns a newly allocated array to include a given number of retained given object.
 *  @param object An object to retain.
 *  @param count The number of values.
 *  @return A newly allocated array including the count objects from object. The returned object might be different than the original receiver.
 */
+ (instancetype)arrayWithObject:(id)object count:(NSUInteger)count;

/*!
 *  @brief Initializes a newly allocated array to include a given number of copied given object.
 *  @param object An object to copy.
 *  @param count The number of values.
 *  @param flag A flag to notice mutable or immutable copy.
 *  @return A newly allocated array including the count objects from object. The returned object might be different than the original receiver.
 */
- (instancetype)initWithObjectCopy:(id)object count:(NSUInteger)count mutable:(BOOL)flag;


@end
