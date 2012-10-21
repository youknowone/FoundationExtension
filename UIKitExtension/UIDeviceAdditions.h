//
//  UIDeviceAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 6..
//  Copyright 2010 youknowone.org All rights reserved.
//

typedef enum {
    ICDeviceTypeUnknown = 0,
    ICDeviceTypePad    = 1,
    ICDeviceTypePhone  = 2,
    ICDeviceTypePod    = 3,
}    ICDeviceType;
#define ICDeviceTypeIsIPhoneOrIPodMask 2
#define ICDeviceTypeIsIPhoneOrIPod(deviceType) ((deviceType&ICDeviceTypeIsIPhoneOrIPodMask)>>1)

@interface UIDevice (FoundationExtension)

+ (ICDeviceType)currentDeviceType;

// implementation api is deprecated
+ (NSString *)uniqueIdentifier __deprecated;

@end
