//
//  NSACommonCrypto.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 1. 16..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief Extension categories using [CommonCrypto/CommonCryptor]
 */

@interface NSData (CommonCryptor)

// default option is kCCOptionPKCS7Padding + kCCOptionECBMode
- (NSData *)encryptedAES128DataWithKey:(NSData *)key;
- (NSData *)encryptedAES256DataWithKey:(NSData *)key;
- (NSData *)encrypted3DESDataWithKey:(NSData *)key;

- (NSData *)encryptedAES128DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)encryptedAES192DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)encryptedAES256DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)encryptedDESDataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)encrypted3DESDataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)encryptedCastDataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)encryptedRC2DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)encryptedRC4DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)encryptedBlowfishDataWithKey:(NSData *)key options:(CCOptions)options;

// default option is kCCOptionPKCS7Padding + kCCOptionECBMode
- (NSData *)decryptedAES128DataWithKey:(NSData *)key;
- (NSData *)decryptedAES256DataWithKey:(NSData *)key;
- (NSData *)decrypted3DESDataWithKey:(NSData *)key;

- (NSData *)decryptedAES128DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)decryptedAES192DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)decryptedAES256DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)decryptedDESDataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)decrypted3DESDataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)decryptedCastDataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)decryptedRC2DataWithKey:(NSData *)key options:(CCOptions)options;
- (NSData *)decryptedBlowfishDataWithKey:(NSData *)key options:(CCOptions)options;

@end

@interface NSString (CommonCryptorString)

// default option is kCCOptionPKCS7Padding + kCCOptionECBMode
- (NSData *)encryptedAES128DataWithKey:(NSString *)key;
- (NSData *)encryptedAES256DataWithKey:(NSString *)key;
- (NSData *)encrypted3DESDataWithKey:(NSString *)key;

@end

@interface NSData (CommonCryptorString)

// default option is kCCOptionPKCS7Padding + kCCOptionECBMode
- (NSString *)decryptedAES128StringWithKey:(NSString *)key;
- (NSString *)decryptedAES256StringWithKey:(NSString *)key;
- (NSString *)decrypted3DESStringWithKey:(NSString *)key;

@end
