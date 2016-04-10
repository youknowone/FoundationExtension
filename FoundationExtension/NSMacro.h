//
//  NSMacros.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 2016. 3. 21..
//  Copyright © 2016년 youknowone.org. All rights reserved.
//

#import <Foundation/Foundation.h>


#if !defined(NS_ASSUME_NONNULL_BEGIN)
#define NS_ASSUME_NONNULL_BEGIN
#define NS_ASSUME_NONNULL_END
#endif

#if !__has_feature(nullability)
#define nullable
#define nonnull
#define __nullable
#define __nonnull
#endif
