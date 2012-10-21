//
//  NSACrypto.h
//  FoundationExtension
//
//  Created by youknowone on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @brief Shortcuts for CommonCrypto digest.
 */
@interface NSData (FoundationExtensionCrypto)

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

//! @deprecated Use NSString::hexadecimalString
- (NSString *)digestStringByMD5 __deprecated;
//! @deprecated Use NSString::hexadecimalString
- (NSString *)digestStringBySHA1 __deprecated;

@end

/*!
 *  @brief Shortcuts for CommonCrypto digest.
 */
@interface NSString (FoundationExtensionCrypto)

- (NSData *)digestByMD5;
- (NSData *)digestBySHA1;

//! @deprecated Use NSString::hexadecimalString
- (NSString *)digestStringByMD5 __deprecated;
//! @deprecated Use NSString::hexadecimalString
- (NSString *)digestStringBySHA1 __deprecated;

@end
