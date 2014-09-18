//
//  NSSet.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 9. 11..
//  Copyright (c) 2013년 youknowone.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (Enumerator)

- (instancetype)initWithEnumerator:(id<NSFastEnumeration>)enumerator;

@end
