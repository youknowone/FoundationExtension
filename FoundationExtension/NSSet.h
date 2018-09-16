//
//  NSSet.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 9. 11..
//  Copyright (c) 2013년 youknowone.org. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSSet (Enumerator)

- (instancetype)initWithEnumerator:(id<NSFastEnumeration>)enumerator;

@end

NS_ASSUME_NONNULL_END
