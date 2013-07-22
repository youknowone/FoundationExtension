//
//  NSImage.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 23..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief [NSImage][0] category extension collections.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ApplicationKit/Classes/NSImage_Class/Reference/Reference.html
 */

#import <Cocoa/Cocoa.h>

/*!
 *  @brief [NSImage][0] shortcuts.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ApplicationKit/Classes/NSImage_Class/Reference/Reference.html
 */
@interface NSImage (Shortcuts)

/*!
 *  @brief Creates and returns an NSImage instance with the contents of the specified URL.
 *  @see [initWithContentsOfURL:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSImage_Class/Reference/Reference.html#//apple_ref/occ/instm/NSImage/initWithContentsOfURL:
 */
+ (id)imageWithContentsOfURL:(NSURL *)url;
/*!
 *  @brief Creates and returns an NSImage instance and associates it with the specified URL.
 *  @see [initByReferencingURL:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSImage_Class/Reference/Reference.html#//apple_ref/occ/instm/NSImage/initByReferencingURL:
 */
+ (id)imageByReferencingURL:(NSURL *)url;
/*!
 *  @brief Creates and returns an NSImage instance with data from the specified pasteboard.
 *  @see [initWithPasteboard:][0]
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSImage_Class/Reference/Reference.html#//apple_ref/occ/instm/NSImage/initWithPasteboard:
 */
+ (id)imageWithPasteboard:(NSPasteboard *)pasteboard;

/*!
 *  @brief PNG representation of image.
 */
@property(nonatomic, readonly) NSData *PNGRepresentation;
/*!
 *  @brief JPEG representation of image.
 */
@property(nonatomic, readonly) NSData *JPEGRepresentation;
/*!
 *  @brief JPEG representation of image using given compression factor.
 */
- (NSData *)JPEGRepresentationWithCompressionFactor:(CGFloat)compressionFactor;

@end
