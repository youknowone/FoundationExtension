//
//  NSAClass.h
//  FoundationExtension
//
//  Created by youknowone on 12. 10. 16..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAClass: NSObject {
    Class _class;
}

@property(nonatomic, readonly) Class class;

- (id)initWithClass:(Class)class;
+ (id)classWithClass:(Class)class;

- (NSString *)name;

@end
