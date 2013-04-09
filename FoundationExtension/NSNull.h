//
//  NSNull.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 9..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

/*!
 *  @brief NSNull tools
 */
@interface NSNull (Tools)

/*
 *  @brief YES if obj is NSNull; otherwise NO.
 */
+ (BOOL)objectIsNull:(id)obj;

/*
 *  @brief YES if obj is nil or NSNull; otherwise NO.
 */
+ (BOOL)objectIsNilOrNull:(id)obj;

/*
 *  @brief Returns NSNull if obj is nil; otherwise obj.
 */
+ (id)nullIfObjectIsNil:(id)obj;

/*
 *  @brief Returns nil if obj is NSNull; otherwise obj.
 */
+ (id)nilIfObjectIsNull:(id)obj;

@end
