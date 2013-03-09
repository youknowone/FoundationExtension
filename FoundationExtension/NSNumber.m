//
//  NSNumber.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 3. 10..
//  Copyright (c) 2013 youknowone.org All rights reserved.
//

#import "NSObject.h"
#import "NSString.h"
#import "NSNumber.h"

@implementation NSNumber (Description)

- (NSString *)typeFormedDescription {
    if ([self.className isEqualToString:@"__NSCFNumber"]) {
        NSString *defaultDescription = [self description];
        if (strcmp(self.objCType, @encode(float)) == 0 || strcmp(self.objCType, @encode(double)) == 0) {
            if (![defaultDescription hasSubstring:@"."]) {
                return [defaultDescription stringByAppendingString:@".0"];
            }
        }
        return defaultDescription;
    } else if ([self.className isEqualToString:@"__NSCFBoolean"]) {
        return [self boolValue] ? @"YES" : @"NO";
    }
    return [self description];
}

@end


@implementation NSDecimalNumber (Description)

- (NSString *)typeFormedDescription {
    NSString *defaultDescription = [self description];
    if (strcmp(self.objCType, @encode(float)) == 0 || strcmp(self.objCType, @encode(double)) == 0) {
        if (![defaultDescription hasSubstring:@"."]) {
            return [defaultDescription stringByAppendingString:@".0"];
        }
    }
    return defaultDescription;
}

@end
