//
//  NSObject.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 16..
//  Copyright (c) 2012 youknowone.org All rights reserved.
//

#import <objc/runtime.h>

#import "NSObject.h"

@implementation NSObject (ObjCRuntime)

- (NSString *)className {
    return @(object_getClassName(self));
}

+ (NSString *)className {
    return @(class_getName(self));
}

- (id)variableForName:(NSString *)name {
    void *value;
    object_getInstanceVariable(self, name.UTF8String, &value);
    return value;
}

- (void)getVariable:(void **)outValue forName:(NSString *)name {
    object_getInstanceVariable(self, name.UTF8String, outValue);
}

- (void)setVariable:(void *)value forName:(NSString *)name {
    object_setInstanceVariable(self, name.UTF8String, value);
}


- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 {
    IMP msg;
    msg = class_getMethodImplementation(self.class, aSelector);
    if (msg == 0) {
        return nil;
    }
    return (*msg)(self, aSelector, object1, object2, object3);
}

- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 {
    IMP msg;
    msg = class_getMethodImplementation(self.class, aSelector);
    if (msg == 0) {
        return nil;
    }
    return (*msg)(self, aSelector, object1, object2, object3, object4);
}

@end
