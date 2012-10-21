//
//  NSAClass.h
//  FoundationExtension
//
//  Created by youknowone on 12. 10. 16..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @headerfile NSAClass.h <objc/runtime.h> object wrapper.
 */

/*!
 *  @brief Object wrapper for <objc/runtime.h>
 */
@interface NSAClass: NSObject {
    Class _class;
}

// avoid 'class' keyword. there must be good way, NSObject.h is using.
#ifndef __cplusplus

/*!
 *  @brief Objective-C class representation.
 */
@property(nonatomic, readonly) Class class;

#endif

/*!
 *  @brief Returns class name in c format.
 *  @see class_getName
 */
@property(nonatomic, readonly) const char *UTF8Name;
/*!
 *  @brief Returns class name.
 *  @see class_getName
 *  @see -UTF8Name
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

@end


@interface NSAClass (ClassShortcuts)

/*!
 *  @brief Allocator
 *  @see NSObject +alloc
 */
- (id)alloc;
/*!
 *  @brief Allocator
 *  @see NSObject +allocWithZone:
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
