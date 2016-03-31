//
//  UIDevice.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 6..
//  Copyright 2010 youknowone.org All rights reserved.
//

#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

#import "UIDevice.h"

#import "NSString.h"
#import "debug.h"

@implementation UIDevice (Shortcuts)

- (NSAVersion *)systemVersionParts {
    return [NSAVersion versionWithString:self.systemVersion];
}

+ (UIADeviceType)currentDeviceType {
    switch ([[self currentDevice] userInterfaceIdiom]) {
        case UIUserInterfaceIdiomPad:
            return UIADeviceTypePad;
        default:
            break;
    }
    return UIADeviceTypePhone;
}

- (NSString *)uniqueToken {
    NSString *token = nil;
    if ([self respondsToSelector:@selector(identifierForVendor)]) {
        // iOS6
        id uuid = [self performSelector:@selector(identifierForVendor)];
        token = [uuid UUIDString];
    }
    else {
        // under iOS6
        CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
        token = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuid));
    }
    return token;
}

@end


@implementation UIDevice (MACAddress)

- (NSData *)MACAddressData {
    #define MAC_LENGTH 6
    int res = if_nametoindex("en0");
    if (res == 0) {
        return nil; // en0 is not supported
    }

    int infoName[6] = {CTL_NET, AF_ROUTE, 0, AF_LINK, NET_RT_IFLIST, 0};
    infoName[5] = if_nametoindex("en0");

    size_t length;
    res = sysctl(infoName, 6, NULL, &length, NULL, 0);
    if (res < 0) {
        return nil; // sysctl error
    }

    char buffer[length];
    res = sysctl(infoName, 6, buffer, &length, NULL, 0);
    if (res < 0) {
        return nil; // sysctl error
    }

    struct if_msghdr *interfaceMessage = (struct if_msghdr *)buffer;
    struct sockaddr_dl *socketAddress = (struct sockaddr_dl *)(interfaceMessage + 1);

    unsigned char *macAddress = malloc(sizeof(unsigned char) * MAC_LENGTH);
    memcpy(macAddress, socketAddress->sdl_data + socketAddress->sdl_nlen, MAC_LENGTH);

    return [NSData dataWithBytesNoCopy:macAddress length:MAC_LENGTH freeWhenDone:YES];
    #undef MAC_LENGTH
}

- (NSString *)MACAddress {
    NSData *MACData = [self MACAddressData];
    if (MACData == nil) {
        return nil;
    }
    const unsigned char *m = MACData.bytes;
    return [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", m[0], m[1], m[2], m[3], m[4], m[5], nil];
}

@end
