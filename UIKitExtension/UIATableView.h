//
//  UITableView.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 11. 6. 21..
//  Copyright 2011 youknowone.org All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIATableViewCellCopyableDelegate;

@interface UIATableViewCellCopyable : UITableViewCell {
    id<UIATableViewCellCopyableDelegate> _delegate;
    struct {
        int hasDelegateSelectionStyle:1;
        int hasDelegateString:1;
        int hasDelegateWillShowMenu:1;
        int hasDelegateWillHideMenu:1;
    } _copyableFlags;
}

@property(nonatomic, assign) id<UIATableViewCellCopyableDelegate> delegate;

@end

@protocol UIATableViewCellCopyableDelegate<NSObject>
@optional

- (UITableViewCellSelectionStyle)selectionStyleForCell:(UIATableViewCellCopyable *)cell;
- (NSString *)stringForCell:(UIATableViewCellCopyable *)cell;
- (void)cellWillShowMenu:(UIATableViewCellCopyable *)cell;
- (void)cellWillHideMenu:(UIATableViewCellCopyable *)cell;

@end
