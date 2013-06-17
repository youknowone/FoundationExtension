//
//  UIImage.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [UIImage][0] extension
 *      [0]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIImage_Class/Reference/Reference.html
 */

/*!
 *  @brief UIImage creations
 */
@interface UIImage (Creations)

- (id)initWithContentsOfURL:(NSURL *)URL;
+ (id)imageWithContentsOfURL:(NSURL *)URL;

- (id)initWithContentsOfURLRequest:(NSURLRequest *)request;
+ (id)imageWithContentsOfURLRequest:(NSURLRequest *)request;

- (id)initWithContentsOfURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy;
+ (id)imageWithContentsOfURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy;

@end

/*!
 *  @brief UIImage extension
 */
@interface UIImage (UIGraphics)

/*!
 *  @brief Resized image by given size.
 *  @details This method depends on CoreGraphics.
 */
- (UIImage *)imageByResizingToSize:(CGSize)size;

/*!
 *  @brief Color filled image with given color.
 *  @details This method depends on CoreGraphics.
 */
- (UIImage *)imageByFilledWithColor:(UIColor *)color;

/*!
 *  @brief Image by bazier path.
 */
+ (UIImage *)imageWithBezierPath:(UIBezierPath *)path color:(UIColor *)color backgroundColor:(UIColor *)backgroundColor;

/*!
 *  @brief Image by bazier path.
 */
+ (UIImage *)imageWithBezierPath:(UIBezierPath *)path color:(UIColor *)color;

@end


/*!
 *  @brief UIImageView extension
 */
@interface UIImageView (Creations)

/*!
 *  @brief Creates a basic image view
 */
+ (id)imageView;

@end


@interface UIBezierPath (UIImage)

- (UIImage *)imageWithStrokeColor:(UIColor *)strokeColor fillColor:(UIColor *)fillColor;

@end
