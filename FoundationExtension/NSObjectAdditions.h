//
//  NSObjectAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 12. 10. 16..
//  Copyright (c) 2012 youknowone.org All rights reserved.
//

/*!
 *  @header NSObjectAdditions.h NSObject extension
 */

@class NSAClass;

@interface NSObject (FoundationExtension)

@property(nonatomic, readonly) NSAClass *classObject;
@property(nonatomic, readonly) const char *UTF8ClassName;
@property(nonatomic, readonly) NSString *className;

/*!
 *  @brief  Invokes a method of the receiver with 3 parameter
 *  @param aSelector
 *      A selector that identifies the method to invoke. The method should take 3 argument of type id.
 *  @seealso -performSelector:withObject:
 *  @seealso -performSelector:withObject:withObject:
 *  @seealso -performSelector:withObject:withObject:withObject:withObject:
 */
- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3;
/*!
 *  @brief  Invokes a method of the receiver with 4 parameter
 *  @param aSelector
 *      A selector that identifies the method to invoke. The method should take 4 argument of type id.
 *  @seealso -performSelector:withObject:
 *  @seealso -performSelector:withObject:withObject:
 *  @seealso -performSelector:withObject:withObject:withObject:
 */
- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4;

@end
