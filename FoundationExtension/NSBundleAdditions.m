//
//  NSBundleAdditions.m
//  FoundationExtension
//
//  Created by youknowone on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSBundleAdditions.h"

NSString *NSResourceDirectory(void) {
	return [[NSBundle mainBundle] resourcePath];
}

NSString *NSPathForResourceFile(NSString *filename) {
	return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:filename];
}

@implementation NSBundle (FoundationExtension) 

- (NSString *)pathForResourceFile:(NSString *)filename {
	return [[NSBundle mainBundle] pathForResource:filename ofType:@""];
}

- (NSString *)pathForResource:(NSString *)filename {
	return [self pathForResourceFile:filename];
}

@end
