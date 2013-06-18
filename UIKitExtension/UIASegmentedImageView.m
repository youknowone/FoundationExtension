//
//  UIASegmentedImageView.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 6. 16..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import "UIImage.h"
#import "UIView.h"

#import "UIASegmentedImageView.h"

@interface UIASegmentedImageView ()

@property(nonatomic, assign) UIImageView *centerImageView;

@property(nonatomic, assign) UIImageView *topImageView;
@property(nonatomic, assign) UIImageView *bottomImageView;
@property(nonatomic, assign) UIImageView *leftImageView;
@property(nonatomic, assign) UIImageView *rightImageView;

@property(nonatomic, assign) UIImageView *topLeftImageView;
@property(nonatomic, assign) UIImageView *topRightImageView;
@property(nonatomic, assign) UIImageView *bottomLeftImageView;
@property(nonatomic, assign) UIImageView *bottomRightImageView;

@end


@implementation UIASegmentedImageView

@synthesize centerImageView=_centerImageView;
@synthesize topImageView=_topImageView, bottomImageView=_bottomImageView, leftImageView=_leftImageView, rightImageView=_rightImageView;
@synthesize topLeftImageView=_topLeftImageView, topRightImageView=_topRightImageView;
@synthesize bottomLeftImageView=_bottomLeftImageView, bottomRightImageView=_bottomRightImageView;

@synthesize centerImage=_centerImage;
@synthesize topImage=_topImage, bottomImage=_bottomImage, leftImage=_leftImage, rightImage=_rightImage;
@synthesize topLeftImage=_topLeftImage, topRightImage=_topRightImage;
@synthesize bottomLeftImage=_bottomLeftImage, bottomRightImage=_bottomRightImage;

@synthesize autosizing=_autosizing;
@synthesize topMargin=_topMargin, bottomMargin=_bottomMargin, leftMargin=_leftMargin, rightMargin=_rightMargin;


- (void)_segmentedImageViewInit {
    self.contentMode = UIViewContentModeScaleToFill;

    self.centerImageView = [[[UIImageView alloc] initWithFrame:self.bounds] autorelease];
    self.topImageView = [[[UIImageView alloc] init] autorelease];
    self.bottomImageView = [[[UIImageView alloc] init] autorelease];
    self.leftImageView = [[[UIImageView alloc] init] autorelease];
    self.rightImageView = [[[UIImageView alloc] init] autorelease];
    self.topLeftImageView = [[[UIImageView alloc] init] autorelease];
    self.topRightImageView = [[[UIImageView alloc] init] autorelease];
    self.bottomLeftImageView = [[[UIImageView alloc] init] autorelease];
    self.bottomRightImageView = [[[UIImageView alloc] init] autorelease];

    self.centerImageView.autoresizingMask = UIViewAutoresizingFlexibleSize;

    self.topImageView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    self.bottomImageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    self.leftImageView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
    self.rightImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;

    self.topLeftImageView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
    self.topRightImageView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
    self.bottomLeftImageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
    self.bottomRightImageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;

    [self addSubview:self.centerImageView];
    [self addSubview:self.topImageView];
    [self addSubview:self.bottomImageView];
    [self addSubview:self.leftImageView];
    [self addSubview:self.rightImageView];
    [self addSubview:self.topLeftImageView];
    [self addSubview:self.topRightImageView];
    [self addSubview:self.bottomLeftImageView];
    [self addSubview:self.bottomRightImageView];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        [self _segmentedImageViewInit];
        self.centerImage = self.image;
        [super setImage:nil];
        [self arrange];
        self.autosizing = YES;
    }
    return self;
}

- (id)initWithCenterImage:(UIImage *)image {
    self = [super init];
    if (self != nil) {
        [self _segmentedImageViewInit];
        self.frame = CGRectMake(.0, .0, image.size.width, image.size.height);
        self.centerImage = image;
        [self arrange];
        self.autosizing = YES;
    }
    return self;
}

- (id)initWithCenterImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
    self = [super init];
    if (self != nil) {
        [self _segmentedImageViewInit];
        self.frame = CGRectMake(.0, .0, image.size.width, image.size.height);
        self.centerImage = image;
        [self arrange];
        self.autosizing = YES;
    }
    return self;
}

- (id)initWithTopImage:(UIImage *)topImage centerImage:(UIImage *)centerImage bottomImage:(UIImage *)bottomImage {
    self = [self initWithCenterImage:centerImage];
    if (self != nil) {
        self.frame = CGRectMake(.0, .0, topImage.size.width, topImage.size.height + centerImage.size.height + bottomImage.size.height);
        self.topImage = topImage;
        self.bottomImage = bottomImage;
    }
    return self;
}

- (id)initWithLeftImage:(UIImage *)leftImage centerImage:(UIImage *)centerImage rightImage:(UIImage *)rightImage {
    self = [self initWithCenterImage:centerImage];
    if (self != nil) {
        self.frame = CGRectMake(.0, .0, leftImage.size.width + centerImage.size.width + rightImage.size.width, leftImage.size.height);
        self.leftImage = leftImage;
        self.rightImage = rightImage;
    }
    return self;
}

- (void)dealloc {
    self.centerImage = nil;

    self.topImage = nil;
    self.bottomImage = nil;
    self.leftImage = nil;
    self.rightImage = nil;

    self.topLeftImage = nil;
    self.topRightImage = nil;
    self.bottomLeftImage = nil;
    self.bottomRightImage = nil;

    [super dealloc];
}

- (void)arrange {
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat topMargin = self.topMargin;
    CGFloat bottomMargin = self.bottomMargin;
    CGFloat leftMargin = self.leftMargin;
    CGFloat rightMargin = self.rightMargin;

    self.topLeftImageView.frame = CGRectMake(.0, .0, leftMargin, topMargin);
    self.topImageView.frame = CGRectMake(leftMargin, .0, width - leftMargin - rightMargin, topMargin);
    self.topRightImageView.frame = CGRectMake(width - rightMargin, .0, rightMargin, topMargin);
    self.leftImageView.frame = CGRectMake(.0, topMargin, leftMargin, height - topMargin - bottomMargin);
    self.centerImageView.frame = CGRectMake(leftMargin, topMargin, width - leftMargin - rightMargin, height - topMargin - bottomMargin);
    self.rightImageView.frame = CGRectMake(width - rightMargin, topMargin, rightMargin, height - topMargin - bottomMargin);
    self.bottomLeftImageView.frame = CGRectMake(.0, height - bottomMargin, leftMargin, bottomMargin);
    self.bottomImageView.frame = CGRectMake(.0, height - bottomMargin, width - leftMargin - rightMargin, bottomMargin);
    self.bottomRightImageView.frame = CGRectMake(width - rightMargin, height - bottomMargin, rightMargin, bottomMargin);
}

- (UIImage *)image {
    return nil;
}

- (void)setImage:(UIImage *)image {
    @throw [NSException exceptionWithName:@"UIASegmentedImageView" reason:@"Disabled" userInfo:nil];
}

- (void)setCenterImage:(UIImage *)image {
    [image retain];
    [self->_centerImage release];
    self->_centerImage = image;
    self.centerImageView.image = image;
}

- (void)setTopImage:(UIImage *)image {
    [image retain];
    [self->_topImage release];
    self->_topImage = image;
    if (self.autosizing) {
        self.topMargin = image.size.height;
    }
    self.topImageView.image = image;
}

- (void)setBottomImage:(UIImage *)image {
    [image retain];
    [self->_bottomImage release];
    self->_bottomImage = image;
    if (self.autosizing) {
        self.bottomMargin = image.size.height;
    }
    self.bottomImageView.image = image;
}

- (void)setLeftImage:(UIImage *)image {
    [image retain];
    [self->_leftImage release];
    self->_leftImage = image;
    if (self.autosizing) {
        self.leftMargin = image.size.width;
    }
    self.leftImageView.image = image;
}

- (void)setRightImage:(UIImage *)image {
    [image retain];
    [self->_rightImage release];
    self->_rightImage = image;
    if (self.autosizing) {
        self.rightMargin = image.size.width;
    }
    self.rightImageView.image = image;
}

- (void)setTopLeftImage:(UIImage *)image {
    [image retain];
    [self->_topLeftImage release];
    self->_topLeftImage = image;
    if (self.autosizing) {
        self.topMargin = image.size.height;
        self.leftMargin = image.size.width;
    }
    self.topLeftImageView.image = image;
}

- (void)setTopRightImage:(UIImage *)image {
    [image retain];
    [self->_topRightImage release];
    self->_topRightImage = image;
    if (self.autosizing) {
        self.topMargin = image.size.height;
        self.rightMargin = image.size.width;
    }
    self.topRightImageView.image = image;
}

- (void)setBottomLeftImage:(UIImage *)image {
    [image retain];
    [self->_bottomLeftImage release];
    self->_bottomLeftImage = image;
    if (self.autosizing) {
        self.bottomMargin = image.size.height;
        self.leftMargin = image.size.width;
    }
    self.bottomLeftImageView.image = image;
}

- (void)setBottomRightImage:(UIImage *)image {
    [image retain];
    [self->_bottomRightImage release];
    self->_bottomRightImage = image;
    if (self.autosizing) {
        self.topMargin = image.size.height;
        self.leftMargin = image.size.width;
    }
    self.bottomRightImageView.image = image;
}

- (void)setTopMargin:(CGFloat)margin {
    if (self->_topMargin == margin) return;
    self->_topMargin = margin;

    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat leftMargin = self.leftMargin;
    CGFloat rightMargin = self.rightMargin;

    self.topLeftImageView.frame = CGRectMake(.0, .0, leftMargin, margin);
    self.topImageView.frame = CGRectMake(leftMargin, .0, width - leftMargin - rightMargin, margin);
    self.topRightImageView.frame = CGRectMake(width - rightMargin, .0, rightMargin, margin);

    CGFloat counterMargin = self.bottomMargin;
    for (UIImageView *view in @[self.leftImageView, self.centerImageView, self.rightImageView]) {
        CGRect frame;
        frame = view.frame;
        frame.size.height = height - margin - counterMargin;
        frame.origin.y = margin;
        view.frame = frame;
    }
}

- (void)setBottomMargin:(CGFloat)margin {
    if (self->_bottomMargin == margin) return;
    self->_bottomMargin = margin;

    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat leftMargin = self.leftMargin;
    CGFloat rightMargin = self.rightMargin;

    self.bottomLeftImageView.frame = CGRectMake(.0, height - margin, leftMargin, margin);
    self.bottomImageView.frame = CGRectMake(.0, height - margin, width - leftMargin - rightMargin, margin);
    self.bottomRightImageView.frame = CGRectMake(width - rightMargin, height - margin, rightMargin, margin);

    CGFloat counterMargin = self.topMargin;
    for (UIImageView *view in @[self.leftImageView, self.centerImageView, self.rightImageView]) {
        CGRect frame;
        frame = view.frame;
        frame.size.height = height - margin - counterMargin;
        view.frame = frame;
    }
}

- (void)setLeftMargin:(CGFloat)margin {
    if (self->_leftMargin == margin) return;
    self->_leftMargin = margin;

    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat topMargin = self.topMargin;
    CGFloat bottomMargin = self.bottomMargin;

    self.topLeftImageView.frame = CGRectMake(.0, .0, margin, topMargin);
    self.leftImageView.frame = CGRectMake(.0, topMargin, margin, height - topMargin - bottomMargin);
    self.bottomLeftImageView.frame = CGRectMake(.0, height - bottomMargin, margin, bottomMargin);

    CGFloat counterMargin = self.rightMargin;
    for (UIImageView *view in @[self.topImageView, self.centerImageView, self.bottomImageView]) {
        CGRect frame;
        frame = view.frame;
        frame.size.width = width - margin - counterMargin;
        frame.origin.x = margin;
        view.frame = frame;
    }
}

- (void)setRightMargin:(CGFloat)margin {
    if (self->_rightMargin == margin) return;
    self->_rightMargin = margin;

    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat topMargin = self.topMargin;
    CGFloat bottomMargin = self.bottomMargin;

    self.topRightImageView.frame = CGRectMake(width - margin, .0, margin, topMargin);
    self.rightImageView.frame = CGRectMake(width - margin, topMargin, margin, height - topMargin - bottomMargin);
    self.bottomRightImageView.frame = CGRectMake(width - margin, height - bottomMargin, margin, bottomMargin);

    CGFloat counterMargin = self.leftMargin;
    for (UIImageView *view in @[self.topImageView, self.centerImageView, self.bottomImageView]) {
        CGRect frame;
        frame = view.frame;
        frame.size.width = width - margin - counterMargin;
        view.frame = frame;
    }
}

@end
