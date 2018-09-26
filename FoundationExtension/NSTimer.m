//
//  NSTimer.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSTimer.h"

NS_ASSUME_NONNULL_BEGIN

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

- (void)scheduleWithRunLoop:(NSRunLoop *)runLoop mode:(NSRunLoopMode)mode {
    [[NSRunLoop currentRunLoop] addTimer:self forMode:mode];
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


@interface NSTimer ()

- (void)schedule; // Defined in FoundationExtension

@end


@implementation NSTimer (DelegateRC)

static void _NSATimerDelegateCallback(CFRunLoopTimerRef _timer, void *info) {
    id<NSTimerDelegate> delegate = (__bridge id<NSTimerDelegate>)info;
    NSTimer *timer = (__bridge NSTimer *)_timer;
    [delegate timerHasFired:timer];
    if (![delegate timerShouldRepeat:timer]) {
        [timer invalidate];
    };
}

- (id)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti delegate:(id<NSTimerDelegate>)delegate {
    self = [self init];
    CFRunLoopTimerContext context = {0, (__bridge void *)delegate, NULL, NULL, NULL};
    self = (__bridge NSTimer *)CFRunLoopTimerCreate(kCFAllocatorDefault, [date timeIntervalSinceReferenceDate], ti, 0, 0, &_NSATimerDelegateCallback, &context);
    return self;
}

+ (id)timerWithTimeInterval:(NSTimeInterval)ti delegate:(id<NSTimerDelegate>)delegate {
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:ti];
    NSTimer *timer = [[self alloc] initWithFireDate:fireDate interval:ti delegate:delegate];
    return timer;
}

+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)ti delegate:(id<NSTimerDelegate>)delegate {
    NSTimer *timer = [self timerWithTimeInterval:ti delegate:delegate];
    [timer schedule];
    return timer;
}

@end

NS_ASSUME_NONNULL_END
