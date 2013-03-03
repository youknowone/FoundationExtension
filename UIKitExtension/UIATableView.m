//
//  UITableView.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 11. 6. 21..
//  Copyright 2011 youknowone.org All rights reserved.
//

#import "UIATableView.h"

static const CFTimeInterval kLongPressMinimumDurationSeconds = 0.36;

@interface UIATableViewCellCopyable ()

- (void)initAsUIATableViewCellCopyable;
- (void)menuWillHide:(NSNotification *)notification;
- (void)menuWillShow:(NSNotification *)notification;
- (void)handleLongPress:(UILongPressGestureRecognizer *)longPressRecognizer;

@end

@implementation UIATableViewCellCopyable
@synthesize delegate=_delegate;

- (void)initAsUIATableViewCellCopyable {
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    [recognizer setMinimumPressDuration:kLongPressMinimumDurationSeconds];
    [self addGestureRecognizer:recognizer];
    [recognizer release];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initAsUIATableViewCellCopyable];
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (void)setDelegate:(id<UIATableViewCellCopyableDelegate>)delegate {
    self->_delegate = delegate;
    self->_copyableFlags.hasDelegateSelectionStyle = [delegate respondsToSelector:@selector(selectionStyleForCell:)];
    self->_copyableFlags.hasDelegateString = [delegate respondsToSelector:@selector(stringForCell:)];
    self->_copyableFlags.hasDelegateWillShowMenu = [delegate respondsToSelector:@selector(cellWillShowMenu:)];
    self->_copyableFlags.hasDelegateWillHideMenu = [delegate respondsToSelector:@selector(cellWillHideMenu:)];
}

#pragma mark -
#pragma mark Copy Menu related methods

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(copy:)) {
        return YES;
    }
    return [super canPerformAction:action withSender:sender];
}

- (void)copy:(id)sender {
    if (self->_copyableFlags.hasDelegateString) {
        NSString *dataText = [self.delegate stringForCell:self];
        [[UIPasteboard generalPasteboard] setString:dataText];
    }
    else {
        [[UIPasteboard generalPasteboard] setString:self.textLabel.text];
    }

    [self resignFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)becomeFirstResponder
{
    return [super becomeFirstResponder];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self isFirstResponder] == NO) {
        return;
    }

    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setMenuVisible:NO animated:YES];
    [menu update];
    [self resignFirstResponder];
}

- (void)menuWillHide:(NSNotification *)notification
{
    if (self->_copyableFlags.hasDelegateWillHideMenu) {
        [self.delegate cellWillHideMenu:self];
    }

    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIMenuControllerWillHideMenuNotification object:nil];
}

- (void)menuWillShow:(NSNotification *)notification
{
    self.selectionStyle = self->_copyableFlags.hasDelegateSelectionStyle ? [self.delegate selectionStyleForCell:self] : UITableViewCellSelectionStyleBlue;

    if (self->_copyableFlags.hasDelegateWillShowMenu) {
        [self.delegate cellWillShowMenu:self];
    }

    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIMenuControllerWillShowMenuNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(menuWillHide:)
                                                 name:UIMenuControllerWillHideMenuNotification
                                               object:nil];
}


#pragma mark -
#pragma mark UILongPressGestureRecognizer Handler Methods

- (void) handleLongPress:(UILongPressGestureRecognizer *)longPressRecognizer
{
    if (longPressRecognizer.state != UIGestureRecognizerStateBegan) {
        return;
    }

    if ([self becomeFirstResponder] == NO) {
        return;
    }

    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:self.bounds inView:self];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(menuWillShow:)
                                                 name:UIMenuControllerWillShowMenuNotification
                                               object:nil];
    [menu setMenuVisible:YES animated:YES];
}

@end
