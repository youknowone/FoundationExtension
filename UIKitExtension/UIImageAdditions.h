//
//  UIImageAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @headerfile UIImageAdditions.h UIImage extension.
 */

/*!
 *  @brief UIImage extension
 */
@interface UIImage (FoundationExtension)

/*!
 *  @brief Resized image by given size.
 *  @details This method depends on CoreGraphics.
 */
- (UIImage *)imageByResizingToSize:(CGSize)size;

@end
