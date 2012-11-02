//
//  NSBundle.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSBundle.h"

NSString *NSMainBundleResourceDirectory(void) {
    return [[NSBundle mainBundle] resourcePath];
}

NSString *NSMainBundleResourcePathForFile(NSString *filename) {
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:filename];
}

@implementation NSBundle (Shortcuts)

- (NSString *)pathForResourceFile:(NSString *)filename {
    return [self pathForResource:filename ofType:@""];
}

- (NSString *)pathForResource:(NSString *)filename {
    return [self pathForResourceFile:filename];
}

@end
