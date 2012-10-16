//
//  NSNumberFormatterAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

@interface NSNumberFormatter (FoundationExtension)

@property(assign) NSNumberFormatterStyle numberStyle;
@property(assign) BOOL generatesDecimalNumbers;
@property(assign) NSLocale *locale;

+ (NSNumberFormatter *)formatter;
- (id)initWithNumberStyle:(NSNumberFormatterStyle)style;
+ (NSNumberFormatter *)formatterWithNumberStyle:(NSNumberFormatterStyle)style;

+ (NSString *)formattedStringByDecimalStyleForNumber:(NSNumber *)number;
+ (NSString *)formattedStringByDecimalStyleForInteger:(NSInteger)integer;

@end
