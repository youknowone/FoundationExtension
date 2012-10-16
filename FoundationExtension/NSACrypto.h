//
//  ICCrypto.h
//  FoundationExtension
//
//  Created by youknowone on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

@interface NSData (FoundationExtensionCrypto)

- (NSData *)digestByMD5;
- (NSData *)digestBySHA1;

- (NSString *)digestStringByMD5;
- (NSString *)digestStringBySHA1;

@end

// string conversion wrapper of NSData (FoundationExtensionCrypto)
@interface NSString (FoundationExtensionCrypto)

- (NSData *)digestByMD5;
- (NSData *)digestBySHA1;

- (NSString *)digestStringByMD5;
- (NSString *)digestStringBySHA1;

@end
