//
//  NSAAppDelegate.m
//  CocoaExtensionTestApp
//
//  Created by Jeong YunWon on 12. 11. 18..
//  Copyright (c) 2012년 youknowone.org. All rights reserved.
//

#import "NSAAppDelegate.h"

@implementation NSAAppDelegate
@synthesize window=_window;
@synthesize textView=_textView;
@synthesize imageWell=_imageWell;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.textView.placeholderString = @"Hi! This is place holder string, to test long long message drawing!";
    self.imageWell.acceptsStringDragging = YES;
}

@end
