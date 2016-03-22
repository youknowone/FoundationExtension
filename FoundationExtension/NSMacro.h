//
//  NSMacros.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 2016. 3. 21..
//  Copyright © 2016년 youknowone.org. All rights reserved.
//

#import <Foundation/Foundation.h>


#if !__has_feature(nullability)
#define NS_ASSUME_NONNULL_BEGIN
#define NS_ASSUME_NONNULL_END
#define _Nullable
#define nullable
#endif
