//
//  NSDataAdditions.m
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 17..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSURLAdditions.h"
#import "NSURLRequestAdditions.h"
#import "NSDataAdditions.h"

@implementation NSData (FoundationExtension)

- (id)initWithContentsOfAbstractPath:(NSString *)path {
	return [self initWithContentsOfURL:[NSURL URLWithAbstractPath:path]];
}

+ (NSData *)dataWithContentsOfAbstractPath:(NSString *)path {
	return [[[self allocWithZone:NULL] initWithContentsOfURL:[NSURL URLWithAbstractPath:path]] autorelease];
}

- (id)initWithContentsOfAbstractPath:(NSString *)path options:(NSDataReadingOptions)opt error:(NSError **)error {
	return [self initWithContentsOfURL:[NSURL URLWithAbstractPath:path] options:opt error:error];
}

+ (NSData *)dataWithContentsOfAbstractPath:(NSString *)path options:(NSDataReadingOptions)opt error:(NSError **)error {
	return [[[self allocWithZone:NULL] initWithContentsOfURL:[NSURL URLWithAbstractPath:path] options:opt error:error] autorelease];
}

- (id)initWithContentsOfURL:(NSURL *)url postBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding {
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
	[request setHTTPPostBody:bodyDictionary encoding:encoding];
	id result = [self initWithData:[NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL]];
    [request release];
    return result;
}

+ (NSData *)dataWithContentsOfURL:(NSURL *)url postBody:(NSDictionary *)bodyDictionary encoding:(NSStringEncoding)encoding {
	return [[[self allocWithZone:NULL] initWithContentsOfURL:url postBody:bodyDictionary encoding:encoding] autorelease];
}

- (id)initWithContentsOfURLRequest:(NSURLRequest *)request {
	return [self initWithData:[NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL]];
}

+ (NSData *)dataWithContentsOfURLRequest:(NSURLRequest *)request {
	return [[[self allocWithZone:NULL] initWithContentsOfURLRequest:request] autorelease];
}

- (id)initWithContentsOfURLRequest:(NSURLRequest *)request error:(NSError **)error {
	return [self initWithData:[NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:error]];
}

+ (NSData *)dataWithContentsOfURLRequest:(NSURLRequest *)request error:(NSError **)error {
	return [[[self allocWithZone:NULL] initWithContentsOfURLRequest:request error:error] autorelease];
}

static const char NSDataAdditionsHexDigits[] = "0123456789abcdef";
- (NSString *)hexadecimalString {
    const unsigned char *bytes = self.bytes;
    NSUInteger length = self.length;
    char *buffer = (char *)malloc(length * 2 + 1);
	char *pointer = buffer;
    
	for (NSInteger i = 0; i < length; i++) {
		const unsigned char c = *bytes; bytes++;
		*pointer = NSDataAdditionsHexDigits[(c >> 4) & 0xF]; pointer++;
		*pointer = NSDataAdditionsHexDigits[c & 0xF]; pointer++;
	}
	*pointer = 0;
	
	return [[[NSString alloc] initWithBytesNoCopy:buffer length:length * 2 encoding:NSASCIIStringEncoding freeWhenDone:YES] autorelease];
}

static const char NSDataAdditionsHexBytes[0x100] = 
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

- (id)initWithHexadecimalString:(NSString *)hexadecimal {
    NSData *hexData = [hexadecimal dataUsingEncoding:NSASCIIStringEncoding];
    const unsigned char *bytes = hexData.bytes;
    NSUInteger length = hexData.length;
    char *buffer = (char *)malloc(length / 2 + 1);
    char *pointer = buffer;
    
	for (NSInteger i = 0; i < length; i++) {
        unsigned char c = NSDataAdditionsHexBytes[*bytes] << 4; bytes++;
        c += NSDataAdditionsHexBytes[*bytes]; bytes++;
		*pointer = c; pointer++;
	}
	*pointer = 0;
	
	return [[NSData alloc] initWithBytesNoCopy:buffer length:length / 2 freeWhenDone:YES];    
}

+ (NSData *)dataWithHexadecimalString:(NSString *)hexadecimal {
    return [[[self alloc] initWithHexadecimalString:hexadecimal] autorelease];
}

@end
