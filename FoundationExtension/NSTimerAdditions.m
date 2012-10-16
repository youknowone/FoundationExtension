//
//  NSTimerAdditions.m
//  FoundationExtension
//
//  Created by youknowone on 10. 10. 5..
//  Copyright 2010 youknowone.org All rights reserved.
//

#import "NSTimerAdditions.h"

@implementation NSTimer (FoundationExtension)

+ (NSTimer *)zeroDelayedTimerWithTarget:(id)aTarget selector:(SEL)aSelector {
	return [NSTimer scheduledTimerWithTimeInterval:0.0
											target:aTarget
										  selector:aSelector
										  userInfo:nil
										   repeats:NO];
}

+ (NSTimer *)zeroDelayedTimerWithTarget:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo {
	return [NSTimer scheduledTimerWithTimeInterval:0.0
											target:aTarget
										  selector:aSelector
										  userInfo:userInfo
										   repeats:NO];
}

+ (NSTimer *)delayedTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector {
	return [NSTimer scheduledTimerWithTimeInterval:ti target:aTarget selector:aSelector userInfo:nil repeats:NO];
}

+ (NSTimer *)triggerByTimer:(SEL)proc forTarget:(id)target after:(NSTimeInterval)ti {
	return [NSTimer scheduledTimerWithTimeInterval:ti
											target:target
										  selector:proc
										  userInfo:nil
										   repeats:NO];
}

+ (NSTimer *)triggerByTimer:(SEL)proc forTarget:(id)target {
	return [NSTimer scheduledTimerWithTimeInterval:0.0
											target:target
										  selector:proc
										  userInfo:nil
										   repeats:NO];
}

@end
