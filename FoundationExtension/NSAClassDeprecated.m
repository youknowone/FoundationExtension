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

- (instancetype)initWithMethod:(Method)method;
+ (instancetype)methodWithMethod:(Method)method;

@end


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
@implementation NSAClass
#pragma clang diagnostic pop

@synthesize class=_class;

- (id)initWithClass:(Class)class {
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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
@implementation NSObject (NSAClass)
#pragma clang diagnostic pop

- (NSAClass *)classObject {
    return [NSAClass classWithClass:self.class];
}

+ (NSAClass *)classObject {
    return [NSAClass classWithClass:self];
}

@end

