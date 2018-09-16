//
//  NSValue.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 6. 15..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "NSValue.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSObject (NSValue)

- (NSValue *)valueForObject {
    return [NSValue valueWithNonretainedObject:self];
}

@end

NS_ASSUME_NONNULL_END
