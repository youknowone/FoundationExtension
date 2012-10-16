//
//  UIColorAdditions.m
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSStringAdditions.h"
#import "UIColorAdditions.h"

NSDictionary *FoundationExtensionUIColorNameTable = nil;

@implementation UIColor (FoundationExtension)

- (UIColor *)initWithHTMLHexExpression16:(NSString *)code {
    return [self initWithRed:[[code substringFromIndex:1 length:1] hexadecimalValue]/15.0f
                       green:[[code substringFromIndex:2 length:1] hexadecimalValue]/15.0f
                        blue:[[code substringFromIndex:3 length:1] hexadecimalValue]/15.0f
                       alpha:1.0f];
}

- (UIColor *)initWithHTMLHexExpression32:(NSString *)code {
    return [self initWithRed:[[code substringFromIndex:1 length:2] hexadecimalValue]/255.0f
                       green:[[code substringFromIndex:3 length:2] hexadecimalValue]/255.0f
                        blue:[[code substringFromIndex:5 length:2] hexadecimalValue]/255.0f
                       alpha:1.0f];
}

- (UIColor *)initWithHTMLHexExpression16a:(NSString *)code {
    return [self initWithRed:[[code substringFromIndex:1 length:1] hexadecimalValue]/15.0f
                       green:[[code substringFromIndex:2 length:1] hexadecimalValue]/15.0f
                        blue:[[code substringFromIndex:3 length:1] hexadecimalValue]/15.0f
                       alpha:[[code substringFromIndex:4 length:1] hexadecimalValue]/15.0f];
}

- (UIColor *)initWithHTMLHexExpression32a:(NSString *)code {
    return [self initWithRed:[[code substringFromIndex:1 length:2] hexadecimalValue]/255.0f
                       green:[[code substringFromIndex:3 length:2] hexadecimalValue]/255.0f
                        blue:[[code substringFromIndex:5 length:2] hexadecimalValue]/255.0f
                       alpha:[[code substringFromIndex:7 length:2] hexadecimalValue]/255.0f];
}

- (UIColor *)initWithHTMLExpression:(NSString *)code {
    if (![code hasPrefix:@"#"]) {
        [self release];
        return [[[self class] colorWithHTMLColorName:code] retain];
    }
    switch (code.length) {
        case 4: return [self initWithHTMLHexExpression16:code];
        case 5: return [self initWithHTMLHexExpression16a:code];
        case 7: return [self initWithHTMLHexExpression32:code];
        case 9: return [self initWithHTMLHexExpression32a:code];
    }
    [self release];
    return nil;
}

+ (UIColor *)colorWithHTMLColorName:(NSString *)name {
    if (FoundationExtensionUIColorNameTable == nil) {
        FoundationExtensionUIColorNameTable =
            [[NSDictionary alloc] initWithObjectsAndKeys:
             [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f], @"transperent",
             [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f], @"black",
             [UIColor colorWithRed:0.75f green:0.75f blue:0.75f alpha:1.0f], @"silver",
             [UIColor colorWithRed:0.5f green:0.0f blue:0.0f alpha:1.0f], @"maroon",
             [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f], @"red",
             [UIColor colorWithRed:0.0f green:0.0f blue:0.5f alpha:1.0f], @"navy",
             [UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:1.0f], @"blue",
             [UIColor colorWithRed:0.5f green:0.0f blue:0.5f alpha:1.0f], @"purple",
             [UIColor colorWithRed:1.0f green:0.0f blue:1.0f alpha:1.0f], @"fuchsia",
             [UIColor colorWithRed:0.0f green:0.5f blue:0.0f alpha:1.0f], @"green",
             [UIColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:1.0f], @"lime",
             [UIColor colorWithRed:0.5f green:0.5f blue:0.0f alpha:1.0f], @"olive",
             [UIColor colorWithRed:1.0f green:1.0f blue:0.0f alpha:1.0f], @"yellow",
             [UIColor colorWithRed:0.0f green:0.5f blue:0.5f alpha:1.0f], @"teal",
             [UIColor colorWithRed:0.0f green:1.0f blue:1.0f alpha:1.0f], @"aqua",
             [UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f], @"gray",
             [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f], @"white",
             [UIColor colorWithHTMLHexExpression32:@"#ffa500"], @"orange",
             nil];
    }
    return [FoundationExtensionUIColorNameTable objectForKey:name];
}

+ (UIColor *)colorWithHTMLHexExpression16:(NSString *)code {
    return [[[self alloc] initWithHTMLHexExpression16:code] autorelease];
}

+ (UIColor *)colorWithHTMLHexExpression32:(NSString *)code {
    return [[[self alloc] initWithHTMLHexExpression32:code] autorelease];
}

+ (UIColor *)colorWithHTMLHexExpression16a:(NSString *)code {
    return [[[self alloc] initWithHTMLHexExpression16a:code] autorelease];
}

+ (UIColor *)colorWithHTMLHexExpression32a:(NSString *)code {
    return [[[self alloc] initWithHTMLHexExpression32a:code] autorelease];
}

+ (UIColor *)colorWithHTMLExpression:(NSString *)code {
    return [[[self alloc] initWithHTMLExpression:code] autorelease];
}

+ (UIColor *)colorByHtmlColor:(NSString *)color {
    // deprecated
    return [self colorWithHTMLExpression:color];
}

@end
