//
//  FSEventStream.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 28..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

@class FSEventStream;

@protocol FSEventStreamDelegate

- (void)eventStream:(FSEventStream *)eventStream path:(NSString *)path event:(FSEventStreamEventFlags)eventFlags id:(FSEventStreamEventId)eventId;

@end

/*!
 *  @brief FSEventSteam object wrapper
 *  @details Interface design is based on NSTimer, if available. This doesn't work with App sandbox model.
 */
@interface FSEventStream : NSObject {
    FSEventStreamRef _stream;
    id _target;
    id _delegate;

    NSUInteger _managedRetainCount;
}

@property(nonatomic, assign) id delegate;
@property(nonatomic, readonly) FSEventStreamEventId latestEventId;

- (id)initWithPaths:(NSArray *)paths latency:(NSTimeInterval)latency flags:(FSEventStreamCreateFlags)flags delegate:(id)delegate;
+ (id)scheduledEventStreamWithPaths:(NSArray *)paths latency:(NSTimeInterval)latency flags:(FSEventStreamCreateFlags)flags delegate:(id)delegate;
+ (id)scheduledEventStreamWithPath:(NSString *)path latency:(NSTimeInterval)latency flags:(FSEventStreamCreateFlags)flags delegate:(id)delegate;

- (void)invalidate;
- (void)start;
- (void)stop;

- (void)scheduleWithRunLoop:(NSRunLoop *)runLoop mode:(NSString *)mode;
- (void)unscheduleFromRunLoop:(NSRunLoop *)runLoop mode:(NSString *)mode;

- (FSEventStreamEventId)flushAsync;
- (void)flushSync;

@end
