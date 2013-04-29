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
#import "NSString.h"
#import "NSURL.h"

#include "debug.h"

@implementation NSURL (Creations)

- (id)initResourceURLWithPath:(NSString *)path {
    if (path == nil) {
        [self release];
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

- (id)initConfigurationURLWithPath:(NSString *)path {
    if (path == nil) {
        [self release];
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

- (id)initTemporaryURLWithPath:(NSString *)path {
    if (path == nil) {
        [self release];
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

- (id)initSmartURLWithPath:(NSString *)path {
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

+ (id)resourceURLWithPath:(NSString *)path {
    return [[[self alloc] initResourceURLWithPath:path] autorelease];
}

+ (id)configurationURLWithPath:(NSString *)path {
    return [[[self alloc] initConfigurationURLWithPath:path] autorelease];
}

+ (id)temporaryURLWithPath:(NSString *)path {
    return [[[self alloc] initTemporaryURLWithPath:path] autorelease];
}

+ (id)smartURLWithPath:(NSString *)path {
    return [[[self alloc] initSmartURLWithPath:path] autorelease];
}

// deprecated methods

- (id)initWithAbstractPath:(NSString *)path {
    return [self initSmartURLWithPath:path];
}

- (id)initWithAbstractFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    self = [self initWithAbstractPath:[NSString stringWithFormat:format arguments:args]];
    va_end(args);
    return self;
}

- (id)initWithFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    self = [self initWithString:[NSString stringWithFormat:format arguments:args]];
    va_end(args);
    return self;
}

- (id)initFileURLWithFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    self = [self initFileURLWithPath:[NSString stringWithFormat:format arguments:args]];
    va_end(args);
    return self;
}

+ (NSURL *)URLWithFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSURL *url = [[self alloc] initWithString:[NSString stringWithFormat:format arguments:args]];
    va_end(args);
    return [url autorelease];
}

+ (NSURL *)URLWithAbstractPath:(NSString *)path {
    return [[[self alloc] initWithAbstractPath:path] autorelease];
}

+ (NSURL *)URLWithAbstractFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSURL *url = [[self alloc] initWithAbstractPath:[NSString stringWithFormat:format arguments:args]];
    va_end(args);
    return [url autorelease];
}

+ (NSURL *)fileURLWithFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSURL *url = [[self alloc] initFileURLWithPath:[NSString stringWithFormat:format arguments:args]];
    va_end(args);
    return [url autorelease];
}

@end

@implementation NSURL (CFURL)

- (BOOL)hasDirectoryPath {
    return CFURLHasDirectoryPath((CFURLRef)self);
}

@end


@implementation NSString (NSURL)

- (BOOL)hasHTTPPrefix {
    NSString *regexkey = @"^https?://.*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexkey];
    return [predicate evaluateWithObject:self];
}

- (BOOL)hasSmartURLPrefix {
    return [self hasHTTPPrefix] || [self hasPrefix:@"res://"] || [self hasPrefix:@"conf://"];
}

- (NSString *)URLProtocol {
    NSString *regexkey = @"^[a-zA-Z]*://.*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexkey];
    if (![predicate evaluateWithObject:self])
        return nil;
    NSRange delemeterRange = [self rangeOfString:@"://"];
    return [self substringFromIndex:0 length:delemeterRange.location];
}

- (NSURL *)URL {
    return [NSURL URLWithString:self];
}

- (NSURL *)fileURL {
    return [NSURL fileURLWithPath:self];
}

- (NSURL *)resourceURL {
    return [NSURL resourceURLWithPath:self];
}

- (NSURL *)configurationURL {
    return [NSURL configurationURLWithPath:self];
}

- (NSURL *)temporaryURL {
    return [NSURL temporaryURLWithPath:self];
}

- (NSURL *)smartURL {
    return [NSURL smartURLWithPath:self];
}

// deprecated methods

- (NSString *)pathProtocol {
    return [self URLProtocol];
}

- (BOOL)hasURLPrefix {
    return [self hasHTTPPrefix];
}

- (NSURL *)abstractURL {
    return [self smartURL];
}

@end

@implementation NSData (NSURL_deprecated)

- (id)initWithContentsOfAbstractPath:(NSString *)path {
    return [self initWithContentsOfURL:[NSURL URLWithAbstractPath:path]];
}

+ (NSData *)dataWithContentsOfAbstractPath:(NSString *)path {
    return [[[self alloc] initWithContentsOfURL:[NSURL URLWithAbstractPath:path]] autorelease];
}

- (id)initWithContentsOfAbstractPath:(NSString *)path options:(NSDataReadingOptions)opt error:(NSError **)error {
    return [self initWithContentsOfURL:[NSURL URLWithAbstractPath:path] options:opt error:error];
}

+ (NSData *)dataWithContentsOfAbstractPath:(NSString *)path options:(NSDataReadingOptions)opt error:(NSError **)error {
    return [[[self alloc] initWithContentsOfURL:[NSURL URLWithAbstractPath:path] options:opt error:error] autorelease];
}

@end
