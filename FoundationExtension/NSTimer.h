//
//  NSTimer.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [NSTimer][0] extension category collection
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSTimer_Class/Reference/NSTimer.html
 */

#import <Foundation/Foundation.h>

/*!
 *  @brief NSTimer extension for [NSRunLoop][0] shortcuts.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSRunLoop_Class/Reference/Reference.html
 */
@interface NSTimer(NSRunLoop)

/*!
 *  @brief Add timer to current run loop with default run loop mode
 *  @see scheduleWithRunLoop:mode:
 */
- (void)schedule;
/*!
 *  @brief Add timer to given runLoop with given mode.
 *  @param runLoop runLoop to add timer.
 *  @param mode runLoop mode.
 *  @see schedule
 */
- (void)scheduleWithRunLoop:(NSRunLoop *)runLoop mode:(NSString *)mode;

@end


#if NS_BLOCKS_AVAILABLE
typedef void (^NSATimerBlock)();
/*!
 *  @brief [dispatch][0] Shortcuts, not really NSTimer-related implementation.
 *  @warning This impelentation is testing.
 *      [0]: http://developer.apple.com/library/ios/#documentation/General/Conceptual/ConcurrencyProgrammingGuide/GCDWorkQueues/GCDWorkQueues.html#//apple_ref/doc/uid/TP40008091-CH103-SW1
 */
@interface NSTimer(dispatch)

/*!
 *  @brief Dispatch a block.
 *  @param ti Time Interval
 *  @param block A block to dispatch.
 */
+ (void)dispatchTimerWithTimeInterval:(NSTimeInterval)ti block:(NSATimerBlock)block;

@end
#endif


/*!
 *  @brief NSTimer delegate interface protocol
 */
@protocol NSTimerDelegate

/*!
 *  @brief Fired event.
 *  @param timer Fired timer.
 */
- (void)timerFired:(NSTimer *)timer;
/*!
 *  @brief Timer should repeat or not.
 *  @param timer Fired timer.
 *  @return YES, timer will be repeated. NO, timer is invalidated.
 */
- (BOOL)timerShouldRepeat:(NSTimer *)timer;

@end


/*!
 *  @brief NSTimer delegate interface
 *  @details Add delegate to NSTimer. With this extension, NSTimer is controllable by delegate pattern.
 */
@interface NSTimer (Delegate)

/*!
 *  @brief Initialize timer with delegate.
 */
- (id)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti delegate:(id<NSTimerDelegate>)delegate;
/*!
 *  @brief Creates and returns timer with delegate.
 */
+ (id)timerWithTimeInterval:(NSTimeInterval)ti delegate:(id<NSTimerDelegate>)delegate;
/*!
 *  @brief Creates, schedules and returns timer with delegate.
 */
+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)ti delegate:(id<NSTimerDelegate>)delegate;

@end


/*!
 *  @brief NSTimer shortcuts - deprecated candidates.
 */
@interface NSTimer (Shortcuts)

+ (NSTimer *)zeroDelayedTimerWithTarget:(id)aTarget selector:(SEL)aSelector;
+ (NSTimer *)zeroDelayedTimerWithTarget:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo;
+ (NSTimer *)delayedTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector;

@end
