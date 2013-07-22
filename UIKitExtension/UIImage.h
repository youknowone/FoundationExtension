//
//  UIImage.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [UIImage][0] category extension collections.
 *      [0]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIImage_Class/Reference/Reference.html
 */

#import <UIKit/UIKit.h>

/*!
 *  @brief [UIImage][0] convinient creations methods.
 *      [0]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIImage_Class/Reference/Reference.html
 */
@interface UIImage (Creations)

/*!
 *  @brief Initializes a newly allocated image object initialized with the data from the location specified by URL.
 *  @param URL The URL from which to read data.
 *  @return An UIImage object initialized with the data from the location specified by URL. The returned object might be different than the original receiver.
 *  @see initWithContentsOfURL:cachePolicy:
 */
- (id)initWithContentsOfURL:(NSURL *)URL;

/*!
 *  @brief Returns an image object containing the data from the location specified by a given URL.
 *  @param URL The URL from which to read data.
 *  @return An UIImage object containing the data from the location specified by URL. The returned object might be different than the original receiver.
 *  @see imageWithContentsOfURL:cachePolicy:
 */
+ (id)imageWithContentsOfURL:(NSURL *)URL;

/*!
 *  @brief Initializes a newly allocated image object initialized with the data from the location specified by URL.
 *  @param URL The URL from which to read data.
 *  @param cachePolicy URL cache policy for the image data.
 *  @return An UIImage object initialized with the data from the location specified by URL. The returned object might be different than the original receiver.
 *  @see initWithContentsOfURL:
 */
- (id)initWithContentsOfURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy;

/*!
 *  @brief Returns an image object containing the data from the location specified by a given URL.
 *  @param URL The URL from which to read data.
 *  @param cachePolicy URL cache policy for the image data.
 *  @return An UIImage object containing the data from the location specified by URL. The returned object might be different than the original receiver.
 *  @see imageWithContentsOfURL:
 */
+ (id)imageWithContentsOfURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy;

/*!
 *  @brief Initializes a newly allocated image object initialized with the data the given URL request.
 *  @param request The URL request from which to read data.
 *  @return An UIImage object initialized with the data from the request specified by request. The returned object might be different than the original receiver.
 */
- (id)initWithContentsOfURLRequest:(NSURLRequest *)request;

/*!
 *  @brief Returns an image object containing the data from the given URL request.
 *  @param request The URL request from which to read data.
 *  @return An UIImage object containing the data from the request specified by request. The returned object might be different than the original receiver.
 */
+ (id)imageWithContentsOfURLRequest:(NSURLRequest *)request;

@end


/*!
 *  @brief [UIImage][0] [graphics][1] extension.
 *      [0]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIImage_Class/Reference/Reference.html
 *      [1]: http://developer.apple.com/library/ios/documentation/UIKit/Reference/UIKitFunctionReference/Reference/reference.html#//apple_ref/doc/uid/TP40006894-CH3-SW8
 */
@interface UIImage (UIGraphics)

/*!
 *  @brief Resized image by given size.
 *  @param size The size to resize.
 *  @return An UIImage object containing a resized image from the image.
 *  @details This method depends on CoreGraphics.
 */
- (UIImage *)imageByResizingToSize:(CGSize)size;

/*!
 *  @brief Color filled image with given color.
 *  @param color The color to fill
 *  @details This method depends on CoreGraphics.
 */
- (UIImage *)imageByFilledWithColor:(UIColor *)color;

/*!
 *  @brief Colored image by given size.
 *  @param color The color to fill.
 *  @param size The image size to create.
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/*!
 *  @brief Clear colored image.
 */
+ (UIImage *)clearImage;

/*!
 *  @brief Image drawn with bazier path.
 *  @param path The bezier path to draw.
 *  @param color The stroke color for bezier path.
 *  @param backgroundColor The fill color for bezier path.
 */
+ (UIImage *)imageWithBezierPath:(UIBezierPath *)path color:(UIColor *)color backgroundColor:(UIColor *)backgroundColor;

@end


/*!
 *  @brief [UIImage][1] generator for [UIColor][0].
 *      [0]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIImage_Class/Reference/Reference.html
 *      [1]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIColor_Class/Reference/Reference.html
 */
@interface UIColor (UIImage)

/*!
 *  @brief Colored image sized as given size.
 *  @param size The image size to create.
 */
- (UIImage *)imageOfSize:(CGSize)size;

/*!
 *  @brief Colored image sized 1x1
 */
- (UIImage *)image;

@end


/*!
 *  @brief [UIBezierPath][0] extension for [UIImage][1] creation.
 *      [0]: http://developer.apple.com/library/ios/#documentation/uikit/reference/UIBezierPath_class/Reference/Reference.html
 *      [1]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIImage_Class/Reference/Reference.html
 */
@interface UIBezierPath (UIImage)

/*!
 *  @brief Image drawn with bazier path.
 *  @param strokeColor The stroke color for bezier path.
 *  @param fillColor The fill color for bezier path.
 */
- (UIImage *)imageWithStrokeColor:(UIColor *)strokeColor fillColor:(UIColor *)fillColor;

/*!
 *  @brief Image drawn with bazier path.
 *  @param strokeColor The stroke color for bezier path.
 */
- (UIImage *)imageWithStrokeColor:(UIColor *)strokeColor;

/*!
 *  @brief Image drawn with bazier path.
 *  @param fillColor The fill color for bezier path.
 */
- (UIImage *)imageWithFillColor:(UIColor *)fillColor;

@end
