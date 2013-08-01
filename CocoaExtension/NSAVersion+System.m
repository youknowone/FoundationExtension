//
//  NSAVersion+System.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 8. 1..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "NSAVersion+System.h"

@implementation NSAVersion (OSX)

+ (NSAVersion *)systemVersion {
    NSDictionary *info = [NSDictionary dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
    NSString *versionString = info[@"ProductVersion"];
    return [self versionWithString:versionString];
}

@end
