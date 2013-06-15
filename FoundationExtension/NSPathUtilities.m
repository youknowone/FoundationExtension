//
//  NSPathUtilities.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 11. 2..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSString.h"

#import "NSPathUtilities.h"

NSString *NSPathForUserDirectory(NSSearchPathDirectory directory) {
    return NSSearchPathForDirectoriesInDomains(directory,  NSUserDomainMask, YES)[0];
}

NSString *NSPathForUserFileInDirectory(NSSearchPathDirectory directory, NSString *filename) {
    return [NSPathForUserDirectory(directory) stringByAppendingPathComponent:filename];
}

NSString *NSPathForHomeFile(NSString *filename) {
    return [NSHomeDirectory() stringByAppendingPathComponent:filename];
}

NSString *NSPathForHomeFileForUser(NSString *filename, NSString *userName) {
    return [NSHomeDirectoryForUser(userName) stringByAppendingPathComponent:filename];
}

NSString *NSUserConfigurationDirectory(void) {
#ifdef TARGET_OS_IPHONE
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
#else
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
#endif
}

NSString *NSPathForUserConfigurationFile(NSString *filename) {
    return [NSUserConfigurationDirectory() stringByAppendingPathComponent:filename];
}

NSString *NSPathForTemporaryFile(NSString *filename) {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:filename];
}


@implementation NSString (NSPathUtilities)

- (NSString *)stringByAppendingPathFormat:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSString *result = [self stringByAppendingPathComponent:[NSString stringWithFormat:format arguments:args]];
    va_end(args);
    return result;
}

@end
