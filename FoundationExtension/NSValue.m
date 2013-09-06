//
//  NSValue.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 6. 15..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "NSValue.h"

@implementation NSObject (NSValue)

- (NSValue *)fe_value {
    return [NSValue valueWithNonretainedObject:self];
}

@end
