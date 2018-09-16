//
//  NSNull.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 9..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "NSNull.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSNull (Tools)

+ (BOOL)objectIsNull:(id _Nullable)obj {
    return obj == [NSNull null];
}

+ (BOOL)objectIsNilOrNull:(id _Nullable)obj {
    return obj == nil || obj == [NSNull null];
}

+ (id)nullIfObjectIsNil:(id _Nullable)obj {
    if (obj == nil) {
        return [NSNull null];
    }
    return obj;
}

+ (id)nilIfObjectIsNull:(id _Nullable)obj {
    if (obj == [NSNull null]) {
        return nil;
    }
    return obj;
}

@end

NS_ASSUME_NONNULL_END
