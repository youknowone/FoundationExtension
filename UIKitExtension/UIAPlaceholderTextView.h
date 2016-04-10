//
//  UIAPlaceholderTextView.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 12..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <UIKit/UIKit.h>

#if !defined(TARGET_OS_IOS) || TARGET_OS_IOS

/*!
 *  @brief UITextView with placeholder.
 */
@interface UIAPlaceholderTextView : UITextView {
    UITextView *_placeholderTextView;
    NSString *_placeholderString;
    BOOL _placeholderAnimated;
    BOOL _editing;
}

/*!
 *  @brief Placeholder string
 */
@property(nonatomic, copy) NSString *placeholderString;

/*!
 *  @brief Placeholder color. Default is gray.
 */
@property(nonatomic, strong) UIColor *placeholderColor __deprecated;

/*!
 *  @brief Placeholder text view to setup styles.
 */
@property(weak, nonatomic, readonly) UITextView *placeholderTextView;

/*!
 *  @brief Placeholder shows/hides with animation. Default is YES.
 */
@property(nonatomic, assign, getter=isPlaceholderAnimated) BOOL placeholderAnimated;

@end

#endif
