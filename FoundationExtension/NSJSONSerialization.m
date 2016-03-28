//
//  NSJSONSerialization.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 11. 4..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//


#import "NSString.h"
#import "NSURLRequestCreations.h"

#import "NSJSONSerialization.h"

#if __MAC_OS_X_VERSION_MAX_ALLOWED >= 1070 || __IPHONE_OS_VERSION_MAX_ALLOWED >= 50000

@implementation NSJSONSerialization (Shortcuts)

+ (id)JSONObjectWithString:(NSString *)string options:(NSJSONReadingOptions)opt error:(NSError **)error {
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [self JSONObjectWithData:data options:opt error:error];
}

+ (NSString *)stringWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError **)error {
    return [NSString stringWithUTF8Data:[self dataWithJSONObject:obj options:opt error:error]];
}

+ (id)JSONObjectWithURLRequest:(NSURLRequest *)URLRequest options:(NSJSONReadingOptions)opt error:(NSError **)error {
    NSData *data = [NSData dataWithContentsOfURLRequest:URLRequest error:error];
    if (data == nil) {
        return nil;
    }
    return [self JSONObjectWithData:data options:opt error:error];
}

+ (id)JSONObjectWithURL:(NSURL *)URL options:(NSJSONReadingOptions)opt error:(NSError **)error {
    NSData *data = [NSData dataWithContentsOfURL:URL options:0 error:error];
    if (data == nil) {
        return nil;
    }
    return [self JSONObjectWithData:data options:opt error:error];
}

@end

#endif
