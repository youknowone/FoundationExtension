//
//  NSACommonCrypto.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 1. 16..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief Extension categories using CommonCrypto/CommonCryptor
 */

#ifndef __CCOptions
    #define CCOptions uint32_t
#endif

/*!
 *	@brief CommonCryptor wrapper.
 *  @details
 *		If key is shorter than required length, methods return nil.
 *		If key is longer than requried length, it is cut as required length.
 */
@interface NSData (CommonCryptor)

/*!
 * 	@name Encryption Shortcut
 * 	@details These shortcuts use default option as kCCOptionPKCS7Padding
 */
- (NSData *)encryptedAES128DataWithKey:(NSData *)key;
- (NSData *)encryptedAES256DataWithKey:(NSData *)key;
- (NSData *)encrypted3DESDataWithKey:(NSData *)key;

//! @name Encryption

- (NSData *)encryptedAES128DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)encryptedAES192DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)encryptedAES256DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)encryptedDESDataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)encrypted3DESDataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)encryptedCastDataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)encryptedRC2DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)encryptedRC4DataWithKey:(NSData *)key options:(CCOptions)options;
#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1080
- (NSData *)encryptedBlowfishDataWithKey:(NSData *)key options:(CCOptions)options;
#endif

/*!
 *	@name Decryption Shortcut
 * 	@details These shortcuts use default option as kCCOptionPKCS7Padding
 */

- (NSData *)decryptedAES128DataWithKey:(NSData *)key;
- (NSData *)decryptedAES256DataWithKey:(NSData *)key;
- (NSData *)decrypted3DESDataWithKey:(NSData *)key;

//! @name Decryption

- (NSData *)decryptedAES128DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)decryptedAES192DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)decryptedAES256DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)decryptedDESDataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)decrypted3DESDataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)decryptedCastDataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)decryptedRC2DataWithKey:(NSData *)key options:(CCOptions)options;
#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1080
- (NSData *)decryptedBlowfishDataWithKey:(NSData *)key options:(CCOptions)options;
#endif

@end

/*!
 *	@brief CommonCryptor NSString to NSData encryption shortcuts
 */
@interface NSString (CommonCryptorString)

- (NSData *)encryptedAES128DataWithKey:(NSString *)key;
- (NSData *)encryptedAES256DataWithKey:(NSString *)key;
- (NSData *)encrypted3DESDataWithKey:(NSString *)key;

@end


/*!
 *	@brief CommonCryptor NSData to NSString decryption shortcuts
 */
@interface NSData (CommonCryptorString)

- (NSString *)decryptedAES128StringWithKey:(NSString *)key;
- (NSString *)decryptedAES256StringWithKey:(NSString *)key;
- (NSString *)decrypted3DESStringWithKey:(NSString *)key;

@end

