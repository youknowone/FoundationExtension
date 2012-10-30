//
//  NSObjectAdditions.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 16..
//  Copyright (c) 2012 youknowone.org All rights reserved.
//

/*!
 *  @brief NSObject extensions
 */

@interface NSObject (FE_ObjCRuntime)

/*!
 *  @brief Return class name of object
 */
@property(nonatomic, readonly) NSString *className;

/*!
 *  @brief Return class name of class
 */
+ (NSString *)className;

/*!
 *  @brief Invokes a method of the receiver with 3 parameter
 *  @param aSelector
 *      A selector that identifies the method to invoke. The method should take 3 argument of type id.
 *  @param object1 a parameter
 *  @param object2 a parameter
 *  @param object3 a parameter
 *  @see performSelector:withObject:
 *  @see performSelector:withObject:withObject:
 *  @see performSelector:withObject:withObject:withObject:withObject:
 */
- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3;
/*!
 *  @brief Invokes a method of the receiver with 4 parameter
 *  @param aSelector
 *      A selector that identifies the method to invoke. The method should take 4 argument of type id.
 *  @param object1 a parameter
 *  @param object2 a parameter
 *  @param object3 a parameter
 *  @param object4 a parameter
 *  @see performSelector:withObject:
 *  @see performSelector:withObject:withObject:
 *  @see performSelector:withObject:withObject:withObject:
 */
- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4;

@end
