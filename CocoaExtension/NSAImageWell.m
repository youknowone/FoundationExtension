//
//  NSAImageWell.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 23..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <cdebug/debug.h>
#import <FoundationExtension/FoundationExtension.h>

#import "NSGeometry.h"
#import "NSImage.h"
#import "NSPasteboard.h"

#import "NSAImageWell.h"

#define DEBUG_TEST 1


@implementation NSAImageWell

@synthesize acceptsStringDragging=_acceptsStringDragging;

- (void)_NSAImageWellInit {
    self->_imageURLs = [[NSMutableArray alloc] init];
    self->_nonImageURLs = [[NSMutableArray alloc] init];
    NSArray *pasteboardTypes = [[NSImage imageTypes] arrayByAddingObject:NSPasteboardTypeString];
    [self registerForDraggedTypes:pasteboardTypes];
}

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _NSAImageWellInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _NSAImageWellInit];
    }
    return self;
}


- (id<NSAImageWellDelegate>)delegate {
    return self->_delegate;
}

- (void)setDelegate:(id<NSAImageWellDelegate>)delegate {
    if (self->_delegate == delegate) return;
    self->_delegate = delegate;
    self->_imageWellFlags.delegateShouldAcceptURLString = [delegate respondsToSelector:@selector(imageWellShouldAcceptURLString:)];
    self->_imageWellFlags.delegateDidDraggingEntered = [delegate respondsToSelector:@selector(imageWell:didDraggingEntered:)];
    self->_imageWellFlags.delegateDidDraggingExited = [delegate respondsToSelector:@selector(imageWell:didDraggingExited:)];
    self->_imageWellFlags.delegateWillReceiveDragging = [delegate respondsToSelector:@selector(imageWell:willReceiveDragging:)];
    self->_imageWellFlags.delegateDidReceiveDragging = [delegate respondsToSelector:@selector(imageWell:didReceiveDragging:)];
}

- (NSURL *)imageURL {
    return self->_imageURL;
}

- (void)setImageURL:(NSURL *)imageURL {
    if (self->_imageURL == imageURL) return;
    self->_imageURL = [imageURL copy];
    self.image = [NSImage imageByReferencingURL:imageURL];
}

#pragma mark - NSDraggingDestination

NSURL *NSAImageWellURLFromPasteboard(NSPasteboard *pasteboard);
NSURL *NSAImageWellURLFromPasteboard(NSPasteboard *pasteboard) {
    NSURL *URL = [NSURL URLFromPasteboard:pasteboard];
    if (URL == nil) {
        NSString *URLString = [NSString stringFromPasteboard:pasteboard];
        if (URLString == nil) {
            return nil;
        }
        URL = URLString.smartURL;
        if (URL == nil) {
            URL = [URLString stringByAddingPercentEncodingForURLQuery].smartURL;
            if (URL == nil) {
                return nil;
            }
        }
    }
    return URL;
}

- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender {
    dlog(DEBUG_TEST, @"entered");
    if (sender.draggingSourceOperationMask & NSDragOperationCopy) {
        if (![NSImage canInitWithPasteboard:sender.draggingPasteboard]) {
            BOOL shouldAcceptURLString = self->_acceptsStringDragging;
            if (self->_imageWellFlags.delegateShouldAcceptURLString) {
                shouldAcceptURLString = [self->_delegate imageWellShouldAcceptURLString:self];
            }
            if (!shouldAcceptURLString) {
                goto reject;
            }

            NSURL *URL = NSAImageWellURLFromPasteboard(sender.draggingPasteboard);
            if ([self->_nonImageURLs containsObject:URL]) {
                goto reject;
            }
            if (![self->_imageURLs containsObject:URL]) {
                NSImage *image = [NSImage imageByReferencingURL:URL];
                if (NSSizeEqualToSize(image.size, NSSizeZero)) {
                    [self->_nonImageURLs addObject:URL];
                    goto reject;
                } else {
                    [self->_imageURLs addObject:URL];
                }
            }
        }
        if (self->_imageWellFlags.delegateDidDraggingEntered) {
            [self->_delegate imageWell:self didDraggingEntered:sender];
        }
        return NSDragOperationCopy;
    }
reject:
    return NSDragOperationNone;
}

- (void)draggingExited:(id <NSDraggingInfo>)sender
{
    dlog(DEBUG_TEST, @"existed");
    if (self->_imageWellFlags.delegateDidDraggingExited) {
        [self->_delegate imageWell:self didDraggingExited:sender];
    }
}

- (BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender {
    dlog(DEBUG_TEST, @"preparing");
    BOOL can = [NSImage canInitWithPasteboard:sender.draggingPasteboard];
    if (!can) {
        
    }
    if (can && self->_imageWellFlags.delegateWillReceiveDragging) {
        [self->_delegate imageWell:self willReceiveDragging:sender];
    }
    return YES;
}

- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender {
    dlog(DEBUG_TEST, @"perform");
    if (sender.draggingSource != self) {
        NSURL *URL = nil;
        NSImage *image = nil;
        if ([NSImage canInitWithPasteboard:sender.draggingPasteboard]) {
            image = [NSImage imageWithPasteboard:sender.draggingPasteboard];
            URL = [NSURL URLFromPasteboard:sender.draggingPasteboard];
        } else {
            URL = NSAImageWellURLFromPasteboard(sender.draggingPasteboard);
            if (URL != nil) {
                image = [NSImage imageByReferencingURL:URL];
            }
        }
        if (image != nil) {
            self.image = image;
            self->_imageURL = [URL copy];
            if (self->_imageWellFlags.delegateDidReceiveDragging) {
                [self->_delegate imageWell:self didReceiveDragging:sender];
            }
            return YES;
        }
    }
    return NO;
}

@end
