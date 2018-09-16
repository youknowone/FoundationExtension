//
//  NSNull.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 9..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief [NSNull][0] extension cateogory collection..
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSNull_Class/Reference/Reference.html
 */

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

/*!
 *  @brief [NSNull][0] tools.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSNull_Class/Reference/Reference.html
 */
@interface NSNull (Tools)

/*
 *  @brief YES if obj is NSNull; otherwise NO.
 */
+ (BOOL)objectIsNull:(id _Nullable)obj;

/*
 *  @brief YES if obj is nil or NSNull; otherwise NO.
 */
+ (BOOL)objectIsNilOrNull:(id _Nullable)obj;

/*
 *  @brief Returns NSNull if obj is nil; otherwise obj.
 */
+ (id)nullIfObjectIsNil:(id _Nullable)obj;

/*
 *  @brief Returns nil if obj is NSNull; otherwise obj.
 */
+ (id)nilIfObjectIsNull:(id _Nullable)obj;

@end

NS_ASSUME_NONNULL_END
