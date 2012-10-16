//
//  NSNumberFormatterAdditions.m
//  FoundationExtension
//
//  Created by youknowone on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSNumberFormatterAdditions.h"

@implementation NSNumberFormatter (FoundationExtension)
@dynamic numberStyle;
@dynamic generatesDecimalNumbers;
@dynamic locale;

+ (NSNumberFormatter *)formatter {
	return [[self alloc] autorelease];
}

- (id)initWithNumberStyle:(NSNumberFormatterStyle)style {
	self = [self init];
	[self setNumberStyle:style];
	return self;
}

+ (NSNumberFormatter *)formatterWithNumberStyle:(NSNumberFormatterStyle)style {
	return [[[self alloc] initWithNumberStyle:style] autorelease];
}

+ (NSString *)formattedStringByDecimalStyleForNumber:(NSNumber *)number {
	return [[self formatterWithNumberStyle:NSNumberFormatterDecimalStyle] stringFromNumber:number];
}

+ (NSString *)formattedStringByDecimalStyleForInteger:(NSInteger)integer {
	return [self formattedStringByDecimalStyleForNumber:[NSNumber numberWithInteger:integer]];
}

@end
