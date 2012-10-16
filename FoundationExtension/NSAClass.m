//
//  NSAClass.m
//  FoundationExtension
//
//  Created by youknowone on 12. 10. 16..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import <objc/runtime.h>

#import "NSAClass.h"

@implementation NSAClass

- (id)initWithClass:(Class)class {
    self = [super init];
    if (self != nil) {
        self->_class = class;
    }
    return self;
}

+ (id)classWithClass:(Class)class {
    return [[[self alloc] initWithClass:class] autorelease];
}

- (NSString *)name {
    return [NSString stringWithUTF8String:class_getName(self->_class)];
}

@end
