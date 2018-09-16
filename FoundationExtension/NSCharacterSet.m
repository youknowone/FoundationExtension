//
//  NSCharacterSet.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 2014. 10. 8..
//  Copyright (c) 2014 youknowone.org. All rights reserved.
//

#import "NSCharacterSet.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSCharacterSet (Shortcut)

+ (instancetype)emptyCharacterSet {
    static NSCharacterSet *characterSet = nil;
    if (characterSet == nil) {
        characterSet = [[NSCharacterSet alloc] init];
    }
    return characterSet;
}

@end

NS_ASSUME_NONNULL_END
