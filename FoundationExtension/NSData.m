//
//  NSData.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSData.h"

#include "debug.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSData (Serialization)

- (id)propertyListObjectUsingFormat:(NSPropertyListFormat *_Nullable)format error:(out NSError **)error {
    if ([NSPropertyListSerialization respondsToSelector:@selector(propertyListWithData:options:format:error:)]) {
        return [NSPropertyListSerialization propertyListWithData:self options:0 format:format error:error];
    }

    // support os < osx10.6 or ios4.0
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [NSPropertyListSerialization propertyListFromData:self mutabilityOption:NSPropertyListImmutable format:format errorDescription:NULL];
    #pragma clang diagnostic pop
}

const char NSDataHexadecimalEncodingTable[16] = "0123456789abcdef";

- (NSString *)hexadecimalString {
    NSUInteger length = self.length;
    unsigned char *inpos = (unsigned char *)self.bytes;
    const unsigned char *inendian = self.bytes + length;

    char *buffer = malloc(length * 2);
    char *outpos = buffer;

    for ( ; inpos < inendian; inpos += 1, outpos += 2) {
        *(outpos + 0) = NSDataHexadecimalEncodingTable[*inpos >> 4];
        *(outpos + 1) = NSDataHexadecimalEncodingTable[*inpos & 0x0f];
    }
    return [[NSString alloc] initWithBytesNoCopy:buffer length:length * 2 encoding:NSUTF8StringEncoding freeWhenDone:YES];
}

static const char NSDataHexadecimalDecodingTable[0x80] =
//0           4           8          12          16
{-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,// 16
 -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,// 32
 -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,// 48
  0, 1, 2, 3, 4, 5, 6, 7, 8, 9,-1,-1,-1,-1,-1,-1,// 64
 -1,10,11,12,13,14,15,-1,-1,-1,-1,-1,-1,-1,-1,-1,// 80
 -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,// 96
 -1,10,11,12,13,14,15,-1,-1,-1,-1,-1,-1,-1,-1,-1,//112
 -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,//128
};

- (instancetype)initWithHexadecimalString:(NSString *)hexadecimal {
    NSData *hexData = [hexadecimal dataUsingEncoding:NSASCIIStringEncoding];
    const unsigned char *bytes = hexData.bytes;
    NSUInteger length = hexData.length;
    const unsigned char *endian = bytes + length;

    unsigned char *buffer = (unsigned char *)malloc(length / 2);
    unsigned char *pointer = buffer;

    for (unsigned char *pos = (unsigned char *)bytes; pos < endian; pos += 2, pointer += 1) {
        *pointer = (unsigned char)(NSDataHexadecimalDecodingTable[*pos] << 4) + NSDataHexadecimalDecodingTable[*(pos+1)];
    }

    return [self initWithBytesNoCopy:buffer length:length / 2 freeWhenDone:YES];
}

+ (instancetype)dataWithHexadecimalString:(NSString *)hexadecimal {
    return [[self alloc] initWithHexadecimalString:hexadecimal];
}

@end

NS_ASSUME_NONNULL_END
