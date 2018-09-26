//
//  NSBundle.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSBundle.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSBundle (Shortcuts)

- (NSString *)pathForResourceFile:(NSString *)filename {
    return [self pathForResource:filename ofType:@""];
}

@end

NS_ASSUME_NONNULL_END
