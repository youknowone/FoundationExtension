//
//  NSObject.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 16..
//  Copyright (c) 2012 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [NSObject][0] extension category collection. Or [NSObject Protocol][1].
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSObject_Class/Reference/Reference.html
 *      [1]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html
 */

/*!
 *  @brief NSObject [<objc/runtime.h>][0] extensions
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html
 */
@interface NSObject (ObjCRuntime)

/*!
 *  @brief Class name of object.
 *  @see [object_getClassName][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/object_getClassName
 */
@property(nonatomic, readonly) NSString *className;

/*!
 *  @brief Returns name of class.
 *  @see [class_getName][1]
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html#//apple_ref/c/func/class_getName
 */
+ (NSString *)className;

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
 *  @brief Implement property assign setter for an instance variable.
 *  @param methodName The name of property getter.
 *  @param nameString A C String to represent the name of instance variable.
 *  @see setVariable:forName:
 */
#define NSAPropertyAssignSetter(methodName, nameString) - (void)methodName:(id)value { [self setVariable:value forName:nameString]; }

/*!
 *  @brief Implement property retain setter for an instance variable.
 *  @param methodName The name of property getter.
 *  @param nameString A C String to represent the name of instance variable.
 *  @see setVariable:forName:
 */
#define NSAPropertyRetainSetter(methodName, nameString) - (void)methodName:(id)value { [value retain]; [[self variableForName:nameString] release]; [self setVariable:value forName:nameString]; }

/*!
 *  @brief Implement property copy setter for an instance variable.
 *  @param methodName The name of property getter.
 *  @param nameString A C String to represent the name of instance variable.
 *  @see setVariable:forName:
 */
#define NSAPropertyCopySetter(methodName, nameString) - (void)methodName:(id)value { id copied = [value copy]; [[self variableForName:nameString] release]; [self setVariable:copied forName:nameString]; }


/*! @name performSelector */

/*!
 *  @brief Invokes a method of the receiver with 3 parameter
 *  @param aSelector A selector that identifies the method to invoke. The method should take 3 argument of type id.
 *  @param object1 a parameter
 *  @param object2 a parameter
 *  @param object3 a parameter
 *  @see [performSelector:withObject:][1]
 *  @see [performSelector:withObject:withObject:][2]
 *  @see performSelector:withObject:withObject:withObject:withObject:
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html#//apple_ref/occ/intfm/NSObject/performSelector:withObject:
 *      [2]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html#//apple_ref/occ/intfm/NSObject/performSelector:withObject:withObject:
 */
- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3;

/*!
 *  @brief Invokes a method of the receiver with 4 parameter
 *  @param aSelector A selector that identifies the method to invoke. The method should take 4 argument of type id.
 *  @param object1 a parameter
 *  @param object2 a parameter
 *  @param object3 a parameter
 *  @param object4 a parameter
 *  @see [performSelector:withObject:][1]
 *  @see [performSelector:withObject:withObject:][2]
 *  @see performSelector:withObject:withObject:withObject:
 *      [1]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html#//apple_ref/occ/intfm/NSObject/performSelector:withObject:
 *      [2]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html#//apple_ref/occ/intfm/NSObject/performSelector:withObject:withObject:
 */
- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4;

@end
