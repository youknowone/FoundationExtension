//
//  NSAOverridingMediator.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 5. 12..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

/*!
 *  @file
 *  @brief Tool for partial method implementation.
 */

#import <Foundation/Foundation.h>

/*!
 *  @brief A mediator to select origin or overrided method. Useful for partial protocol implementation.
 */
@interface NSAOverridingMediator : NSObject {
    id _origin;
    id _override;
    BOOL _suppressive;
}

/*!
 *  @brief Initialize partial overrider.
 *  @param origin Origin implementation.
 *  @param override Overrided implementation.
 *  @param suppressive Suppress overrided implementation or not.
 *  @return Returns a mediator of origin and overrided objects.
 */
- (instancetype)initWithOrigin:(id)origin override:(id)override suppressive:(BOOL)suppressive;

+ (instancetype)mediatorWithOrigin:(id)origin override:(id)override;
+ (instancetype)mediatorWithOrigin:(id)origin override:(id)override suppressive:(BOOL)suppressive;

@property(nonatomic, strong) id origin;
@property(nonatomic, strong) id override;
@property(nonatomic, assign) BOOL suppressive;

@end
