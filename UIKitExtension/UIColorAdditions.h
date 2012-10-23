//
//  UIColorAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

@class UIAColorComponents;

/*!
 *  @brief UIColor shortcuts
 */
@interface UIColor (UIKitExtension)

//! @brief Color component property. nil if unavailable.
@property(nonatomic, readonly) UIAColorComponents *components;

/*!
 *  @brief Initialize color from 32bit color component
 *  @param red
 *      Value from 0 to 255
 *  @param green
 *      Value from 0 to 255
 *  @param blue
 *      Value from 0 to 255
 *  @param alpha
 *      Value from 0 to 255
 */
- (id)initWith8bitRed:(UInt8)red green:(UInt8)green blue:(UInt8)blue alpha:(UInt8)alpha;
/*!
 *  @brief Creates and returns color from 32bit color component
 *  @see initWith8bitRed:green:blue:alpha:
 */
+ (id)colorWith8bitRed:(UInt8)red green:(UInt8)green blue:(UInt8)blue alpha:(UInt8)alpha;

/*!
 *  @brief Initialize color from 32bit color packed value
 *  @param value
 *      Packed 32bit color value.
 */
- (id)initWith32bitColor:(UInt32)value;
/*!
 *  @brief Creates and returns color from 32bit color packed value
 *  @see initWith32bitColor:
 */
+ (id)colorWith32bitColor:(UInt32)value;

@end

/*!
 *  @brief UIColor HTML color creations
 */
@interface UIColor (UIKitExtensionHTML)

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


/*!
 *  @brief UIColor component interface
 */
@interface UIAColorComponents: NSObject {
    CGFloat _components[4];
}

//! @brief Red component
@property(nonatomic, readonly) CGFloat red;
//! @brief Green component
@property(nonatomic, readonly) CGFloat green;
//! @brief Blue component
@property(nonatomic, readonly) CGFloat blue;
//! @brief Alpha component
@property(nonatomic, readonly) CGFloat alpha;

/*!
 *  @brief Initialize color components from color
 *  @param color
 *      An UIColor
 */
- (id)initWithColor:(UIColor *)color;
/*!
 *  @brief Creates and returns color components from color
 *  @see initWithColor:
 */
+ (id)componentsWithColor:(UIColor *)color;

@end
