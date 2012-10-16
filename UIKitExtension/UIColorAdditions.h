//
//  UIColorAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

@interface UIColor (FoundationExtension)
- (UIColor *)initWithHTMLHexExpression16:(NSString *)code;
- (UIColor *)initWithHTMLHexExpression32:(NSString *)code;
- (UIColor *)initWithHTMLHexExpression16a:(NSString *)code;
- (UIColor *)initWithHTMLHexExpression32a:(NSString *)code;
- (UIColor *)initWithHTMLExpression:(NSString *)code;

+ (UIColor *)colorWithHTMLColorName:(NSString *)name;
+ (UIColor *)colorWithHTMLHexExpression16:(NSString *)code;
+ (UIColor *)colorWithHTMLHexExpression32:(NSString *)code;
+ (UIColor *)colorWithHTMLHexExpression16a:(NSString *)code;
+ (UIColor *)colorWithHTMLHexExpression32a:(NSString *)code;
+ (UIColor *)colorWithHTMLExpression:(NSString *)code;
@end
