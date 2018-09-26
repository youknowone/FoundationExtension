//
//  NSDictionary.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 11. 1. 24..
//  Copyright 2011 youknowone.org All rights reserved.
//

#import "NSData.h"

#import "NSDictionary.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSDictionary (Shortcuts)

- (BOOL)containsKey:(id)key {
    return [self.allKeys containsObject:key];
}

- (nullable id)anyKey {
    return [self.keyEnumerator nextObject];
}

- (nullable id)anyObject {
    return [self.objectEnumerator nextObject];
}

@end


@implementation NSDictionary (NSData)

- (instancetype)initWithData:(NSData *)data {
    return [self initWithData:data format:NULL error:NULL];
}

+ (instancetype)dictionaryWithData:(NSData *)data {
    return [[self alloc] initWithData:data];
}

- (instancetype)initWithData:(NSData *)data format:(NSPropertyListFormat *_Nullable)format error:(out NSError **)error {
    NSDictionary *contents = [data propertyListObjectUsingFormat:format error:error];
    if (contents == nil) {
        return nil;
    }
    return [self initWithDictionary:contents];
}

+ (instancetype)dictionaryWithData:(NSData *)data format:(NSPropertyListFormat *_Nullable)format error:(out NSError **)error {
    return [[self alloc] initWithData:data format:format error:error];
}

@end

NS_ASSUME_NONNULL_END
