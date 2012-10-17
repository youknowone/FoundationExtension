//
//  NSACrypto.m
//  FoundationExtension
//
//  Created by youknowone on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSACrypto.h"

#import "debug.h"

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

char NSDataBase64EncodingTable[64] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

static void NSDataBase64EncodeData(const char *input, char *output) {
    output[0] = NSDataBase64EncodingTable[((input[0] & 0xfc) >> 2)];
    output[1] = NSDataBase64EncodingTable[((input[0] & 0x03) << 4) | ((input[1] & 0xf0) >> 4)];
    output[2] = NSDataBase64EncodingTable[((input[1] & 0x0f) << 2) | ((input[2] & 0xc0) >> 6)];
    output[3] = NSDataBase64EncodingTable[((input[2] & 0x3f)     )];
}

- (NSString *)base64String {
    NSUInteger inlen = self.length;
    if (inlen == 0) {
        return @"";
    }
    NSUInteger roughlen = (inlen * 4) / 3;
    NSUInteger outlen = 4 * ((roughlen / 4) + ((roughlen % 4) != 0));
    char *outbuf = malloc(outlen + 1);
    outbuf[outlen] = 0;
    
    const char *inbytes = self.bytes;
    const char *inendian = inbytes + inlen;
    char *inpos = (char *)inbytes;
    
    char *outpos = outbuf;
    
    while (inendian - inpos >= 3) {
        NSDataBase64EncodeData(inpos, outpos);
        inpos += 3;
        outpos += 4;
    }
    
    NSInteger taillen = inendian - inpos;
    dassert(taillen >= 0);
    if (taillen) {
        char tailbuf[3];
        tailbuf[0] = inpos[0];
        tailbuf[1] = inpos[0] ? inpos[1] : 0;
        tailbuf[2] = 0;
        NSDataBase64EncodeData(tailbuf, outpos);
        if (!inpos[0]) {
            outpos[2] = '=';
        }
        outpos[3] = '=';
        dassert(outpos + 4 == outbuf + outlen);
    }

    return [[[NSString alloc] initWithBytesNoCopy:outbuf length:outlen encoding:NSUTF8StringEncoding freeWhenDone:YES] autorelease];
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
