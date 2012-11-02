//
//  UIDevice.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 6..
//  Copyright 2010 youknowone.org All rights reserved.
//

typedef enum {
    UIADeviceTypeUnknown = 0,
    UIADeviceTypePad    = 1,
    UIADeviceTypePhone  = 2,
    UIADeviceTypePod    = 3,
}   UIADeviceType;
#define UIADeviceTypeIsIPhoneOrIPodMask 2
#define UIADeviceTypeIsIPhoneOrIPod(deviceType) ((deviceType&ICDeviceTypeIsIPhoneOrIPodMask)>>1)

@interface UIDevice (Shortcuts)

+ (UIADeviceType)currentDeviceType;

//! @deprecated deprecated by implementation deprecation
+ (NSString *)uniqueIdentifier __deprecated;

@end
