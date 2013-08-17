//
//  UITableView.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 1. 23..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "NSObject.h"
#import "UITableView.h"

@implementation UITableViewCell (Shortcuts)

NSAPropertyRetainSetter(setReuseIdentifier, @"_reuseIdentifier")

+ (id)cellWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier {
    return [[[self alloc] initWithStyle:style reuseIdentifier:reuseIdentifier] autorelease];
}

@end
