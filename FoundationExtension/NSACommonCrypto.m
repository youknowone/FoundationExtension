//
//  NSACommonCrypto.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 1. 16..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "NSString.h"

#import <CommonCrypto/CommonCryptor.h>
#define __CCOptions
#import "NSACommonCrypto.h"

@implementation NSData (CommonCryptor)

CCOptions NSDataCommonCryptoCryptDefaultOptions = kCCOptionPKCS7Padding;

static NSData *NSDataCommonCryptoCrypt(CCOperation operation, NSData *data, NSData *key, CCAlgorithm algorithm, CCOptions options, size_t keyLength, size_t blockSize) {
    unsigned char keyBytes[keyLength];
    // safe-key
    NSInteger diff = keyLength - key.length;
    if (diff <= 0) {
        memcpy(keyBytes, key.bytes, keyLength);
    } else {
        bzero(keyBytes + key.length, diff); // zero padding
        memcpy(keyBytes, key.bytes, key.length);
    }

    size_t bufSize = data.length + blockSize;
    void *buf = malloc(bufSize);

    size_t outSize = 0;

    CCCryptorStatus status = CCCrypt(operation, algorithm, options, keyBytes, keyLength, NULL,
                                     data.bytes, data.length, buf, bufSize, &outSize);

    if (status != kCCSuccess) {
        free(buf);
        return nil;
    }

    return [NSData dataWithBytesNoCopy:buf length:outSize freeWhenDone:YES];
}

static size_t NSDataCommonCryptoCryptKeySize(NSData *key, size_t minLength, size_t maxLength) {
    if (key.length < minLength) {
        return 0;
    }
    size_t keyLength = key.length;
    if (keyLength > maxLength) {
        keyLength = maxLength;
    }
    return keyLength;
}

- (NSData *)encryptedAES128DataWithKey:(NSData *)key {
    return [self encryptedAES128DataWithKey:key options:NSDataCommonCryptoCryptDefaultOptions];
}

- (NSData *)encryptedAES256DataWithKey:(NSData *)key {
    return [self encryptedAES256DataWithKey:key options:NSDataCommonCryptoCryptDefaultOptions];
}

- (NSData *)encrypted3DESDataWithKey:(NSData *)key {
    return [self encrypted3DESDataWithKey:key options:NSDataCommonCryptoCryptDefaultOptions];
}

- (NSData *)encryptedAES128DataWithKey:(NSData *)key options:(CCOptions)options {
    return NSDataCommonCryptoCrypt(kCCEncrypt, self, key, kCCAlgorithmAES128, options, kCCKeySizeAES128, kCCBlockSizeAES128);
}

- (NSData *)encryptedAES192DataWithKey:(NSData *)key options:(CCOptions)options {
    return NSDataCommonCryptoCrypt(kCCEncrypt, self, key, kCCAlgorithmAES128, options, kCCKeySizeAES192, kCCBlockSizeAES128);
}

- (NSData *)encryptedAES256DataWithKey:(NSData *)key options:(CCOptions)options {
    return NSDataCommonCryptoCrypt(kCCEncrypt, self, key, kCCAlgorithmAES128, options, kCCKeySizeAES256, kCCBlockSizeAES128);
}

- (NSData *)encryptedDESDataWithKey:(NSData *)key options:(CCOptions)options {
    return NSDataCommonCryptoCrypt(kCCEncrypt, self, key, kCCAlgorithmDES, options, kCCKeySizeDES, kCCBlockSizeDES);
}

- (NSData *)encrypted3DESDataWithKey:(NSData *)key options:(CCOptions)options {
    return NSDataCommonCryptoCrypt(kCCEncrypt, self, key, kCCAlgorithm3DES, options, kCCKeySize3DES, kCCBlockSize3DES);
}

- (NSData *)encryptedCastDataWithKey:(NSData *)key options:(CCOptions)options {
    size_t keyLength = NSDataCommonCryptoCryptKeySize(key, kCCKeySizeMinCAST, kCCKeySizeMaxCAST);
    if (keyLength == 0) {
        return nil;
    }
    return NSDataCommonCryptoCrypt(kCCEncrypt, self, key, kCCAlgorithmCAST, options, keyLength, kCCBlockSizeCAST);
}

- (NSData *)encryptedRC2DataWithKey:(NSData *)key options:(CCOptions)options {
    size_t keyLength = NSDataCommonCryptoCryptKeySize(key, kCCKeySizeMinRC2, kCCKeySizeMaxRC2);
    if (keyLength == 0) {
        return nil;
    }
    return NSDataCommonCryptoCrypt(kCCEncrypt, self, key, kCCAlgorithmCAST, options, keyLength, kCCBlockSizeRC2);
}

- (NSData *)encryptedRC4DataWithKey:(NSData *)key options:(CCOptions)options {
    size_t keyLength = NSDataCommonCryptoCryptKeySize(key, kCCKeySizeMinRC4, kCCKeySizeMaxRC4);
    if (keyLength == 0) {
        return nil;
    }
    return NSDataCommonCryptoCrypt(kCCEncrypt, self, key, kCCAlgorithmRC4, options, keyLength, kCCBlockSizeRC2);
}

#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1080
- (NSData *)encryptedBlowfishDataWithKey:(NSData *)key options:(CCOptions)options {
    size_t keyLength = NSDataCommonCryptoCryptKeySize(key, kCCKeySizeMinBlowfish, kCCKeySizeMaxBlowfish);
    if (keyLength == 0) {
        return nil;
    }
    return NSDataCommonCryptoCrypt(kCCEncrypt, self, key, kCCAlgorithmBlowfish, options, keyLength, kCCBlockSizeBlowfish);
}
#endif


- (NSData *)decryptedAES128DataWithKey:(NSData *)key {
    return [self decryptedAES128DataWithKey:key options:NSDataCommonCryptoCryptDefaultOptions];
}

- (NSData *)decryptedAES256DataWithKey:(NSData *)key {
    return [self decryptedAES256DataWithKey:key options:NSDataCommonCryptoCryptDefaultOptions];
}

- (NSData *)decrypted3DESDataWithKey:(NSData *)key {
    return [self decrypted3DESDataWithKey:key options:NSDataCommonCryptoCryptDefaultOptions];
}

- (NSData *)decryptedAES128DataWithKey:(NSData *)key options:(CCOptions)options {
    return NSDataCommonCryptoCrypt(kCCDecrypt, self, key, kCCAlgorithmAES128, options, kCCKeySizeAES128, kCCBlockSizeAES128);
}

- (NSData *)decryptedAES192DataWithKey:(NSData *)key options:(CCOptions)options {
    return NSDataCommonCryptoCrypt(kCCDecrypt, self, key, kCCAlgorithmAES128, options, kCCKeySizeAES192, kCCBlockSizeAES128);
}

- (NSData *)decryptedAES256DataWithKey:(NSData *)key options:(CCOptions)options {
    return NSDataCommonCryptoCrypt(kCCDecrypt, self, key, kCCAlgorithmAES128, options, kCCKeySizeAES256, kCCBlockSizeAES128);
}

- (NSData *)decryptedDESDataWithKey:(NSData *)key options:(CCOptions)options {
    return NSDataCommonCryptoCrypt(kCCDecrypt, self, key, kCCAlgorithmDES, options, kCCKeySizeDES, kCCBlockSizeDES);
}

- (NSData *)decrypted3DESDataWithKey:(NSData *)key options:(CCOptions)options {
    return NSDataCommonCryptoCrypt(kCCDecrypt, self, key, kCCAlgorithm3DES, options, kCCKeySize3DES, kCCBlockSize3DES);
}

- (NSData *)decryptedCastDataWithKey:(NSData *)key options:(CCOptions)options {
    size_t keyLength = NSDataCommonCryptoCryptKeySize(key, kCCKeySizeMinCAST, kCCKeySizeMaxCAST);
    if (keyLength == 0) {
        return nil;
    }
    return NSDataCommonCryptoCrypt(kCCDecrypt, self, key, kCCAlgorithmCAST, options, keyLength, kCCBlockSizeCAST);
}

- (NSData *)decryptedRC2DataWithKey:(NSData *)key options:(CCOptions)options {
    size_t keyLength = NSDataCommonCryptoCryptKeySize(key, kCCKeySizeMinRC2, kCCKeySizeMaxRC2);
    if (keyLength == 0) {
        return nil;
    }
    return NSDataCommonCryptoCrypt(kCCDecrypt, self, key, kCCAlgorithmCAST, options, keyLength, kCCBlockSizeRC2);
}

- (NSData *)decryptedRC4DataWithKey:(NSData *)key options:(CCOptions)options {
    size_t keyLength = NSDataCommonCryptoCryptKeySize(key, kCCKeySizeMinRC4, kCCKeySizeMaxRC4);
    if (keyLength == 0) {
        return nil;
    }
    return NSDataCommonCryptoCrypt(kCCDecrypt, self, key, kCCAlgorithmRC4, options, keyLength, kCCBlockSizeRC2);
}

#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1080
- (NSData *)decryptedBlowfishDataWithKey:(NSData *)key options:(CCOptions)options {
    size_t keyLength = NSDataCommonCryptoCryptKeySize(key, kCCKeySizeMinBlowfish, kCCKeySizeMaxBlowfish);
    if (keyLength == 0) {
        return nil;
    }
    return NSDataCommonCryptoCrypt(kCCDecrypt, self, key, kCCAlgorithmBlowfish, options, keyLength, kCCBlockSizeBlowfish);
}
#endif

@end


@implementation NSString (CommonCryptorString)

- (NSData *)encryptedAES128DataWithKey:(NSString *)key {
    return [self.dataUsingUTF8Encoding encryptedAES128DataWithKey:key.dataUsingUTF8Encoding];
}

- (NSData *)encryptedAES256DataWithKey:(NSString *)key {
    return [self.dataUsingUTF8Encoding encryptedAES256DataWithKey:key.dataUsingUTF8Encoding];
}

- (NSData *)encrypted3DESDataWithKey:(NSString *)key {
    return [self.dataUsingUTF8Encoding encrypted3DESDataWithKey:key.dataUsingUTF8Encoding];
}

@end


@implementation NSData (CommonCryptorString)

- (NSString *)decryptedAES128StringWithKey:(NSString *)key {
    return [NSString stringWithUTF8Data:[self decryptedAES128DataWithKey:key.dataUsingUTF8Encoding]];
}

- (NSString *)decryptedAES256StringWithKey:(NSString *)key {
    return [NSString stringWithUTF8Data:[self decryptedAES256DataWithKey:key.dataUsingUTF8Encoding]];
}

- (NSString *)decrypted3DESStringWithKey:(NSString *)key {
    return [NSString stringWithUTF8Data:[self decrypted3DESDataWithKey:key.dataUsingUTF8Encoding]];
}

@end
