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



@implementation NSArray (RC)

- (instancetype)initWithObject:(id)object count:(NSUInteger)count {
    id *objects = (__unsafe_unretained id *)malloc(sizeof(id) * count);
    for (NSUInteger i = 0; i < count; i++) {
        objects[i] = object;
    }
    self = [self initWithObjects:objects count:count];
    free(objects);
    return self;
}

+ (instancetype)arrayWithObject:(id)object count:(NSUInteger)count {
    return [[[self alloc] initWithObject:object count:count] autorelease];
}

- (instancetype)initWithObjectCopy:(id)object count:(NSUInteger)count mutable:(BOOL)flag {
    id *objects = malloc(sizeof(id) * count);
    if (flag) {
        for (NSUInteger i = 0; i < count; i++) {
            objects[i] = [object mutableCopy];
        }
    } else {
        for (NSUInteger i = 0; i < count; i++) {
            objects[i] = [object copy];
        }
    }
    typeof(self) result = [self initWithObjects:objects count:count];
    free(objects);
    return result;

}

@end
