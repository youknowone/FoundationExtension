//
//  UIImageAdditions.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @brief UIImage extension
 */
@interface UIImage (FE_ImageProcess)

/*!
 *  @brief Resized image by given size.
 *  @details This method depends on CoreGraphics.
 */
- (UIImage *)imageByResizingToSize:(CGSize)size;

@end
