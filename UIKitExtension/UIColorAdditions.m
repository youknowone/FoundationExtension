//
//  UIColorAdditions.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSStringAdditions.h"
#import "UIColorAdditions.h"


@implementation UIColor (UIKitExtension)

- (UIAColorComponents *)components {
    return [UIAColorComponents componentsWithColor:self];
}

- (id)initWith8bitRed:(UInt8)red green:(UInt8)green blue:(UInt8)blue alpha:(UInt8)alpha {
    return [self initWithRed:red/255.0f
                       green:green/255.0f
                        blue:blue/255.0f
                       alpha:alpha/255.0f];
}

+ (id)colorWith8bitRed:(UInt8)red green:(UInt8)green blue:(UInt8)blue alpha:(UInt8)alpha {
    return [[[self alloc] initWith8bitRed:red green:green blue:blue alpha:alpha] autorelease];
}

- (id)initWith32bitColor:(UInt32)value {
    return [self initWith8bitRed:(value >> 24) & 0xff
                           green:(value >> 16) & 0xff
                            blue:(value >>  8) & 0xff
                           alpha:(value >> 0 ) & 0xff];
}

+ (id)colorWith32bitColor:(UInt32)value {
    return [[[self alloc] initWith32bitColor:value] autorelease];
}

@end


NSDictionary *FoundationExtensionUIColorHTMLColorTable = nil;

@implementation UIColor (UIKitExtensionHTML)

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

+ (void)initialize {
    if (self == [UIColor class]) {
        FoundationExtensionUIColorHTMLColorTable =
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
}

+ (UIColor *)colorWithHTMLColorName:(NSString *)name {
    return [FoundationExtensionUIColorHTMLColorTable objectForKey:name];
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

@end


@implementation  UIAColorComponents

- (id)initWithColor:(UIColor *)color {
    self = [super init];
    if (self != nil) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        self->_components[0] = components[0];
        self->_components[1] = components[1];
        self->_components[2] = components[2];
        self->_components[3] = components[3];
    }
    return self;
}

+ (id)componentsWithColor:(UIColor *)color {
    return [[(UIAColorComponents *)[self alloc] initWithColor:color] autorelease];
}

- (CGFloat)red {
    return self->_components[0];
}

- (CGFloat)green {
    return self->_components[1];
}

- (CGFloat)blue {
    return self->_components[2];
}

- (CGFloat)alpha {
    return self->_components[3];
}

@end
