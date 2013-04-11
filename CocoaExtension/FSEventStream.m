//
//  FSEventStream.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 28..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import "NSArray.h"

#import "FSEventStream.h"

#include "debug.h"

@interface FSEventStream ()

// NOTE: These can be replaced with FSEventStreamCreateContext retain/release callback
- (id)_managedRetain;
- (id)_managedRelease;

@end

@implementation FSEventStream
@synthesize delegate=_delegate;

static void FSEventStreamCommonCallback(ConstFSEventStreamRef streamRef,
                                        void *userData,
                                        size_t numEvents,
                                        void *eventPaths,
                                        const FSEventStreamEventFlags eventFlags[],
                                        const FSEventStreamEventId eventIds[]) {
    FSEventStream *self = (FSEventStream *)userData;
    NSArray *paths = (NSArray *)eventPaths;
    for (size_t i = 0; i < numEvents; i += 1) {
        [self.delegate eventStream:self path:[paths :i] event:eventFlags[i] id:eventIds[i]];
    }
}

- (id)initWithPaths:(NSArray *)paths latency:(NSTimeInterval)latency flags:(FSEventStreamCreateFlags)flags delegate:(id)delegate {
    self = [super init];
    if (self != nil) {
        self.delegate = delegate;
        FSEventStreamContext context = {0, (void *)self, NULL, NULL, NULL};
        self->_stream = FSEventStreamCreate(NULL,
                                            &FSEventStreamCommonCallback,
                                            &context,
                                            (CFArrayRef)paths,
                                            kFSEventStreamEventIdSinceNow, /* Or a previous event ID */
                                            (CFAbsoluteTime)latency,
                                            flags|kFSEventStreamCreateFlagUseCFTypes
                                            );

    }
    return self;
}

+ (id)scheduledEventStreamWithPath:(NSString *)path latency:(NSTimeInterval)latency flags:(FSEventStreamCreateFlags)flags delegate:(id)delegate {
    return [self scheduledEventStreamWithPaths:[NSArray arrayWithObject:path] latency:latency flags:flags delegate:delegate];
}

+ (id)scheduledEventStreamWithPaths:(NSArray *)paths latency:(NSTimeInterval)latency flags:(FSEventStreamCreateFlags)flags delegate:(id)delegate {
    FSEventStream *obj = [[self alloc] initWithPaths:paths latency:latency flags:flags delegate:delegate];
    [obj scheduleWithRunLoop:[NSRunLoop currentRunLoop] mode:NSDefaultRunLoopMode];
    [obj start];
    return [obj autorelease];
}

- (void)dealloc {
    FSEventStreamRelease(self->_stream);
    [super dealloc];
}

- (FSEventStreamEventId)latestEventId {
    return FSEventStreamGetLatestEventId(self->_stream);
}

- (id)_managedRetain {
    if (self->_managedRetainCount == 0) {
        [self retain];
    }
    self->_managedRetainCount += 1;
    return self;
}

- (id)_managedRelease {
    dassertlog(self->_managedRetainCount > 0, @"Over-released");
    self->_managedRetainCount -= 1;
    if (self->_managedRetainCount == 0) {
        [self release];
    }
    return self;
}

- (void)scheduleWithRunLoop:(NSRunLoop *)runLoop mode:(NSString *)mode {
    [self _managedRetain];
    FSEventStreamScheduleWithRunLoop(self->_stream, [runLoop getCFRunLoop], (CFStringRef)mode);
}

- (void)unscheduleFromRunLoop:(NSRunLoop *)runLoop mode:(NSString *)mode {
    FSEventStreamUnscheduleFromRunLoop(self->_stream, [runLoop getCFRunLoop], (CFStringRef)mode);
    [self _managedRelease];
}

- (void)invalidate {
    FSEventStreamInvalidate(self->_stream);
    if (self->_managedRetainCount > 0) {
        self->_managedRetainCount = 0;
        [self release];
    }
}

- (BOOL)start {
    return FSEventStreamStart(self->_stream);
}

- (void)stop {
    FSEventStreamStop(self->_stream);
}

- (FSEventStreamEventId)flushAsync {
    return FSEventStreamFlushAsync(self->_stream);
}

- (void)flushSync {
    FSEventStreamFlushSync(self->_stream);
}

@end
