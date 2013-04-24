//
//  NSPasteboard.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 24..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "NSArray.h"

#import "NSPasteboard.h"

@implementation NSPasteboard (Shortcuts)

- (id)readObjectForClass:(Class)aClass options:(NSDictionary *)options {
    NSArray *objects = [self readObjectsForClasses:@[aClass] options:options];
    if (objects.count == 0) {
        return nil;
    }
    return [objects :0];
}

@end


@implementation NSString (NSPasteboard)

+ (NSString *)stringFromPasteboard:(NSPasteboard *)pasteboard {
    return [pasteboard readObjectForClass:[NSString class] options:@{}];
}

@end
