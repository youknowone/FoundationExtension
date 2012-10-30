//
//  NSTimerAdditions.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSTimerAdditions.h"

@implementation NSTimer (FE_NSRunLoop)

- (void)schedule {
    [self scheduleWithRunLoop:[NSRunLoop currentRunLoop] mode:NSDefaultRunLoopMode];
}

- (void)scheduleWithRunLoop:(NSRunLoop *)runLoop mode:(NSString *)mode {
    [[NSRunLoop currentRunLoop] addTimer:self forMode:mode];
}

@end


@implementation NSTimer (FE_Delegate)

static void NSTimerDelegateCallback(CFRunLoopTimerRef timer, void *info) {
    id<NSATimerDelegate> delegate = info;
    [delegate timerFired:(NSTimer *)timer];
    if (![delegate timerShouldRepeat:(NSTimer *)timer]) {
        CFRunLoopTimerInvalidate(timer);
    };
}

- (id)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti delegate:(id)delegate {
    CFRunLoopTimerContext context = {0, delegate, NULL, NULL, NULL};
    self = (NSTimer *)CFRunLoopTimerCreate(kCFAllocatorDefault, [date timeIntervalSinceReferenceDate], ti, 0, 0, &NSTimerDelegateCallback, &context);
    return self;
}

+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)ti delegate:(id<NSATimerDelegate>)delegate {
    NSTimer *timer = [[self alloc] initWithFireDate:[NSDate date] interval:ti delegate:delegate];
    [timer schedule];
    return timer;
}

@end


@implementation NSTimer (FE_Shortcuts)

+ (NSTimer *)zeroDelayedTimerWithTarget:(id)aTarget selector:(SEL)aSelector {
    return [self scheduledTimerWithTimeInterval:0.0
                                         target:aTarget
                                       selector:aSelector
                                       userInfo:nil
                                        repeats:NO];
}

+ (NSTimer *)zeroDelayedTimerWithTarget:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo {
    return [self scheduledTimerWithTimeInterval:0.0
                                         target:aTarget
                                       selector:aSelector
                                       userInfo:userInfo
                                        repeats:NO];
}

+ (NSTimer *)delayedTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector {
    return [self scheduledTimerWithTimeInterval:ti target:aTarget selector:aSelector userInfo:nil repeats:NO];
}

@end
