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

NS_ASSUME_NONNULL_BEGIN

@implementation NSJSONSerialization (Shortcuts)

+ (nullable id)JSONObjectWithString:(NSString *)string options:(NSJSONReadingOptions)opt error:(out NSError **)error {
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [self JSONObjectWithData:data options:opt error:error];
}

+ (nullable NSString *)stringWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(out NSError **)error {
    NSData *data = [self dataWithJSONObject:obj options:opt error:error];
    if (data == nil) {
        return nil;
    }
    return [NSString stringWithUTF8Data:data];
}

+ (nullable id)JSONObjectWithURLRequest:(NSURLRequest *)URLRequest options:(NSJSONReadingOptions)opt error:(out NSError **)error {
    NSData *data = [NSData dataWithContentsOfURLRequest:URLRequest error:error];
    if (data == nil) {
        return nil;
    }
    return [self JSONObjectWithData:data options:opt error:error];
}

+ (nullable id)JSONObjectWithURL:(NSURL *)URL options:(NSJSONReadingOptions)opt error:(out NSError **)error {
    NSData *data = [NSData dataWithContentsOfURL:URL options:0 error:error];
    if (data == nil) {
        return nil;
    }
    return [self JSONObjectWithData:data options:opt error:error];
}

@end

NS_ASSUME_NONNULL_END

#endif
