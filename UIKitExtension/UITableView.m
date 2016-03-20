//
//  UITableView.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 1. 23..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <FoundationExtension/FoundationExtension.h>

#import "NSObject.h"
#import "UITableView.h"

@implementation UITableViewCell (Shortcuts)

NSAPropertyRetainSetter(setReuseIdentifier, @"_reuseIdentifier")

+ (instancetype)cellWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier {
    return [[self alloc] initWithStyle:style reuseIdentifier:reuseIdentifier];
}

- (UITableView *)tableView {
    UIView *superview = self.superview;
    if (![superview isKindOfClass:[UITableView class]]) { // iOS7
        superview = superview.superview;
    }
    return (id)superview;
}

- (NSIndexPath *)indexPath {
    return [self.tableView indexPathForCell:self];
}

@end
