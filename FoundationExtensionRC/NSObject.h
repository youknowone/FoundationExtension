//
//  NSObjectRC.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 2016. 3. 20..
//  Copyright © 2016년 youknowone.org. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (AntiARC)

- (instancetype)_retain;
- (oneway void)_release;
- (instancetype)_autorelease;

@end


/*!
 *  @brief NSObject [<objc/runtime.h>][0] extensions without ARC
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html
 */
@interface NSObject (ObjCRuntimeRC)

/*!
 *  @brief Obtains the value of an instance variable of a class instance.
 *  @param name The name of the instance variable definition to obtain.
 *  @see [object_getInstanceVariable][1]
 *  @see getVariable:forName:
 *  @see setVariable:forName:
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/object_getInstanceVariable
 */
- (id)variableForName:(NSString *)name;


/*!
 *  @brief Implement property getter for an instance variable.
 *  @param methodName The name of property getter.
 *  @param nameString A C String to represent the name of instance variable.
 *  @see variableForName:
 */
#define NSAPropertyGetter(methodName, nameString) - (id)methodName { return [self variableForName:nameString]; }

/*!
 *  @brief Obtains the value of an instance variable of a class instance.
 *  @param outValue On return, contains a pointer to the value of the instance variable.
 *  @param name The name of the instance variable definition to obtain.
 *  @see variableForName:
 *  @see setVariable:forName:
 *  @see [object_getInstanceVariable][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/object_getInstanceVariable
 */
- (void)getVariable:(void **)outValue forName:(NSString *)name;

/*!
 *  @brief Implement property getter for an instance variable.
 *  @param methodName The name of property getter.
 *  @param name A string. Pass the name of the instance variable whose value you wish to modify.
 *  @param type The type of of instance variable.
 *  @see getVariable:forName:
 */
#define NSAPropertyGetterForType(methodName, nameString, type) - (type)methodName { type outValue;  [self getVariable:(void **)&outValue forName:nameString]; return outValue; }

/*!
 *  @brief Changes the value of an instance variable of a class instance.
 *  @param value The new value for the instance variable.
 *  @param name A string. Pass the name of the instance variable whose value you wish to modify.
 *  @see variableForName:
 *  @see getVariable:forName:
 *  @see [object_setInstanceVariable][1]
 *      [1]: [https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/object_setInstanceVariable]
 */
- (void)setVariable:(void *)value forName:(NSString *)name;

/*!
 *  @brief Changes the value of an instance variable of a class instance and ratain the value.
 *  @param value The new value for the instance variable.
 *  @param name A string. Pass the name of the instance variable whose value you wish to modify.
 *  @see setVariable:forName:
 *  @see [object_setInstanceVariable][1]
 *      [1]: [https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/object_setInstanceVariable]
 */
- (void)setAndRetainVariable:(id)value forName:(NSString *)name;
/*!
 *  @brief Changes the value of an instance variable of a class instance with a copied value of given value.
 *  @param value The new value for the instance variable.
 *  @param name A string. Pass the name of the instance variable whose value you wish to modify.
 *  @see setVariable:forName:
 *  @see [object_setInstanceVariable][1]
 *      [1]: [https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/object_setInstanceVariable]
 */
- (void)setAndCopyVariable:(id)value forName:(NSString *)name;

/*!
 *  @brief Implement property assign setter for an instance variable.
 *  @param methodName The name of property getter.
 *  @param nameString A C String to represent the name of instance variable.
 *  @see setVariable:forName:
 */
#define NSAPropertyAssignSetter(METHOD, PROPERTY) \
- (void)METHOD:(id)value { [self setVariable:(__bridge void *)value forName:PROPERTY]; }

/*!
 *  @brief Implement property retain setter for an instance variable.
 *  @param methodName The name of property getter.
 *  @param nameString A C String to represent the name of instance variable.
 *  @see setVariable:forName:
 */
#define NSAPropertyRetainSetter(METHOD, PROPERTY) \
- (void)METHOD:(id)value { [self setAndRetainVariable:value forName:PROPERTY]; }

/*!
 *  @brief Implement property copy setter for an instance variable.
 *  @param methodName The name of property getter.
 *  @param nameString A C String to represent the name of instance variable.
 *  @see setVariable:forName:
 */
#define NSAPropertyCopySetter(METHOD, PROPERTY) \
- (void)METHOD:(__weak id)value { [self setAndCopyVariable:value forName:PROPERTY]; }


@end
