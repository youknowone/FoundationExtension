//
//  ICCrypto.h
//  FoundationExtension
//
//  Created by youknowone on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

@interface NSData (FoundationExtensionCrypto)

- (NSData *)digestByMD2;
- (NSData *)digestByMD4;
- (NSData *)digestByMD5;
- (NSData *)digestBySHA1;
- (NSData *)digestBySHA224;
- (NSData *)digestBySHA256;
- (NSData *)digestBySHA384;
- (NSData *)digestBySHA512;

// deprecated by alternative method. use -hexadecimalString
- (NSString *)digestStringByMD5 __deprecated;
- (NSString *)digestStringBySHA1 __deprecated;

@end

// string conversion wrapper of NSData (FoundationExtensionCrypto)
@interface NSString (FoundationExtensionCrypto)

- (NSData *)digestByMD5;
- (NSData *)digestBySHA1;

// deprecated by alternative method. use -hexadecimalString
- (NSString *)digestStringByMD5 __deprecated;
- (NSString *)digestStringBySHA1 __deprecated;

@end
