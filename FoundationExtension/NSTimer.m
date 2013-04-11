//
//  NSTimer.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSTimer.h"

#if NS_BLOCKS_AVAILABLE
@implementation NSTimer (dispatch)

+ (void)dispatchTimerWithTimeInterval:(NSTimeInterval)ti block:(NSATimerBlock)block {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(ti * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}

@end
#endif


@implementation NSTimer (NSRunLoop)

- (void)schedule {
    [self scheduleWithRunLoop:[NSRunLoop currentRunLoop] mode:NSDefaultRunLoopMode];
}

- (void)scheduleWithRunLoop:(NSRunLoop *)runLoop mode:(NSString *)mode {
    [[NSRunLoop currentRunLoop] addTimer:self forMode:mode];
}

@end


@implementation NSTimer (Delegate)

static void NSTimerDelegateCallback(CFRunLoopTimerRef timer, void *info) {
    id<NSTimerDelegate> delegate = info;
    [delegate timerFired:(NSTimer *)timer];
    if (![delegate timerShouldRepeat:(NSTimer *)timer]) {
        CFRunLoopTimerInvalidate(timer);
    };
}

- (id)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti delegate:(id)delegate {
    //[self release]; // Please do not try this!
    CFRunLoopTimerContext context = {0, delegate, NULL, NULL, NULL};
    self = (NSTimer *)CFRunLoopTimerCreate(kCFAllocatorDefault, [date timeIntervalSinceReferenceDate], ti, 0, 0, &NSTimerDelegateCallback, &context);
    return self;
}

+ (id)timerWithTimeInterval:(NSTimeInterval)ti delegate:(id<NSTimerDelegate>)delegate {
    id timer = [[self alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:ti] interval:ti delegate:delegate];
    return [timer autorelease];
}

+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)ti delegate:(id<NSTimerDelegate>)delegate {
    NSTimer *timer = [self timerWithTimeInterval:ti delegate:delegate];
    [timer schedule];
    return timer;
}

@end


@implementation NSTimer (Shortcuts)

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
