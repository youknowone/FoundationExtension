//
//  NSACommonDigest.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSACommonDigest.h"

#import "debug.h"

@implementation NSData (CommonDigest)

typedef unsigned char * (*CC_DIGEST_FUNCTION)(const void *, CC_LONG, unsigned char *);

static NSData *NSDataCommonCryptoDigest(NSData *data, CC_DIGEST_FUNCTION digest, CC_LONG digestLength) {
    unsigned char *buf = malloc(digestLength);
    digest(data.bytes, (CC_LONG)data.length, buf);
    return [NSData dataWithBytesNoCopy:buf length:digestLength];
}

- (NSData *)digestByMD2 {
    return NSDataCommonCryptoDigest(self, CC_MD2, CC_MD2_DIGEST_LENGTH);
}

- (NSData *)digestByMD4 {
    return NSDataCommonCryptoDigest(self, CC_MD4, CC_MD4_DIGEST_LENGTH);
}

- (NSData *)digestByMD5 {
    return NSDataCommonCryptoDigest(self, CC_MD5, CC_MD5_DIGEST_LENGTH);
}

- (NSData *)digestBySHA1 {
    return NSDataCommonCryptoDigest(self, CC_SHA1, CC_SHA1_DIGEST_LENGTH);
}

- (NSData *)digestBySHA224 {
    return NSDataCommonCryptoDigest(self, CC_SHA224, CC_SHA224_DIGEST_LENGTH);
}

- (NSData *)digestBySHA256 {
    return NSDataCommonCryptoDigest(self, CC_SHA256, CC_SHA256_DIGEST_LENGTH);
}

- (NSData *)digestBySHA384 {
    return NSDataCommonCryptoDigest(self, CC_SHA384, CC_SHA384_DIGEST_LENGTH);
}

- (NSData *)digestBySHA512 {
    return NSDataCommonCryptoDigest(self, CC_SHA512, CC_SHA512_DIGEST_LENGTH);
}

- (NSString *)digestStringByMD5 {
    unsigned char hashedChars[CC_MD5_DIGEST_LENGTH];
    CC_MD5([self bytes], (CC_LONG)[self length], hashedChars);
    NSMutableString *result = [[NSMutableString alloc] init];
    for ( int i = 0; i<CC_MD5_DIGEST_LENGTH; i++ )
        [result appendFormat:@"%02x", *(hashedChars+i)];
    return [result autorelease];
}

- (NSString *)digestStringBySHA1 {
    unsigned char hashedChars[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1([self bytes], (CC_LONG)[self length], hashedChars);
    NSMutableString *result = [[NSMutableString alloc] init];
    for ( int i = 0; i<CC_SHA1_DIGEST_LENGTH; i++ ) {
        [result appendFormat:@"%02x", *(hashedChars+i)];
    }
    return [result autorelease];
}

@end

@implementation NSString (CommonCrypto)

static NSData *NSStringCommonCryptoDigest(NSString *string, NSStringEncoding encoding, CC_DIGEST_FUNCTION digest, CC_LONG digestLength) {
    NSData *data = [string dataUsingEncoding:encoding];
    return NSDataCommonCryptoDigest(data, digest, digestLength);
}

- (NSData *)digestByMD2UsingEncoding:(NSStringEncoding)encoding {
    return NSStringCommonCryptoDigest(self, encoding, CC_MD2, CC_MD2_DIGEST_LENGTH);
}

- (NSData *)digestByMD4UsingEncoding:(NSStringEncoding)encoding {
    return NSStringCommonCryptoDigest(self, encoding, CC_MD4, CC_MD4_DIGEST_LENGTH);
}

- (NSData *)digestByMD5UsingEncoding:(NSStringEncoding)encoding {
    return NSStringCommonCryptoDigest(self, encoding, CC_MD5, CC_MD5_DIGEST_LENGTH);
}

- (NSData *)digestBySHA1UsingEncoding:(NSStringEncoding)encoding {
    return NSStringCommonCryptoDigest(self, encoding, CC_SHA1, CC_SHA1_DIGEST_LENGTH);
}

- (NSData *)digestBySHA224UsingEncoding:(NSStringEncoding)encoding {
    return NSStringCommonCryptoDigest(self, encoding, CC_SHA224, CC_SHA224_DIGEST_LENGTH);
}

- (NSData *)digestBySHA256UsingEncoding:(NSStringEncoding)encoding {
    return NSStringCommonCryptoDigest(self, encoding, CC_SHA256, CC_SHA256_DIGEST_LENGTH);
}

- (NSData *)digestBySHA384UsingEncoding:(NSStringEncoding)encoding {
    return NSStringCommonCryptoDigest(self, encoding, CC_SHA384, CC_SHA384_DIGEST_LENGTH);
}

- (NSData *)digestBySHA512UsingEncoding:(NSStringEncoding)encoding {
    return NSStringCommonCryptoDigest(self, encoding, CC_SHA512, CC_SHA512_DIGEST_LENGTH);
}

- (NSData *)digestByMD5 {
    return [self digestByMD5UsingEncoding:NSUTF8StringEncoding];
}

- (NSData *)digestBySHA1 {
    return [self digestBySHA1UsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)digestStringByMD5 {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] digestStringByMD5];
}

- (NSString *)digestStringBySHA1 {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] digestStringBySHA1];
}

@end
