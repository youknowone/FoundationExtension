//
//  NSGeometry.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 5..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *  @file
 *  @brief Human friendly [NSGeometry][0] symbols and macros.
 *      [0]: http://developer.apple.com/library/Mac/#documentation/Cocoa/Reference/Foundation/Miscellaneous/Foundation_DataTypes/Reference/reference.html
 */

/*!
 *  @brief An NSPoint structure with both x and y coordinates set to 0
 *  @see [NSZeroPoint][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Miscellaneous/Foundation_Constants/Reference/reference.html#//apple_ref/c/data/NSZeroPoint
 */
#define NSPointZero NSZeroPoint

/*!
 *  @brief An NSSize structure set to 0 in both dimensions.
 *  @see [NSZeroPoint][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Miscellaneous/Foundation_Constants/Reference/reference.html#//apple_ref/c/data/NSZeroSize
 */
#define NSSizeZero NSZeroSize

/*!
 *  @brief An NSRect structure set to 0 in width and height.
 *  @see [NSZeroPoint][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Miscellaneous/Foundation_Constants/Reference/reference.html#//apple_ref/c/data/NSZeroRect
 */
#define NSRectZero NSZeroRect


/*!
 *  @name Creations
 */

/*!
 *  @brief Creates a new NSPoint from the specified values.
 *  @see [NSMakePoint][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/cocoa/reference/foundation/miscellaneous/foundation_functions/reference/reference.html#//apple_ref/c/func/NSMakePoint
 */
NS_INLINE NSPoint NSPointMake(CGFloat x, CGFloat y) {
    return NSMakePoint(x, y);
}

/*!
 *  @brief Creates a new NSSize from the specified values.
 *  @see [NSMakeSize][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/cocoa/reference/foundation/miscellaneous/foundation_functions/reference/reference.html#//apple_ref/c/func/NSMakeSize
 */
NS_INLINE NSSize NSSizeMake(CGFloat w, CGFloat h) {
    return NSMakeSize(w, h);
}

/*!
 *  @brief Creates a new NSRect from the specified values.
 *  @see [NSMakeRect][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/cocoa/reference/foundation/miscellaneous/foundation_functions/reference/reference.html#//apple_ref/c/func/NSMakeRect
 */
NS_INLINE NSRect NSRectMake(CGFloat x, CGFloat y, CGFloat w, CGFloat h) {
    return NSMakeRect(x, y, w, h);
}

/*!
 *  @name Equalities
 */

/*!
 *  @brief Returns a Boolean value that indicates whether two points are equal.
 *  @see [NSEqualPoints][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/cocoa/reference/foundation/miscellaneous/foundation_functions/reference/reference.html#//apple_ref/c/func/NSEqualPoints
 */
NS_INLINE BOOL NSPointEqualToPoint(NSPoint aPoint, NSPoint bPoint) {
    return NSEqualPoints(aPoint, bPoint);
}

/*!
 *  @brief Returns a Boolean value that indicates whether two size values are equal.
 *  @see [NSEqualSizes][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/cocoa/reference/foundation/miscellaneous/foundation_functions/reference/reference.html#//apple_ref/c/func/NSEqualSizes
 */
NS_INLINE BOOL NSSizeEqualToSize(NSSize aSize, NSSize bSize) {
    return NSEqualSizes(aSize, bSize);
}

/*!
 *  @brief Returns a Boolean value that indicates whether the two rectangles are equal.
 *  @see [NSEqualRects][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/cocoa/reference/foundation/miscellaneous/foundation_functions/reference/reference.html#//apple_ref/c/func/NSEqualRects
 */
NS_INLINE BOOL NSRectEqualToRect(NSRect aRect, NSRect bRect) {
    return NSEqualRects(aRect, bRect);
}

/*!
 *  @brief Returns a Boolean value that indicates whether a given rectangle is empty.
 *  @see [NSIsEmptyRect][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/cocoa/reference/foundation/miscellaneous/foundation_functions/reference/reference.html#//apple_ref/c/func/NSIsEmptyRect
 */
NS_INLINE BOOL NSRectIsEmpty(NSRect aRect) {
    return NSIsEmptyRect(aRect);
}
