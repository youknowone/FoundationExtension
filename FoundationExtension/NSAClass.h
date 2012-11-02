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
 */

#import <objc/runtime.h>

@class NSAMethod;

/*!
 *  @brief Object wrapper for runtime Class
 *  @details This class supports accessing Objective-C runtime with Objective-C object model.
 *      This reduces usage of verbose C functions.
 */
@interface NSAClass: NSObject {
    Class _class;
}

// avoid 'class' keyword in C++. there must be good way, NSObject.h is using.
#ifndef __cplusplus

/*!
 *  @brief Objective-C class representation.
 */
@property(nonatomic, readonly) Class class;

#endif

/*!
 *  @brief Returns class name in c format.
 *  @see [class_getName][1]
 *  @see name
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/class_getName
 */
@property(nonatomic, readonly) const char *UTF8Name;
/*!
 *  @brief Returns class name.
 *  @see [class_getName][1]
 *  @see UTF8Name
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/class_getName
 */
@property(nonatomic, readonly) NSString *name;

/*!
 *  @brief Superclass
 */
@property(nonatomic, readonly) Class superclass;
/*!
 *  @brief Superclass object
 */
@property(nonatomic, readonly) NSAClass *superclassObject;

/*!
 *  @brief Initialize class object with class
 */
- (id)initWithClass:(Class)aClass;
/*!
 *  @brief Creates and returns class object with class
 */
+ (id)classWithClass:(Class)aClass;

/*!
 *  @brief Returns a class object for a given name.
 */
+ (id)classWithUTF8Name:(const char *)name;
/*!
 *  @brief Returns a class object for a given name.
 */
+ (id)classWithName:(NSString *)name;

/*!
 *  @brief Returns Method from given selector;
 *  @see [class_getInstanceMethod][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/class_getInstanceMethod
 */
- (Method)methodForSelector:(SEL)selector;

/*!
 *  @brief Returns Method from given selector;
 *  @see [class_getInstanceMethod][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/class_getInstanceMethod
 */
- (NSAMethod *)methodObjectForSelector:(SEL)selector;

/*!
 *  @brief Returns IMP from given method
 *  @see [class_getMethodImplementation][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/class_getMethodImplementation
 */
- (IMP)methodImplementationForSelector:(SEL)selector;

@end

/*!
 *  @brief Class methods shortcuts
 */
@interface NSAClass (ClassShortcuts)

/*! @name Class shortcuts */

/*!
 *  @brief Allocator
 *  @see [NSObject +alloc][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSObject_Class/Reference/Reference.html#//apple_ref/occ/clm/NSObject/alloc
 */
- (id)alloc;
/*!
 *  @brief Allocator
 *  @see [NSObject +allocWithZone:][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSObject_Class/Reference/Reference.html#//apple_ref/occ/clm/NSObject/allocWithZone:
 */
- (id)allocWithZone:(NSZone *)zone;

@end

/*!
 *  @brief NSObject extension for NSAClass shortcut.
 */
@interface NSObject (NSAClass)

/*!
 *  @brief NSObject class object representation.
 */
@property(nonatomic, readonly) NSAClass *classObject;

@end

/*!
 *  @brief Object wrapper for Method
 */
@interface NSAMethod : NSObject {
    Method _method;
}
//! @brief wrapped value
@property(nonatomic, readonly) Method method;
//! @brief mapped implementation
@property(nonatomic, assign) IMP implementation;

@end

