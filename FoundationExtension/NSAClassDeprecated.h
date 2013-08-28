//
//  NSAClass.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 16..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief Object model for Objective-C runtime Class in [<objc/runtime.h>][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html
 *  @deprecated NSAClass is deprecated. See @ref NSObject(ObjCRuntimeClass)
 */

#import <objc/runtime.h>

@class NSAMethod;

/*!
 *  @brief Object wrapper for runtime Class
 *  @details This class supports accessing Objective-C runtime with Objective-C object model.
 *      This reduces usage of verbose C functions.
 *  @deprecated NSAClass is deprecated and merged to premitive Class. See @ref NSObject(ObjCRuntimeClass)
 */
__deprecated @interface NSAClass: NSObject {
    Class _class;
}

// avoid 'class' keyword in C++. there must be good way, NSObject.h is using.

/*!
 *  @brief Objective-C class representation.
 *  @deprecated Use plain Class
 */
#ifndef __cplusplus
@property(nonatomic, readonly) Class class __deprecated;
#else
- (Class)class __deprecated;
#endif

/*!
 *  @brief Returns a class object for a given name.
 *  @deprecated Use NSClassFromString
 */
+ (id)classWithUTF8Name:(const char *)name __deprecated;

/*!
 *  @brief Returns a class object for a given name.
 *  @deprecated Use NSClassFromString
 */
+ (id)classWithName:(NSString *)name __deprecated;

/*!
 *  @brief Initialize class object with class
 *  @deprecated Use plain Class
 */
- (id)initWithClass:(Class)aClass __deprecated;

/*!
 *  @brief Creates and returns class object with class
 *  @deprecated Use plain Class
 */
+ (id)classWithClass:(Class)aClass __deprecated;

@end

@interface NSAClass (Deprecated)

/*!
 *  @brief Returns class name in c format.
 *  @see [class_getName][1]
 *  @see name
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/class_getName
 *  @deprecated Use class.name.UTF8String
 */
@property(nonatomic, readonly) const char *UTF8Name __deprecated;

/*!
 *  @brief Returns class name.
 *  @see [class_getName][1]
 *  @see UTF8Name
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/class_getName
 *  @deprecated Use class.name
 */
@property(nonatomic, readonly) NSString *name __deprecated;

/*!
 *  @brief Superclass
 *  @deprecated Built-in.
 */
@property(nonatomic, readonly) Class superclass __deprecated;

/*!
 *  @brief Superclass object
 *  @deprecated Built-in.
 */
@property(nonatomic, readonly) NSAClass *superclassObject __deprecated;

/*!
 *  @brief Returns IMP from given method
 *  @see [class_getMethodImplementation][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/class_getMethodImplementation
 *  @deprecated See @ref NSObject(ObjCRuntimeClass)
 */
- (IMP)methodImplementationForSelector:(SEL)selector __deprecated;

/*!
 *  @brief Adds a new method to a class with a given name and implementation.
 *  @see [class_addMethod][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/class_addMethod
 *  @deprecated See @ref NSObject(ObjCRuntimeClass)
 */
- (void)addMethodForSelector:(SEL)selector implementation:(IMP)implementation types:(NSString *)implementationTypes __deprecated;

/*!
 *  @brief Allocator
 *  @see [NSObject +alloc][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSObject_Class/Reference/Reference.html#//apple_ref/occ/clm/NSObject/alloc
 *  @deprecated This is included in built-in class.
 */
- (id)alloc __deprecated;
/*!
 *  @brief Allocator
 *  @see [NSObject +allocWithZone:][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSObject_Class/Reference/Reference.html#//apple_ref/occ/clm/NSObject/allocWithZone:
 *  @deprecated This is included in built-in class.
 */
- (id)allocWithZone:(NSZone *)zone __deprecated;

@end


/*!
 *  @brief NSObject extension for NSAClass shortcut.
 *  @deprecated This category is deprecated.
 */
@interface NSObject (NSAClass)

/*!
 *  @brief Class object representation.
 *  @deprecated Use +class always.
 */
@property(nonatomic, readonly) NSAClass *classObject __deprecated;

/*!
 *  @brief Class object representation.
 *  @deprecated Use +class always.
 */
+ (NSAClass *)classObject __deprecated;

@end
