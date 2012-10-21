//
//  UIColorAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @brief UIColor HTML color creations
 */
@interface UIColor (FoundationExtensionHTML)

/*!
 *  @brief Initialize with html color code
 *  @details This accept formats as like "#fff" or "#0f0f0f" for formal colors. "#dddf" or "#fdfdfdff" for alpha value. If "#" prefix doesn't exist, select constant from name table.
 */
- (UIColor *)initWithHTMLExpression:(NSString *)code;
/*!
 *  @brief Initialize with html color code
 *  @details This accept formats as like "#fff".
 */
- (UIColor *)initWithHTMLHexExpression16:(NSString *)code;
/*!
 *  @brief Initialize with html color code
 *  @details This accept formats as like "#0f0f0f"
 */
- (UIColor *)initWithHTMLHexExpression32:(NSString *)code;
/*!
 *  @brief Initialize with html color code
 *  @details This accept formats as like "#dddf". Last character is alpha channel.
 */
- (UIColor *)initWithHTMLHexExpression16a:(NSString *)code;
/*!
 *  @brief Initialize with html color code
 *  @details This accept formats as like "#ddddddff". Last 2 characters are alpha channel.
 */
- (UIColor *)initWithHTMLHexExpression32a:(NSString *)code;

/*!
 *  @brief Return constant color object for given color name.
 *  @details Available color names are standard HTML color names, "orange" for css and "transperent" for clear color.
 */
+ (UIColor *)colorWithHTMLColorName:(NSString *)name;

/*!
 *  @brief Creates and returns color object with html color code
 *  @details This accept formats as like "#fff" or "#0f0f0f" for formal colors. "#dddf" or "#fdfdfdff" for alpha value. If "#" prefix doesn't exist, select constant from name table.
 */
+ (UIColor *)colorWithHTMLExpression:(NSString *)code;
/*!
 *  @brief Creates and return color object with html color code
 *  @details This accept formats as like "#fff".
 */
+ (UIColor *)colorWithHTMLHexExpression16:(NSString *)code;
/*!
 *  @brief Creates and return color object with html color code
 *  @details This accept formats as like "#0f0f0f".
 */
+ (UIColor *)colorWithHTMLHexExpression32:(NSString *)code;
/*!
 *  @brief Creates and return color object with html color code
 *  @details This accept formats as like "#dddf". Last character is alpha channel.
 */
+ (UIColor *)colorWithHTMLHexExpression16a:(NSString *)code;
/*!
 *  @brief Creates and return color object with html color code
 *  @details This accept formats as like "#ddddddff". Last 2 characters are alpha channel.
 */
+ (UIColor *)colorWithHTMLHexExpression32a:(NSString *)code;

@end
