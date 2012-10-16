//
//  NSACrypto.m
//  FoundationExtension
//
//  Created by youknowone on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSACrypto.h"

@implementation NSData (FoundationExtensionCrypto)

- (NSData *)digestByMD5 {
    unsigned char hashedChars[CC_MD5_DIGEST_LENGTH];
    CC_MD5([self bytes], (CC_LONG)[self length], hashedChars);
    return [NSData dataWithBytes:hashedChars length:CC_MD5_DIGEST_LENGTH];
}

- (NSData *)digestBySHA1 {
    unsigned char hashedChars[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1([self bytes], (CC_LONG)[self length], hashedChars);
    return [NSData dataWithBytes:hashedChars length:CC_SHA1_DIGEST_LENGTH];
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

@implementation NSString (FoundationExtensionCrypto)

- (NSData *)digestByMD5 {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] digestByMD5];
}

- (NSData *)digestBySHA1 {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] digestBySHA1];
}

- (NSString *)digestStringByMD5 {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] digestStringByMD5];
}

- (NSString *)digestStringBySHA1 {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] digestStringBySHA1];
}

@end
