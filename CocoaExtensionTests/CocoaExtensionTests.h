//
//  CocoaExtensionTests.h
//  CocoaExtensionTests
//
//  Created by Jeong YunWon on 12. 10. 28..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import <CocoaExtension/CocoaExtension.h>

#import <SenTestingKit/SenTestingKit.h>

@interface CocoaExtensionTests : SenTestCase<FSEventStreamDelegate> {
    NSURL *tmpURL;
    BOOL testFSEvents;
}

@end
