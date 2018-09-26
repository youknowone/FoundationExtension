//
//  NSURL.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

#define PATH_DEBUG FALSE

#import "NSBundle.h"
#import "NSPathUtilities.h"
#import "NSCharacterSet.h"
#import "NSString.h"
#import "NSURL.h"

#include "debug.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSURL (Creations)

- (instancetype)initResourceURLWithPath:(NSString *)path {
    if (path == nil) {
        return nil;
    }
    NSString *prefix = @"res://";
    if ([path hasPrefix:prefix]) {
        path = [path substringFromIndex:prefix.length];
    }
    NSString *resPath = [[NSBundle mainBundle] pathForResourceFile:path];
    if (resPath == nil) {
        resPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:path]; // iPhoneOS3 support
    }
    dlog(PATH_DEBUG, @"abstract resource path: %@", resPath);
    return [self initFileURLWithPath:resPath];
}

- (instancetype)initConfigurationURLWithPath:(NSString *)path {
    if (path == nil) {
        return nil;
    }
    NSString *prefix = @"conf://";
    if ([path hasPrefix:prefix]) {
        path = [path substringFromIndex:prefix.length];
    }
    NSString *confPath = NSPathForUserConfigurationFile(path);
    dlog(PATH_DEBUG, @"abstract configuration path: %@", confPath);
    return [self initFileURLWithPath:confPath];
}

- (instancetype)initTemporaryURLWithPath:(NSString *)path {
    if (path == nil) {
        return nil;
    }
    NSString *prefix = @"tmp://";
    if ([path hasPrefix:prefix]) {
        path = [path substringFromIndex:prefix.length];
    }
    NSString *tempPath = NSPathForTemporaryFile(path);
    dlog(PATH_DEBUG, @"abstract temporary path: %@", tempPath);
    return [self initFileURLWithPath:tempPath];
}

- (instancetype)initSmartURLWithPath:(NSString *)path {
    if ([path hasHTTPPrefix]) {
        return [self initWithString:path];
    }
    if ([path hasPrefix:@"res://"]) {
        return [self initResourceURLWithPath:path];
    }
    if ([path hasPrefix:@"conf://"]) {
        return [self initConfigurationURLWithPath:path];
    }
    if ([path hasPrefix:@"tmp://"]) {
        return [self initConfigurationURLWithPath:path];
    }
    return [self initFileURLWithPath:path];
}

+ (instancetype)resourceURLWithPath:(NSString *)path {
    return [[self alloc] initResourceURLWithPath:path];
}

+ (instancetype)configurationURLWithPath:(NSString *)path {
    return [[self alloc] initConfigurationURLWithPath:path];
}

+ (instancetype)temporaryURLWithPath:(NSString *)path {
    return [[self alloc] initTemporaryURLWithPath:path];
}

+ (instancetype)smartURLWithPath:(NSString *)path {
    return [[self alloc] initSmartURLWithPath:path];
}

@end

@implementation NSURL (CFURL)

- (BOOL)hasDirectoryPath {
    return CFURLHasDirectoryPath((CFURLRef)self);
}

@end


@implementation NSString (NSURL)

- (NSString *)stringByAddingPercentEncodingWithoutAllowedCharacters {
    NSCharacterSet *characterSet = [NSCharacterSet emptyCharacterSet];
    return [self stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
}

- (NSString *)stringByAddingPercentEncodingForURLQuery {
    NSCharacterSet *characterSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    return [self stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
}

- (BOOL)hasHTTPPrefix {
    NSString *regexkey = @"^https?://.*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexkey];
    return [predicate evaluateWithObject:self];
}

- (BOOL)hasSmartURLPrefix {
    return [self hasHTTPPrefix] || [self hasPrefix:@"res://"] || [self hasPrefix:@"conf://"];
}

- (nullable NSString *)URLProtocol {
    NSString *regexkey = @"^[a-zA-Z]*://.*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexkey];
    if (![predicate evaluateWithObject:self])
        return nil;
    NSRange delemeterRange = [self rangeOfString:@"://"];
    return [self substringFromIndex:0 length:delemeterRange.location];
}

- (nullable NSURL *)URL {
    return [NSURL URLWithString:self];
}

- (nullable NSURL *)fileURL {
    return [NSURL fileURLWithPath:self];
}

- (nullable NSURL *)resourceURL {
    return [NSURL resourceURLWithPath:self];
}

- (nullable NSURL *)configurationURL {
    return [NSURL configurationURLWithPath:self];
}

- (nullable NSURL *)temporaryURL {
    return [NSURL temporaryURLWithPath:self];
}

- (nullable NSURL *)smartURL {
    return [NSURL smartURLWithPath:self];
}

@end

NS_ASSUME_NONNULL_END
