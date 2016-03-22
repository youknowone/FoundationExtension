//
//  NSTimerRC.h
//  FoundationExtensionRC
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
 *  @brief NSTimer delegate interface protocol
 */
@protocol NSTimerDelegate

/*!
 *  @brief Fired event.
 *  @param timer Fired timer.
 */
- (void)timerHasFired:(NSTimer *)timer;

/*!
 *  @brief Timer should repeat or not.
 *  @param timer Fired timer.
 *  @return YES, timer will be repeated. NO, timer is invalidated.
 */
- (BOOL)timerShouldRepeat:(NSTimer *)timer;

@optional
/*!
 *  @brief Use timerHasFired:. Deprecated by name collision with private method.
 */
- (void)timerFired:(NSTimer *)timer __deprecated;
/*!
 *  @brief Use timerHasFired:. Deprecated by name collision with private method.
 */
- (void)timerDidFire:(NSTimer *)timer __deprecated;

@end


/*!
 *  @brief NSTimer delegate interface
 *  @details Add delegate to NSTimer. With this extension, NSTimer is controllable by delegate pattern.
 */
@interface NSTimer (DelegateRC)

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
