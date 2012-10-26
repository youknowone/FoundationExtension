//
//  NSNumberFormatterAdditions.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

//! @brief NSNumberFormatter shortcuts.
@interface NSNumberFormatter (FoundationExtensionShortcut)

//! @brief numberStyle property interface
@property(assign) NSNumberFormatterStyle numberStyle;
//! @brief generatesDecimalNumbers property interface
@property(assign) BOOL generatesDecimalNumbers;
//! @brief locale property interface
@property(assign) NSLocale *locale;

//! @brief Creates and returns default formatter.
+ (NSNumberFormatter *)formatter;

/*!
 *  @brief Initialize with number style.
 */
- (id)initWithNumberStyle:(NSNumberFormatterStyle)style;
/*!
 *  @brief Creates and returns with number style.
 *  @see initWithNumberStyle:
 */
+ (NSNumberFormatter *)formatterWithNumberStyle:(NSNumberFormatterStyle)style;

/*!
 *  @brief Quick decimal formatting for NSNumber
 */
+ (NSString *)formattedStringByDecimalStyleForNumber:(NSNumber *)number;
/*!
 *  @brief Quick decimal formatting for NSInteger
 *  @see formattedStringByDecimalStyleForNumber:
 */
+ (NSString *)formattedStringByDecimalStyleForInteger:(NSInteger)integer;

@end
