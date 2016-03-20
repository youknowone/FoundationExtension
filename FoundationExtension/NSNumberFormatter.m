//
//  NSNumberFormatter.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSNumberFormatter.h"

@implementation NSNumberFormatter (Shortcuts)
@dynamic numberStyle;
@dynamic generatesDecimalNumbers;
@dynamic locale;

+ (NSNumberFormatter *)formatter {
    return [[self alloc] init];
}

- (instancetype)initWithNumberStyle:(NSNumberFormatterStyle)style {
    self = [self init];
    if (self != nil) {
        [self setNumberStyle:style];
    }
    return self;
}

+ (NSNumberFormatter *)formatterWithNumberStyle:(NSNumberFormatterStyle)style {
    return [[self alloc] initWithNumberStyle:style];
}

+ (NSString *)formattedStringByDecimalStyleForNumber:(NSNumber *)number {
    return [[self formatterWithNumberStyle:NSNumberFormatterDecimalStyle] stringFromNumber:number];
}

+ (NSString *)formattedStringByDecimalStyleForInteger:(NSInteger)integer {
    return [self formattedStringByDecimalStyleForNumber:@(integer)];
}

@end
