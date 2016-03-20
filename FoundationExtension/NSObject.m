//
//  NSObject.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 16..
//  Copyright (c) 2012 youknowone.org All rights reserved.
//

#import <objc/runtime.h>
#import <objc/message.h>

#import "NSObject.h"

@interface NSAMethod ()

- (instancetype)initWithMethod:(Method)method;
+ (instancetype)methodWithMethod:(Method)method;

@end


@implementation NSObject (ObjCRuntime)

- (NSString *)className {
    return @(object_getClassName(self));
}

- (id)performSelector:(SEL)sel withObject:(id)obj1 withObject:(id)obj2 withObject:(id)obj3 {
    if (!sel) [self doesNotRecognizeSelector:sel];
    return ((id(*)(id, SEL, id, id, id))objc_msgSend)(self, sel, obj1, obj2, obj3);
}

- (id)performSelector:(SEL)sel withObject:(id)obj1 withObject:(id)obj2 withObject:(id)obj3 withObject:(id)obj4 {
    if (!sel) [self doesNotRecognizeSelector:sel];
    return ((id(*)(id, SEL, id, id, id, id))objc_msgSend)(self, sel, obj1, obj2, obj3, obj4);
}

- (id)associatedObjectForKey:(void *)key {
    return objc_getAssociatedObject(self, key);
}

- (void)setAssociatedObject:(id)object forKey:(void *)key {
    [self setAssociatedObject:object forKey:key policy:OBJC_ASSOCIATION_RETAIN];
}

- (void)setAssociatedObject:(id)object forKey:(void *)key policy:(objc_AssociationPolicy)policy {
    objc_setAssociatedObject(self, key, object, policy);
}

- (void)removeAssociatedObjectForKey:(void *)key {
    [self removeAssociatedObjectForKey:key policy:OBJC_ASSOCIATION_RETAIN];
}

- (void)removeAssociatedObjectForKey:(void *)key policy:(objc_AssociationPolicy)policy {
    [self setAssociatedObject:nil forKey:key policy:policy];
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

+ (NSAMethod *)methodObjectForSelector:(SEL)selector {
    return [NSAMethod methodWithMethod:class_getInstanceMethod(self, selector)];
}

+ (Method)classMethodValueForSelector:(SEL)selector {
    return class_getClassMethod(self, selector);
}

+ (NSAMethod *)classMethodObjectForSelector:(SEL)selector {
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

+ (void)addClassMethodForSelector:(SEL)selector fromMethod:(NSAMethod *)method {
    [self addClassMethodForSelector:selector implementation:method.implementation types:method.typeEncoding];
}

+ (void)addClassMethodForSelector:(SEL)selector implementation:(IMP)implementation types:(NSString *)implementationTypes {
    Class class = object_getClass(self.class);
    class_addMethod(class, selector, implementation, implementationTypes.UTF8String);
}

@end


@implementation NSAMethod
@synthesize method=_method;

- (instancetype)initWithMethod:(Method)method {
    if (method == nil) {
        return nil;
    }
    self = [super init];
    if (self != nil) {
        self->_method = method;
    }
    return self;
}

+ (instancetype)methodWithMethod:(Method)method {
    return [[self alloc] initWithMethod:method];
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

#pragma mark NSObject protocols

- (NSUInteger)hash {
    return (NSUInteger)self.method;
}

- (BOOL)isEqualToMethod:(NSAMethod *)object {
    return self.hash == object.hash;
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[NSAMethod class]]) {
        return [self isEqualToMethod:object];
    }
    return NO;
}

@end
