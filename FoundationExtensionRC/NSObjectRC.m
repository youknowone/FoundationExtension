//
//  NSObjectRC.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 2016. 3. 20..
//  Copyright © 2016년 youknowone.org. All rights reserved.
//

@import ObjectiveC.runtime;
@import ObjectiveC.message;

#import "NSObjectRC.h"


@implementation NSObject (ObjCRuntimeRC)

- (id)variableForName:(NSString *)name {
    Ivar ivar = class_getInstanceVariable([self class], name.UTF8String);
    id value = object_getIvar(self, ivar);
    return value;
}

#if !__has_feature(objc_arc)
- (void)getVariable:(void **)outValue forName:(NSString *)name {
    object_getInstanceVariable(self, name.UTF8String, outValue);
}
#endif

#if !__has_feature(objc_arc)
- (void)setVariable:(void *)value forName:(NSString *)name {
    object_setInstanceVariable(self, name.UTF8String, value);
}
#endif

#if !__has_feature(objc_arc)
- (void)setAndRetainVariable:(id)value forName:(NSString *)name {
    [value retain];
    id stored = [self variableForName:name];
    [stored release];
    [self setVariable:value forName:name];
}
#endif

#if !__has_feature(objc_arc)
- (void)setAndCopyVariable:(id)value forName:(NSString *)name {
    id copy = [value copy];
    id stored = [self variableForName:name];
    [stored release];
    [self setVariable:copy forName:name];
}
#endif

@end
