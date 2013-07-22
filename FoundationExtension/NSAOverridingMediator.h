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
- (id)initWithOrigin:(id)origin override:(id)override suppressive:(BOOL)suppressive;

+ (id)mediatorWithOrigin:(id)origin override:(id)override;
+ (id)mediatorWithOrigin:(id)origin override:(id)override suppressive:(BOOL)suppressive;

@property(nonatomic, retain) id origin;
@property(nonatomic, retain) id override;
@property(nonatomic, assign) BOOL suppressive;

@end
