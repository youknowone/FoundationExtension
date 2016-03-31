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

#if !defined(_Nullable)
#define _Nullable
#define _Nonnull
#define nullable
#define nonnull
#endif

#if !__has_feature(nullability)
#define __nullable
#endif
