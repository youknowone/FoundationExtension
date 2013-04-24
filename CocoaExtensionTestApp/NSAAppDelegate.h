//
//  NSAAppDelegate.h
//  CocoaExtensionTestApp
//
//  Created by Jeong YunWon on 12. 11. 18..
//  Copyright (c) 2012년 youknowone.org. All rights reserved.
//

@interface NSAAppDelegate : NSObject <NSApplicationDelegate>

@property(nonatomic, assign) IBOutlet NSWindow *window;
@property(nonatomic, assign) IBOutlet NSTextView *textView;

@property(nonatomic, assign) IBOutlet NSAImageWell *imageWell;

@end
