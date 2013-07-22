//
//  UIViewController.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 5. 22..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  @brief [UIViewController][0] shortcut extension
 *
 *      [0]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIViewController_Class/
 */
@interface UIViewController (Shortcuts)

/*!
 *  @brief Returns a newly initialized view controller with the nib file in the specified bundle. This method attach platform suffix 'iPhone' or 'iPad' end of its nib name.
 *  @param nibNameOrNil The name of the nib file except 'iPhone' or 'iPad' suffix to associate with the view controller. The nib file name should not contain any leading path information. If you specify nil, the nibName property is set to nil.
 *  @param nibBundleOrNil The bundle in which to search for the nib file. This method looks for the nib file in the bundle's language-specific project directories first, followed by the Resources directory. If nil, this method looks for the nib file in the main bundle.
 *  @return A newly initialized UIViewController object.
 */
- (id)initWithPlatformSuffixedNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

@end
