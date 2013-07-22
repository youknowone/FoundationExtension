//
//  NSAImageWell.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 23..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief 'Real' image well implementation.
 */

#import <Cocoa/Cocoa.h>

@protocol NSAImageWellDelegate;

/*!
 *  @brief Real image well, described as image well in Interface Builder - allow a user to drag an image to it.
 *  @see [NSImageView][0]
 *  @see [NSDraggingDestination][1]
 *      [0]: http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ApplicationKit/Classes/NSImageView_Class/Reference/Reference.html
 *      [1]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ApplicationKit/Protocols/NSDraggingDestination_Protocol/Reference/Reference.html
 */
@interface NSAImageWell: NSImageView<NSDraggingDestination> {
    id<NSAImageWellDelegate> _delegate;
    NSURL *_imageURL;
    NSMutableArray *_imageURLs, *_nonImageURLs;
    BOOL _acceptsStringDragging;
    struct {
        int delegateShouldAcceptURLString: 1;
        int delegateDidDraggingEntered: 1;
        int delegateDidDraggingExited: 1;
        int delegateWillReceiveDragging: 1;
        int delegateDidReceiveDragging: 1;
    } _imageWellFlags;
}

/*!
 *  @brief The acception state of the string dragging.
 *  @details YES if image well accepts string dragging; otherwise NO. Default is NO.
 *      If delegate response to @ref NSAImageWellDelegate::imageWellShouldAcceptURLString:, this value is ignored.
 */
@property(nonatomic, assign) BOOL acceptsStringDragging;
/*!
 *  @brief The URL of dragged image.
 */
@property(nonatomic, copy) NSURL *imageURL;
/*!
 *  @brief The image well's delegate.
 */
@property(nonatomic, retain) IBOutlet id<NSAImageWellDelegate> delegate;

@end

/*!
 *  @brief This protocol defines delegate methods for NSAImageWell objects.
 */
@protocol NSAImageWellDelegate <NSObject>

@optional
/*!
 *  @brief Asks the delegate if the image well should accept URL string.
 *  @param imageWell The image well which the receiver is the delegate.
 *  @return YES if the display controller should accepts string as URL of image; otherwise NO.
 *  @details Default is NO. If YES, the image well accepts string value as URL of image. This methods override image well's acceptStringDragging value.
 */
- (BOOL)imageWellShouldAcceptURLString:(NSAImageWell *)imageWell;

/*!
 *  @brief Tells the delegate that a user dragged an image into the area of image well.
 *  @param imageWell The image well which the receiver is the delegate.
 *  @param sender The dragging info.
 *  @details Called whenever a user dragged an image into image well.
 */
- (void)imageWell:(NSAImageWell *)imageWell didDraggingEntered:(id<NSDraggingInfo>)sender;
/*!
 *  @brief Tells the delegate that a user dragged an image out of the area of image well.
 *  @param imageWell The image well which the receiver is the delegate.
 *  @param sender The dragging info.
 *  @details Called whenever a user dragged an image out of image well.
 */
- (void)imageWell:(NSAImageWell *)imageWell didDraggingExited:(id<NSDraggingInfo>)sender;
/*!
 *  @brief Tells the delegate that a user dropped an image into the area of image well.
 *  @param imageWell The image well which the receiver is the delegate.
 *  @param sender The dragging info.
 *  @details Called whenever a user dropped an image into image well.
 */
- (void)imageWell:(NSAImageWell *)imageWell willReceiveDragging:(id<NSDraggingInfo>)sender;
/*!
 *  @brief Tells the delegate that the image well loaded the dropped image.
 *  @param imageWell The image well which the receiver is the delegate.
 *  @param sender The dragging info.
 *  @details Called whenever the image well loaded the dropped image.
 */
- (void)imageWell:(NSAImageWell *)imageWell didReceiveDragging:(id<NSDraggingInfo>)sender;

@end
