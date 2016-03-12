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


/*!
 *  @brief [NSDrawNinePartImage][0] convinient methods.
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Miscellaneous/AppKit_Functions/#//apple_ref/c/func/NSDrawNinePartImage
 */
@interface NSImage (NSDrawNinePartImage)

/*!
 *  @brief Draws nine part image with given cap insets.
 *  @see [NSDrawNinePartImage][0] for the implementation and [UIImage resizableImageWithCapInsets:][1] for the cap insets.
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Miscellaneous/AppKit_Functions/#//apple_ref/c/func/NSDrawNinePartImage
 *      [1]: https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UIImage_Class/#//apple_ref/occ/instm/UIImage/resizableImageWithCapInsets:
 */
- (void)drawNinePartImageInRect:(NSRect)toRect capInsets:(NSEdgeInsets)capInsets;
/*!
 *  @brief Creates and returns nine part image with given cap insets.
 *  @see [NSDrawNinePartImage][0] for the implementation and [UIImage resizableImageWithCapInsets:][1] for the cap insets.
 *      [0]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Miscellaneous/AppKit_Functions/#//apple_ref/c/func/NSDrawNinePartImage
 *      [1]: https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UIImage_Class/#//apple_ref/occ/instm/UIImage/resizableImageWithCapInsets:
 */
- (NSImage*)ninePartImageWithSize:(NSSize)size capInsets:(NSEdgeInsets)capInsets;

@end


@interface CAANinePartImageLayer : CALayer

@property(nonatomic,strong) NSImage *image;
@property(nonatomic,assign) NSEdgeInsets capInsets;

- (instancetype)initWithImage:(NSImage *)image capInsets:(NSEdgeInsets)capInsets;
+ (instancetype)layerWithImage:(NSImage *)image capInsets:(NSEdgeInsets)capInsets;

@end
