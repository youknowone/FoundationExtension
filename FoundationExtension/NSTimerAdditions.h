//
//  NSTimerAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

@interface NSTimer (FoundationExtension)

+ (NSTimer *)zeroDelayedTimerWithTarget:(id)aTarget selector:(SEL)aSelector;
+ (NSTimer *)zeroDelayedTimerWithTarget:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo;
+ (NSTimer *)delayedTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector;

+ (NSTimer *)triggerByTimer:(SEL)proc forTarget:(id)target after:(NSTimeInterval)seconds __deprecated;
+ (NSTimer *)triggerByTimer:(SEL)proc forTarget:(id)target __deprecated;

@end
