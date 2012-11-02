//
//  FSEventStream.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 28..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief FSEventStream wrapper in [<FSEvents.h>][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/FSEvents_Ref/Reference/reference.html
 */

@class FSEventStream;

/*!
 *  @brief FSEventSteam delegate
 */
@protocol FSEventStreamDelegate

/*!
 *  @brief Event delegate for each event.
 *  @param eventStream The event stream does send message.
 *  @param path The path event triggered.
 *  @param eventFlags Triggered event flags.
 *  @param eventId Event id.
 */
- (void)eventStream:(FSEventStream *)eventStream path:(NSString *)path event:(FSEventStreamEventFlags)eventFlags id:(FSEventStreamEventId)eventId;

@end

/*!
 *  @brief FSEventSteam object wrapper
 *  @details Interface design is based on NSTimer, if available. This doesn't work with App sandbox model.
 *  @see [<FSEvents.h>][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/FSEvents_Ref/Reference/reference.html
 */
@interface FSEventStream : NSObject {
    FSEventStreamRef _stream;
    id<FSEventStreamDelegate> _delegate;

    NSUInteger _managedRetainCount;
}

//! @brief Delegate object for event stream. 
@property(nonatomic, assign) id<FSEventStreamDelegate> delegate;
//! @brief Latest event id of event stream.
@property(nonatomic, readonly) FSEventStreamEventId latestEventId;

/*!
 *  @brief Returns an initiailized event stream with given paths, latency, create flags and delegate.
 *  @param paths Array of NSString, each specifying a path to a directory, signifying the root of a filesystem hierarchy to be watched for modifications.
 *  @param latency The number of seconds the service should wait after hearing about an event from the kernel before passing it along to the client via its callback. Specifying a larger value may result in more effective temporal coalescing, resulting in fewer callbacks and greater overall efficiency.
 *  @param flags Flags that modify the behavior of the stream being created. See [FSEventStreamCreateFlags][0].
 *  @param The delegate object for the connection. The delegate will receive delegate messages as the file system event. Messages to the delegate will be sent on the thread that calls this method. By default, for the connection to work correctly, the calling thread’s run loop must be operating in the default run loop mode.
 *  @see [FSEventStreamCreate][1]
 *      [0]: https://developer.apple.com/library/mac/documentation/Darwin/Reference/FSEvents_Ref/Reference/reference.html#//apple_ref/doc/c_ref/FSEventStreamCreateFlags
 *      [1]: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/FSEvents_Ref/Reference/reference.html#//apple_ref/doc/c_ref/FSEventStreamCreate
 */
- (id)initWithPaths:(NSArray *)paths latency:(NSTimeInterval)latency flags:(FSEventStreamCreateFlags)flags delegate:(id)delegate;
/*!
 *  @brief Returns a created and scheduled event stream with given paths, latency, create flags and delegate.
 *  @see initWithPaths:latency:flags:delegate:
 *  @see scheduleWithRunLoop:mode:
 */
+ (id)scheduledEventStreamWithPaths:(NSArray *)paths latency:(NSTimeInterval)latency flags:(FSEventStreamCreateFlags)flags delegate:(id)delegate;
/*!
 *  @brief Returns a created and scheduled event stream with given path, latency, create flags and delegate.
 *  @see initWithPaths:latency:flags:delegate:
 *  @see scheduledEventStreamWithPaths:latency:flags:delegate:
 *  @see scheduleWithRunLoop:mode: 
 */
+ (id)scheduledEventStreamWithPath:(NSString *)path latency:(NSTimeInterval)latency flags:(FSEventStreamCreateFlags)flags delegate:(id)delegate;
/*!
 *  @brief Invalidates the stream.
 *  @details Invalidates the stream, like CFRunLoopSourceInvalidate() does for a CFRunLoopSourceRef. It will be unscheduled from any runloops or dispatch queues upon which it had been scheduled.

    @link invalidate @endlink can only be called on the stream after you have called @link scheduleWithRunLoop:mode: @endlink or FSEventStreamSetDispatchQueue().
 *  @see [FSEventStreamInvalidate][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/FSEvents_Ref/Reference/reference.html#//apple_ref/doc/c_ref/FSEventStreamInvalidate
 */
- (void)invalidate;

/*!
 *  @brief Attempts to register with the FS Events service to receive events per the parameters in the stream.
 *  @details This method can only be called once the stream has been scheduled on at least one runloop, via @link -scheduleWithRunLoop:mode: @endlink.

    Once started, the stream can be stopped via FSEventStreamStop().
 *  @return True if it succeeds, otherwise False if it fails. It ought to always succeed, but in the event it does not then your code should fall back to performing recursive scans of the directories of interest as appropriate.
 *  @see [FSEventStreamStart][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/FSEvents_Ref/Reference/reference.html#//apple_ref/doc/c_ref/FSEventStreamStart
 */
- (BOOL)start;
/*!
 *  @brief Unregisters with the FS Events service.
 *  @details The client callback will not be called for this stream while it is stopped.
 *
 *  This method can only be called if the stream has been started, via @link start @endlink.
 *
 *  Once stopped, the stream can be restarted via @link start @endlink, at which point it will resume receiving events from where it left off ("sinceWhen").
 *  @see [FSEventStreamStop][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/FSEvents_Ref/Reference/reference.html#//apple_ref/doc/c_ref/FSEventStreamStop
 */
- (void)stop;

/*!
 *  @brief Schedules the stream on the specified run loop.
 *  @details This method schedules the stream on the specified run loop, like CFRunLoopAddSource() does for a CFRunLoopSourceRef. The caller is responsible for ensuring that the stream is scheduled on at least one run loop and that at least one of the run loops on which the stream is scheduled is being run.
 *
 *  To start receiving events on the stream, call @link start @endlink.
 *
 *  To remove the stream from the run loops upon which it has been scheduled, call @link unscheduleFromRunLoop:mode: @endlink or @link invalidate @endlink.
 *  @param runLoop The run loop on which to schedule the stream.
 *  @param runLoopMode A run loop mode on which to schedule the stream.
 *  @see [FSEventStreamScheduleWithRunLoop][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/FSEvents_Ref/Reference/reference.html#//apple_ref/doc/c_ref/FSEventStreamScheduleWithRunLoop
 */
- (void)scheduleWithRunLoop:(NSRunLoop *)runLoop mode:(NSString *)mode;
/*!
 *  @brief This method removes the stream from the specified run loop.
 *  @details Like CFRunLoopRemoveSource() does for a CFRunLoopSourceRef.
 *  @see [FSEventStreamUnscheduleFromRunLoop][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/FSEvents_Ref/Reference/reference.html#//apple_ref/doc/c_ref/FSEventStreamUnscheduleFromRunLoop
 */
- (void)unscheduleFromRunLoop:(NSRunLoop *)runLoop mode:(NSString *)mode;

/*!
 *  @brief Asks the FS Events service to flush out any events that have occurred but have not yet been delivered, due to the latency parameter that was supplied when the stream was created.
 *  @details This flushing occurs asynchronously -- do not expect the events to have already been delivered by the time this call returns.
 *
 *  This method can only be called after the stream has been started, via @link start @endlink.
 *  @return The largest event id of any event ever queued for this stream, otherwise zero if no events have been queued for this stream.
 *  @see [FSEventStreamFlushAsync][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/FSEvents_Ref/Reference/reference.html#//apple_ref/doc/c_ref/FSEventStreamFlushAsync
 */
- (FSEventStreamEventId)flushAsync;
/*!
 *  @brief Asks the FS Events service to flush out any events that have occurred but have not yet been delivered, due to the latency parameter that was supplied when the stream was created.
 *  @details This flushing occurs synchronously -- by the time this call returns, your callback will have been invoked for every event that had already occurred at the time you made this call.
 *
 *  This method can only be called after the stream has been started, via @link start @endlink.
 *  @see [FSEventStreamFlushSync][0]
 *      [0]: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/FSEvents_Ref/Reference/reference.html#//apple_ref/doc/c_ref/FSEventStreamFlushSync
 */
- (void)flushSync;

@end
