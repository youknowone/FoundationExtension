//
//  NSACommonDigest.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief Extension categories using [CommonCrypto/CommonDigest][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man3/CC_MD5.3cc.html
 */

#import <Foundation/Foundation.h>

/*!
 *  @brief Shortcuts for CommonCrypto digest.
 */
@interface NSData (CommonCrypto)

/*!
 *  @brief MD2 digest.
 */
- (NSData *)digestByMD2;
/*!
 *  @brief MD4 digest.
 */
- (NSData *)digestByMD4;
/*!
 *  @brief MD5 digest.
 */
- (NSData *)digestByMD5;
/*!
 *  @brief SHA1 digest.
 */
- (NSData *)digestBySHA1;
/*!
 *  @brief SHA224 digest.
 */
- (NSData *)digestBySHA224;
/*!
 *  @brief SSH256 digest.
 */
- (NSData *)digestBySHA256;
/*!
 *  @brief SSH384 digest.
 */
- (NSData *)digestBySHA384;
/*!
 *  @brief SSH512 digest.
 */
- (NSData *)digestBySHA512;

/*! @name Deprecated */

//! @deprecated Use @ref NSData(Serialization)::hexadecimalString
- (NSString *)digestStringByMD5 __deprecated;
//! @deprecated Use @ref NSData(Serialization)::hexadecimalString
- (NSString *)digestStringBySHA1 __deprecated;

@end

/*!
 *  @brief Shortcuts for CommonCrypto digest.
 */
@interface NSString (CommonCrypto)

/*!
 *  @brief MD2 digest.
 */
- (NSData *)digestByMD2UsingEncoding:(NSStringEncoding)encoding;
/*!
 *  @brief MD4 digest.
 */
- (NSData *)digestByMD4UsingEncoding:(NSStringEncoding)encoding;
/*!
 *  @brief MD5 digest.
 */
- (NSData *)digestByMD5UsingEncoding:(NSStringEncoding)encoding;
/*!
 *  @brief SHA1 digest.
 */
- (NSData *)digestBySHA1UsingEncoding:(NSStringEncoding)encoding;
/*!
 *  @brief SHA224 digest.
 */
- (NSData *)digestBySHA224UsingEncoding:(NSStringEncoding)encoding;
/*!
 *  @brief SSH256 digest.
 */
- (NSData *)digestBySHA256UsingEncoding:(NSStringEncoding)encoding;
/*!
 *  @brief SSH384 digest.
 */
- (NSData *)digestBySHA384UsingEncoding:(NSStringEncoding)encoding;
/*!
 *  @brief SSH512 digest.
 */
- (NSData *)digestBySHA512UsingEncoding:(NSStringEncoding)encoding;

/*! @name Deprecated */

//! @deprecated Use -digestByMD5:encoding:
- (NSData *)digestByMD5 __deprecated;
//! @deprecated Use -digestBySHA1:encoding:
- (NSData *)digestBySHA1 __deprecated;
//! @deprecated Use @ref NSData(Serialization)::hexadecimalString
- (NSString *)digestStringByMD5 __deprecated;
//! @deprecated Use @ref NSData(Serialization)::hexadecimalString
- (NSString *)digestStringBySHA1 __deprecated;

@end
