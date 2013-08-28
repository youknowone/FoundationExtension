//
//  NSAClass.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 16..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import "NSObject.h"

#import "NSAClassDeprecated.h"

@interface NSAMethod ()

- (id)initWithMethod:(Method)method;
+ (id)methodWithMethod:(Method)method;

@end


@implementation NSAClass

@synthesize class=_class;

- (id)initWithClass:(Class)class {
    [self release];
    return (id)class;
}

+ (id)classWithClass:(Class)class {
    return class;
}

+ (id)classWithUTF8Name:(const char *)name {
    return [self classWithClass:objc_getClass(name)];
}

+ (id)classWithName:(NSString *)name {
    return [self classWithUTF8Name:name.UTF8String];
}

@end


@implementation NSObject (NSAClassDeprecated)

+ (const char *)UTF8Name {
    return class_getName(self);
}

+ (id)superclassObject {
    return (id)[self superclass];
}

@end


@implementation NSObject (NSAClass)

- (NSAClass *)classObject {
    return [NSAClass classWithClass:self.class];
}

+ (NSAClass *)classObject {
    return [NSAClass classWithClass:self];
}

@end

