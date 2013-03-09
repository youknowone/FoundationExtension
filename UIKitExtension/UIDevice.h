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
#define UIADeviceTypeIsIPhoneOrIPod(deviceType) ((deviceType & UIADeviceTypeIsIPhoneOrIPodMask)>>1)

@interface UIDevice (Shortcuts)

//! @deprecated Use -userInterfaceIdiom
+ (UIADeviceType)currentDeviceType __deprecated;

//! @deprecated deprecated by implementation deprecation
+ (NSString *)uniqueIdentifier __deprecated;

/*
 *  @brief Get UUID for vendor for later than iOS6 or device identifier.
 */
- (NSString *)uniqueToken;

@end
