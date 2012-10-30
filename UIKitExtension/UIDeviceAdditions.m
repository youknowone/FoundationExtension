//
//  UIDeviceAdditions.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 6..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "UIDeviceAdditions.h"

#import "debug.h"

@implementation UIDevice (FE_Shortcuts)

+ (NSString *)uniqueIdentifier {
    return [[UIDevice currentDevice] uniqueIdentifier];
}

UIADeviceType _deviceType;
+ (UIADeviceType) currentDeviceType {
    return _deviceType;
}

+ (void)initialize {
    if ( self == [UIDevice class] ) {
        // FIXME: use device constant to define these
        UIDevice *currentDevice = [UIDevice currentDevice];
        if ( [[currentDevice model] isEqualToString:@"iPhone"] ) {
            _deviceType = UIADeviceTypePhone;
        } else if ( [[currentDevice model] isEqualToString:@"iPod touch"] ) {
            _deviceType = UIADeviceTypePod;
        } else if ( [[currentDevice model] isEqualToString:@"iPad"] ) {
            _deviceType = UIADeviceTypePad;
        } else {
            _deviceType = UIADeviceTypeUnknown;
            NSLog(@"failed to detect device!!");
            // try again
            CGFloat screenWidth = [UIScreen mainScreen].applicationFrame.size.width;
            dlog(TRUE, @"check device resolution: %.0f", screenWidth);
            if ( screenWidth == 320.0f ) {
                _deviceType = UIADeviceTypePhone;
            } else if ( screenWidth == 768.0f ) {
                _deviceType = UIADeviceTypePad;
            } else {
                _deviceType = UIADeviceTypeUnknown;
                dassert(NO);
            }
        }
    }
}

@end
