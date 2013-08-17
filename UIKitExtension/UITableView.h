//
//  UITableView.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 1. 23..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief [UITableView][0] and [UITableViewCell][0] extension
 *      [0]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UITableView_Class/Reference/Reference.html
 *      [1]: http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UITableViewCell_Class/Reference/Reference.html
 */

#import <UIKit/UIKit.h>

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 70000
#define UITableViewCellAccessoryDetailButton (UITableViewCellAccessoryCheckmark + 1)
#endif

/*!
 *  @brief UITableViewCell shortcuts
 */
@interface UITableViewCell (Shortcuts)

- (void)setReuseIdentifier:(NSString *)reuseIdentifier;

/*!
 *  @brief Creates and returns a table cell with a style and a reuse identifier and returns it to the caller.
 *  @see [initWithStyle:reuseIdentifier:][0]
 *      [0]: http://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableViewCell_Class/Reference/Reference.html#//apple_ref/occ/instm/UITableViewCell/initWithStyle:reuseIdentifier:
 */
+ (id)cellWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier;

@end
