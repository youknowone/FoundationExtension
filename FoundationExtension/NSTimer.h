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
 *  @brief Creates, schedules and returns timer with delegate.
 */
+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)ti delegate:(id<NSTimerDelegate>)delegate;

@end

// not recomenned to use.
@interface NSTimer (Shortcuts)

+ (NSTimer *)zeroDelayedTimerWithTarget:(id)aTarget selector:(SEL)aSelector;
+ (NSTimer *)zeroDelayedTimerWithTarget:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo;
+ (NSTimer *)delayedTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector;

@end
