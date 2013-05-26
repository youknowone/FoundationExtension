//
//  UIAPlaceholderTextView.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 12..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "UIView.h"

#import "UIAPlaceholderTextView.h"

@implementation UIAPlaceholderTextView

@synthesize placeholderAnimated=_placeholderAnimated;

- (void)_didBeginEditing {
    self->_editing = YES;
    [self->_placeholderTextView setHidden:YES != 0 animated:self->_placeholderAnimated && self->_placeholderString.length > 0];
}

- (void)_textDidChanged {
    if (!self->_editing) {
        [self->_placeholderTextView setHidden:self.text.length != 0 animated:self->_placeholderAnimated && self->_placeholderString.length > 0];
    }
}

- (void)_didEndEditing {
    [self->_placeholderTextView setHidden:self.text.length != 0 animated:self->_placeholderAnimated && self->_placeholderString.length > 0];
    self->_editing = NO;
}

- (void)UIAPlaceholderTextViewInit {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_didBeginEditing) name:UITextViewTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_textDidChanged) name:UITextViewTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_didEndEditing) name:UITextViewTextDidEndEditingNotification object:nil];

    UITextView *view = self->_placeholderTextView = [[UITextView alloc] initWithFrame:self.bounds];
    view.backgroundColor = [UIColor clearColor];
    view.textColor = [UIColor grayColor];
    view.editable = NO;
    view.userInteractionEnabled = NO;
    view.contentMode = UIViewContentModeScaleToFill;
    view.hidden = NO;
    self->_placeholderAnimated = YES;
    [self addSubview:self->_placeholderTextView];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        [self UIAPlaceholderTextViewInit];
        self->_placeholderTextView.font = self.font;
        self->_placeholderTextView.textAlignment = self.textAlignment;
        [self _textDidChanged];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        [self UIAPlaceholderTextViewInit];
    }
    return self;
}

- (void)dealloc {
    [self->_placeholderTextView release];
    self.placeholderString = nil;
    [super dealloc];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self->_placeholderTextView.frame = self.bounds;
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self _textDidChanged];
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    [self->_placeholderTextView setFont:font];
}

#pragma mark -

- (NSString *)placeholderString {
    return self->_placeholderString;
}

- (void)setPlaceholderString:(NSString *)placeholderString {
    if (self.placeholderAnimated && self->_placeholderString.length == 0 && !self->_placeholderTextView.hidden) {
        [self->_placeholderTextView setHidden:YES];
        [self->_placeholderTextView setHidden:NO animated:YES];
    }
    [self->_placeholderString autorelease];
    self->_placeholderString = [placeholderString copy];

    self->_placeholderTextView.text = placeholderString;
}

- (UIColor *)placeholderColor {
    return self->_placeholderTextView.textColor;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    self->_placeholderTextView.textColor = placeholderColor;
}

- (UITextView *)placeholderTextView {
    return self->_placeholderTextView;
}

@end
