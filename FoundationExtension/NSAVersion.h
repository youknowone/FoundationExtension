//
//  NSAVersion.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 8. 1..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief Tool for system version
 */
@import Foundation;

@interface NSAVersion : NSObject {
    NSString *_string;
    NSInteger _major, _minor, _bugfix;
}

@property(nonatomic,readonly) NSString *string;
@property(nonatomic,readonly) NSInteger major, minor, bugfix;

- (instancetype)initWithString:(NSString *)string;
+ (instancetype)versionWithString:(NSString *)string;

@end
