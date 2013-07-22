//
//  NSNumberFormatter.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [NSNumberFormatter][0] extension category collection.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSNumberFormatter_Class/Reference/Reference.html
 */

#import <Foundation/Foundation.h>

/*!
 *  @brief Common shortcuts
 */
@interface NSNumberFormatter (Shortcuts)

/*!
 *  @brief Creates and returns default formatter.
 */
+ (NSNumberFormatter *)formatter;

/*! @name Number style */

/*!
 *  @brief Initialize with number style.
 *  @see [setNumberStyle:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSNumberFormatter_Class/Reference/Reference.html#//apple_ref/occ/instm/NSNumberFormatter/setNumberStyle:
 */
- (id)initWithNumberStyle:(NSNumberFormatterStyle)style;
/*!
 *  @brief Creates and returns with number style.
 *  @see initWithNumberStyle:
 */
+ (NSNumberFormatter *)formatterWithNumberStyle:(NSNumberFormatterStyle)style;

/*!
 *  @brief Quick decimal formatting for NSNumber
 *  @see [NSNumberFormatterDecimalStyle][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSNumberFormatter_Class/Reference/Reference.html#//apple_ref/doc/c_ref/NSNumberFormatterDecimalStyle
 */
+ (NSString *)formattedStringByDecimalStyleForNumber:(NSNumber *)number;
/*!
 *  @brief Quick decimal formatting for NSInteger
 *  @see formattedStringByDecimalStyleForNumber:
 */
+ (NSString *)formattedStringByDecimalStyleForInteger:(NSInteger)integer;

/*! @name Property shortcut for legacy compilers */

//! @brief Property shortcut for old compilers
@property(assign) NSNumberFormatterStyle numberStyle;
//! @brief Property shortcut for old compilers
@property(assign) BOOL generatesDecimalNumbers;
//! @brief Property shortcut for old compilers
@property(assign) NSLocale *locale;

@end
