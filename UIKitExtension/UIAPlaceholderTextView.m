//
//  UIAPlaceholderTextView.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 12..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "UIAPlaceholderTextView.h"

@implementation UIAPlaceholderTextView

- (void)_textDidChanged {
    if (self.text.length != 0) {
        [self->_placeholderTextView removeFromSuperview];
    } else {
        [self addSubview:self->_placeholderTextView];
    }
}

- (void)UIAPlaceholderTextViewInit {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_textDidChanged) name:UITextViewTextDidChangeNotification object:nil];

    UITextView *view = self->_placeholderTextView = [[UITextView alloc] initWithFrame:self.bounds];
    view.backgroundColor = [UIColor clearColor];
    view.textColor = [UIColor grayColor];
    view.editable = NO;
    view.userInteractionEnabled = NO;
    view.contentMode = UIViewContentModeScaleToFill;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        [self UIAPlaceholderTextViewInit];
        self->_placeholderTextView.font = self.font;
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

@end
