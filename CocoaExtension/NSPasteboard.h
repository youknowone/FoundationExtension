//
//  NSPasteboard.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 24..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

/*!
 *  @brief NSPasteboard shortcuts
 */
@interface NSPasteboard (Shortcuts)

/*!
 *  @brief Reads a object from the receiver object that best match the specified class.
 *  @see [readObjectsForClasses:options:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSPasteboard_Class/Reference/Reference.html#//apple_ref/occ/instm/NSPasteboard/readObjectsForClasses:options:
 */
- (id)readObjectForClass:(Class)aClass options:(NSDictionary *)options;

@end

/*!
 *  @brief NSPasteboard creation method
 */
@interface NSString (NSPasteboard)

/*
 *  @brief Reads an NSString object off of pasteboard. Returns nil if pasteboard does not contain NSString-readable data.
 */
+ (NSString *)stringFromPasteboard:(NSPasteboard *)pasteboard;

@end
