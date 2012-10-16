//
//  NSAClass.h
//  FoundationExtension
//
//  Created by youknowone on 12. 10. 16..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

// avoid 'class' keyword. there must be good way, NSObject.h is using.
#ifndef __cplusplus

@interface NSAClass: NSObject {
    Class _class;
}

@property(nonatomic, readonly) Class class;
@property(nonatomic, readonly) const char *UTF8Name;
@property(nonatomic, readonly) NSString *name;
@property(nonatomic, readonly) Class superclass;
@property(nonatomic, readonly) NSAClass *superclassObject;

- (id)initWithClass:(Class)class;
+ (id)classWithClass:(Class)class;

+ (id)classWithUTF8Name:(const char *)name;
+ (id)classWithName:(NSString *)name;

@end

#endif