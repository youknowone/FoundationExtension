//
//  NSAAppDelegate.h
//  CocoaExtensionTestApp
//
//  Created by Jeong YunWon on 12. 11. 18..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

@import Cocoa;
@import CocoaExtension;

@interface NSAAppDelegate : NSObject <NSApplicationDelegate>

@property(nonatomic, assign) IBOutlet NSWindow *window;
@property(nonatomic, assign) IBOutlet NSTextView *textView;

@property(nonatomic, assign) IBOutlet NSAImageWell *imageWell;

@end
