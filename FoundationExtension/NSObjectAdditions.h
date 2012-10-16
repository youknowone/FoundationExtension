//
//  NSObjectAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 12. 10. 16..
//  Copyright (c) 2012 youknowone.org All rights reserved.
//

@class NSAClass;

@interface NSObject (FoundationExtension)

@property(nonatomic, readonly) NSAClass *classObject;
@property(nonatomic, readonly) const char *UTF8ClassName;
@property(nonatomic, readonly) NSString *className;

- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3;
- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4;

@end
