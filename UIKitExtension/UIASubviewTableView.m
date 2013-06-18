//
//  UIASubviewTableView.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 5. 11..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "NSString.h"
#import "UITableView.h"

#import "NSAOverridingMediator.h"

#import "UIASubviewTableView.h"


@interface _UIASubviewTableViewDataSource: NSObject<UITableViewDataSource> {
    UIASubviewTableView *_owner;
}

@property(nonatomic, readonly) UIASubviewTableView *owner;

@end


@implementation _UIASubviewTableViewDataSource

@synthesize owner=_owner;

- (id)initWithOwner:(UIASubviewTableView *)owner {
    self = [super init];
    if (self != nil) {
        self->_owner = owner;
    }
    return self;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if (![super respondsToSelector:aSelector]) {
        return NO;
    }
    if (aSelector == @selector(tableView:numberOfRowsInSection:) ||
        aSelector == @selector(tableView:cellForRowAtIndexPath:)) {
        return YES;
    }
    id source = self.owner.subviewSource;
    BOOL responds = [source respondsToSelector:aSelector];
    return responds;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id owner = self.owner;
    NSUInteger count = [[owner subviewSource] subviewTableViewNumberOfSubviews:owner];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = [@"%d:%d" format0:nil, indexPath.section, indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [UITableViewCell cellWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    UIView *view = [self.owner.subviewSource subviewTableView:self.owner viewForRow:indexPath.row];
    [cell.contentView addSubview:view];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.owner.subviewSource tableView:tableView canEditRowAtIndexPath:indexPath];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.owner.subviewSource tableView:tableView canMoveRowAtIndexPath:indexPath];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [self.owner.subviewSource tableView:tableView sectionForSectionIndexTitle:title atIndex:index];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.owner.subviewSource tableView:tableView commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    return [self.owner.subviewSource tableView:tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}

@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"

@implementation UIASubviewTableView

@synthesize subviewSource=_subviewSource;

- (void)_subviewTableViewInit {
    self->_dataSourceImpl = [[_UIASubviewTableViewDataSource alloc] initWithOwner:self];
    self.dataSource = self->_dataSourceImpl;
    self.delegate = self;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        id dataSource = self.dataSource;
        NSAssert(dataSource == nil || dataSource == self, @"");
        [self _subviewTableViewInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self != nil) {
        [self _subviewTableViewInit];
    }
    return self;
}

- (void)dealloc {
    [self->_dataSourceImpl release];
    [self->_delegateMediator release];
    [super dealloc];
}

- (id<UITableViewDataSource>)dataSource {
    return self->_dataSourceImpl;
}

- (void)setDataSource:(id<UITableViewDataSource>)dataSource {
    if ([dataSource isKindOfClass:[_UIASubviewTableViewDataSource class]]) {
        [super setDataSource:dataSource];
    } else {
        @throw [NSException exceptionWithName:@"UIASubviewTableViewError" reason:@"UIASubviewTableView dataSource is not assignable. Try subviewSource." userInfo:nil];
    }
}

- (void)setSubviewSource:(id<UIASubviewTableSubviewSource>)subviewSource {
    self->_subviewSource = subviewSource;
    self->_subviewTableViewFlags.subviewSourceViewHeightForRow = [subviewSource respondsToSelector:@selector(subviewTableView:viewHeightForRow:)];
    [super setDataSource:nil];
    [super setDataSource:self->_dataSourceImpl];
}

- (void)setDelegate:(id<UITableViewDelegate>)delegate {
    if (delegate == self) {
        [super setDelegate:delegate];
    } else {
        [self->_delegateMediator release];
        self->_delegateMediator = [[NSAOverridingMediator alloc] initWithOrigin:self override:delegate suppressive:NO];
        [super setDelegate:self->_delegateMediator];
    }
}

#pragma mark table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self->_subviewTableViewFlags.subviewSourceViewHeightForRow) {
        return [self.subviewSource subviewTableView:self viewHeightForRow:indexPath.row];
    }
    CGFloat height = [self.subviewSource subviewTableView:self viewForRow:indexPath.row].frame.size.height;
    return height;
}


@end

#pragma clang diagnostic pop
