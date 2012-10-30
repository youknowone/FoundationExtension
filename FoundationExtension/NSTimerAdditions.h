//
//  NSTimerAdditions.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

/*!
 *  @brief NSRunLoop shortcuts.
 */
@interface NSTimer (FE_NSRunLoop)

/*!
 *  @brief Add timer to current run loop with default run loop mode
 */
- (void)schedule;
/*!
 *  @brief Add timer to given runLoop with given mode.
 *  @param runLoop
 *      runLoop to add timer.
 *  @param mode
 *      runLoop mode.
 */
- (void)scheduleWithRunLoop:(NSRunLoop *)runLoop mode:(NSString *)mode;

@end


/*!
 *  @brief NSTimer delegate interface protocol
 */
@protocol NSATimerDelegate

/*!
 *  @brief fired event.
 */
- (void)timerFired:(NSTimer *)timer;
/*!
 *  @brief Timer should repeat or not.
 */
- (BOOL)timerShouldRepeat:(NSTimer *)timer;

@end


/*!
 *  @brief NSTimer delegate interface
 */
@interface NSTimer (FE_Delegate)

/*!
 *  @brief Initialize timer with delegate.
 */
- (id)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti delegate:(id<NSATimerDelegate>)delegate;
/*!
 *  @brief Creates, schedules and returns timer with delegate.
 */
+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)ti delegate:(id<NSATimerDelegate>)delegate;

@end

// not recomenned to use.
@interface NSTimer (FE_Shortcuts)

+ (NSTimer *)zeroDelayedTimerWithTarget:(id)aTarget selector:(SEL)aSelector;
+ (NSTimer *)zeroDelayedTimerWithTarget:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo;
+ (NSTimer *)delayedTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector;

@end
