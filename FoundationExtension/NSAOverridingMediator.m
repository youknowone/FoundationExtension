//
//  NSAOverridingMediator.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 5. 12..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "NSAOverridingMediator.h"

@implementation NSAOverridingMediator

@synthesize origin=_origin;
@synthesize override=_override;
@synthesize suppressive=_suppressive;

- (instancetype)initWithOrigin:(id)origin override:(id)override suppressive:(BOOL)suppressive {
    self = [super init];
    if (self != nil) {
        self.origin = origin;
        self.override = override;
        self->_suppressive = suppressive;
    }
    return self;
}


+ (instancetype)mediatorWithOrigin:(id)origin override:(id)override {
    return [self mediatorWithOrigin:origin override:override suppressive:NO];
}

+ (instancetype)mediatorWithOrigin:(id)origin override:(id)override suppressive:(BOOL)suppressive {
    return [[self alloc] initWithOrigin:origin override:override suppressive:suppressive];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    BOOL originResponds = [self.origin respondsToSelector:aSelector];
    BOOL overrideResponds = [self.override respondsToSelector:aSelector];
    return originResponds || overrideResponds;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    id origin = self.origin;
    id override = self.override;
    BOOL suppressive = self.suppressive;

    if ([override respondsToSelector:aSelector]) {
        if (suppressive && [origin respondsToSelector:aSelector]) {
            return origin;
        }
        return override;
    }
    if ([origin respondsToSelector:aSelector]) {
        return origin;
    }
    return override;
}

@end
