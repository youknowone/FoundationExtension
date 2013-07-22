//
//  UIAPreparedCellTableView.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 7..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <cdebug/debug.h>
#import "UIAPreparedCellTableView.h"

@interface UIAPreparedCellTableView () {
    BOOL _hasUniqueSection;
    NSArray *_cells;
}

- (NSArray *)cellsForSection:(NSUInteger)section;

@end


@implementation UIAPreparedCellTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self != nil) {
        self.dataSource = self;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        self.dataSource = self;
    }
    return self;
}

- (BOOL)hasUniqueSection {
    return _hasUniqueSection;
}

- (void)setHasUniqueSection:(BOOL)hasUniqueSection {
    if (self->_hasUniqueSection == hasUniqueSection) return;

    self->_hasUniqueSection = hasUniqueSection;
    
    [self reloadData];
}

- (NSArray *)cells {
    return _cells;
}

- (void)setCells:(NSArray *)cells {
    if (self->_cells == cells) return;

    [cells retain];
    [self->_cells release];
    self->_cells = cells;

    [self reloadData];
}

- (NSArray *)cellsForSection:(NSUInteger)section {
    if (self->_hasUniqueSection) {
        return self.cells;
    } else {
        return self.cells[section];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self->_hasUniqueSection) {
        return 1;
    } else {
        return [self.cells count];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self cellsForSection:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self cellsForSection:indexPath.section][indexPath.row];
    dassert([cell isKindOfClass:[UITableViewCell class]]);
    return cell;
}

@end
