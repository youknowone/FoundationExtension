//
//  NSTimerRC.m
//  FoundationExtensionRC
//
//  Created by Jeong YunWon on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSTimerRC.h"


@interface NSTimer ()

- (void)schedule; // Defined in FoundationExtension

@end


@implementation NSTimer (DelegateRC)

static void _NSATimerDelegateCallback(CFRunLoopTimerRef timer, void *info) {
    id<NSTimerDelegate> delegate = info;
    [delegate timerHasFired:(NSTimer *)timer];
    if (![delegate timerShouldRepeat:(NSTimer *)timer]) {
        CFRunLoopTimerInvalidate(timer);
    };
}

- (id)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti delegate:(id)delegate {
    [[self init] release]; // This removes warning, but stupid... whatever. it will not require high performance...
    CFRunLoopTimerContext context = {0, delegate, NULL, NULL, NULL};
    self = (NSTimer *)CFRunLoopTimerCreate(kCFAllocatorDefault, [date timeIntervalSinceReferenceDate], ti, 0, 0, &_NSATimerDelegateCallback, &context);
    return self;
}

+ (id)timerWithTimeInterval:(NSTimeInterval)ti delegate:(id<NSTimerDelegate>)delegate {
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:ti];
    NSTimer *timer = [[self alloc] initWithFireDate:fireDate interval:ti delegate:delegate];
    return [timer autorelease];
}

+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)ti delegate:(id<NSTimerDelegate>)delegate {
    NSTimer *timer = [self timerWithTimeInterval:ti delegate:delegate];
    [timer schedule];
    return timer;
}

@end
