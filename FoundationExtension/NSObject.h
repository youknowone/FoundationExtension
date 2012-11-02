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
