//
//  NSPathUtilitiesAddtions.m
//  FoundationExtension
//
//  Created by youknowone on 10. 11. 2..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSPathUtilitiesAddtions.h"

NSString *NSPathForUserDirectory(NSSearchPathDirectory directory) {
    return [NSSearchPathForDirectoriesInDomains(directory,  NSUserDomainMask, YES) objectAtIndex:0];
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
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
#else
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
#endif
}

NSString *NSPathForUserConfigurationFile(NSString *filename) {
    return [NSUserConfigurationDirectory() stringByAppendingPathComponent:filename];
}
