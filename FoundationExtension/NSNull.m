//
//  NSNull.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 9..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "NSNull.h"

@implementation NSNull (Tools)

+ (BOOL)objectIsNull:(id)obj {
    return obj == [NSNull null];
}

+ (BOOL)objectIsNilOrNull:(id)obj {
    return obj == nil || obj == [NSNull null];
}

+ (id)nullIfObjectIsNil:(id)obj {
    if (obj == nil) {
        return [NSNull null];
    }
    return obj;
}

+ (id)nilIfObjectIsNull:(id)obj {
    if (obj == [NSNull null]) {
        return nil;
    }
    return obj;
}

@end
