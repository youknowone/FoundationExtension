//
//  NSString.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSString.h"

@implementation NSString (Creations)

- (instancetype)initWithInteger:(NSInteger)value {
    #ifdef __LP64__
        #define __NSINTEGER_FORMAT @"%ld"
    #else
        #define __NSINTEGER_FORMAT @"%d"
    #endif
    return [self initWithFormat:__NSINTEGER_FORMAT, value];
    #undef __NSINTEGER_FORMAT
}

+ (instancetype)stringWithInteger:(NSInteger)value {
    return [[self alloc] initWithInteger:value];
}

+ (nullable instancetype)stringWithData:(NSData *)data encoding:(NSStringEncoding)encoding {
    return [[self alloc] initWithData:data encoding:encoding];
}

- (instancetype)initWithConcatnatingStrings:(NSString *)first, ... {
    NSMutableArray *array = [NSMutableArray array];
    va_list args;
    va_start(args, first);
    for (NSString *component = first; component != nil; component = va_arg(args, NSString *)) {
        [array addObject:component];
    }
    va_end(args);
    // OMG... what's the best?
    return [self initWithString:[array componentsJoinedByString:@""]];
}

+ (instancetype)stringWithConcatnatingStrings:(NSString *)first, ... {
    NSMutableArray *array = [NSMutableArray array];
    va_list args;
    va_start(args, first);
    for (NSString *component = first; component != nil; component = va_arg(args, NSString *)) {
        [array addObject:component];
    }
    va_end(args);
    return [array componentsJoinedByString:@""];
}

+ (instancetype)stringWithFormat:(NSString *)format arguments:(va_list)argList {
    NSString *string = [[NSString alloc] initWithFormat:format arguments:argList];
    return string;
}

@end


@implementation NSString (Shortcuts)

// slow! proof of concept
- (NSString *)format:(id)first, ... {
    NSUInteger len = self.length;
    NSUInteger index = 0;
    BOOL passed = NO;
    do {
        unichar chr = [self characterAtIndex:index];
        if (chr == '%') {
            if (passed) {
                if ([self characterAtIndex:index - 1] == '%') {
                    passed = NO;
                } else {
                    break;
                }
            } else {
                passed = YES;
            }
        }
        index += 1;
    } while (index < len);

    if (index == len) {
        return [NSString stringWithFormat:self, first];
    } else {
        va_list args;
        va_start(args, first);
        id result = [[NSString stringWithFormat:[self substringToIndex:index], first] stringByAppendingString:[NSString stringWithFormat:[self substringFromIndex:index] arguments:args]];
        va_end(args);
        return result;
    }
}

- (NSString *)format0:(nullable id)dummy, ... {
    va_list args;
    va_start(args, dummy);
    id result = [NSString stringWithFormat:self arguments:args];
    va_end(args);
    return result;
}

- (NSRange)range {
    return NSRangeFromString(self);
}

- (NSString *)substringFromIndex:(NSUInteger)from length:(NSUInteger)length {
    return [self substringWithRange:NSMakeRange(from, length)];
}

- (NSString *)substringFromIndex:(NSUInteger)from toIndex:(NSUInteger)to {
    return [self substringWithRange:NSMakeRange(from, to - from)];
}

- (NSString *)stringByTrimmingWhitespaceCharacters {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)stringByTrimmingWhitespaceAndNewlineCharacters {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)stringByTrimmingNewlineCharacters {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
}

@end


@implementation NSString (NSUTF8StringEncoding)

+ (instancetype)stringWithUTF8Data:(NSData *)data {
    return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (nullable NSData *)dataUsingUTF8Encoding {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

@end


@implementation NSString (Evaluation)

- (NSInteger)integerValueBase:(NSInteger)radix {
    NSInteger result = 0;
    for ( NSUInteger i=0; i < [self length]; i++ ) {
        result *= radix;
        unichar digit = [self characterAtIndex:i];
        if ( '0' <= digit && digit <= '9' )
            digit -= '0';
        else if ( 'a' <= digit && digit < 'a'-10+radix )
            digit -= 'a'-10;
        else if ( 'A' <= digit && digit < 'A'-10+radix )
            digit -= 'A'-10;
        else {
            break;
        }
        result += digit;
    }
    return result;
}

- (NSInteger)hexadecimalValue {
    return [self integerValueBase:16];
}

@end


@implementation NSString (RegularExpression)

- (nullable NSString *)stringByReplacingRegularExpressionWithPattern:pattern withTemplate:(nonnull NSString *)templ error:(NSError *__nullable __autoreleasing *)error {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:error];
    if (regex == nil) {
        return nil;
    }
    return [regex stringByReplacingMatchesInString:self options:0 range:self.range withTemplate:templ];
}


@end


@implementation NSMutableString (Creations)

+ (instancetype)stringWithFormat:(NSString *)format arguments:(va_list)argList {
    id string = [[NSMutableString alloc] initWithFormat:format arguments:argList];
    return string;
}

@end


@implementation NSMutableString (Shortcuts)

- (instancetype)initWithConcatnatingStrings:(NSString *)first, ... {
    self = [self initWithString:first];
    if (self != nil) {
        va_list args;
        va_start(args, first);
        for (NSString *component = va_arg(args, NSString *); component != nil; component = va_arg(args, NSString *)) {
            [self appendString:component];
        }
        va_end(args);
    }
    return self;
}

+ (instancetype)stringWithConcatnatingStrings:(NSString *)first, ... {
    NSMutableString *aString = [self stringWithString:first];
    va_list args;
    va_start(args, first);
    for (NSString *component = va_arg(args, NSString *); component != nil; component = va_arg(args, NSString *)) {
        [aString appendString:component];
    }
    va_end(args);
    return aString;
}

@end


@implementation NSData (NSStringUTF8)

- (NSString *)stringUsingUTF8Encoding {
    return [NSString stringWithUTF8Data:self];
}

@end


@implementation NSString (Deprecation)

- (BOOL)hasSubstring:(NSString *)aString {
    return [self rangeOfString:aString].location != NSNotFound;
}

@end
