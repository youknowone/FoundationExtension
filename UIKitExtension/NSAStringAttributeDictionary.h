//
//  NSAStringAttributeDictionary.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 11. 1..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import <FoundationExtension/FoundationExtension.h>

//  UIKit required
//  Before iOS6, CoreText wrapper is required first.

enum {
    NSALigatureStandard = 0,
    NSALigatureNo = 1, // default
};
typedef NSUInteger NSALigatureType;


typedef NSUInteger NSAUnderlineStyle;


enum {
    NSAVerticalGlyphFormHorizontal = 0,
    NSAVerticalGlyphFormVertical = 1,
};
typedef NSUInteger NSAVerticalGlyphForm;


@interface NSAStringAttributeDictionary : NSAMutableDictionary

@property(retain) UIFont *font NS_AVAILABLE_IOS(6_0);;
@property(retain) NSParagraphStyle *paragraphStyle NS_AVAILABLE_IOS(6_0);;
@property(retain) UIColor *foregroundColor NS_AVAILABLE_IOS(6_0);;
@property(retain) UIColor *backgroundColor NS_AVAILABLE_IOS(6_0);;
@property(retain) NSNumber *ligatureNumber NS_AVAILABLE_IOS(6_0);;
@property(assign) NSALigatureType ligature NS_AVAILABLE_IOS(6_0);;
@property(retain) NSNumber *kernNumber NS_AVAILABLE_IOS(6_0);;
@property(assign) float kern NS_AVAILABLE_IOS(6_0);;
@property(retain) NSNumber *strikethroughStyleNumber NS_AVAILABLE_IOS(6_0);;
@property(assign) NSAUnderlineStyle strikethroughStyle NS_AVAILABLE_IOS(6_0);;
@property(retain) NSNumber *underlineStyleNumber NS_AVAILABLE_IOS(6_0);;
@property(assign) NSAUnderlineStyle underlineStyle NS_AVAILABLE_IOS(6_0);;
@property(retain) UIColor *strokeColor NS_AVAILABLE_IOS(6_0);;
@property(retain) NSNumber *strokeWidthNumber NS_AVAILABLE_IOS(6_0);;
@property(assign) float strokeWidth NS_AVAILABLE_IOS(6_0);;
@property(retain) NSShadow *shadow NS_AVAILABLE_IOS(6_0);;
@property(retain) NSNumber *verticalGlyphFormNumber NS_AVAILABLE_IOS(6_0);
@property(assign) NSAVerticalGlyphForm verticalGlyphForm NS_AVAILABLE_IOS(6_0);

@end
