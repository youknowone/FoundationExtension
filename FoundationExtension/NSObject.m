//
//  NSObject.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 16..
//  Copyright (c) 2012 youknowone.org All rights reserved.
//

#import <objc/runtime.h>

#import "NSObject.h"

@interface NSAMethod ()

- (id)initWithMethod:(Method)method;
+ (id)methodWithMethod:(Method)method;

@end


@implementation NSObject (ObjCRuntime)

- (NSString *)className {
    return @(object_getClassName(self));
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


@implementation NSObject (ObjCRuntimeClass)

+ (NSString *)name {
    return @(class_getName(self));
}

+ (NSString *)className {
    return [self name];
}

+ (Method)methodValueForSelector:(SEL)selector {
    return class_getInstanceMethod(self, selector);
}

+ (NSAMethod *)methodForSelector:(SEL)selector {
    return [NSAMethod methodWithMethod:class_getInstanceMethod(self, selector)];
}

+ (Method)classMethodValueForSelector:(SEL)selector {
    return class_getClassMethod(self, selector);
}

+ (NSAMethod *)classMethodForSelector:(SEL)selector {
    return [NSAMethod methodWithMethod:class_getClassMethod(self, selector)];
}

+ (IMP)methodImplementationForSelector:(SEL)selector {
    return class_getMethodImplementation(self, selector);
}

+ (void)addMethodForSelector:(SEL)selector fromMethod:(NSAMethod *)method {
    [self addMethodForSelector:selector implementation:method.implementation types:method.typeEncoding];
}

+ (void)addMethodForSelector:(SEL)selector implementation:(IMP)implementation types:(NSString *)implementationTypes {
    class_addMethod(self, selector, implementation, implementationTypes.UTF8String);
}

@end


@implementation NSAMethod
@synthesize method=_method;

- (id)initWithMethod:(Method)method {
    if (method == nil) {
        [self release];
        return nil;
    }
    self = [super init];
    if (self != nil) {
        self->_method = method;
    }
    return self;
}

+ (id)methodWithMethod:(Method)method {
    return [[[self alloc] initWithMethod:method] autorelease];
}

- (IMP)implementation {
    return method_getImplementation(self->_method);
}

- (void)setImplementation:(IMP)implementation {
    method_setImplementation(self->_method, implementation);
}

- (NSString *)typeEncoding {
    return @(method_getTypeEncoding(self->_method));
}

- (void)exchangeImplementationWith:(NSAMethod *)method {
    method_exchangeImplementations(self.method, method.method);
}

@end
