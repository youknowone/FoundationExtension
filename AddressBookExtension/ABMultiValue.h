//
//  ABMultiValue.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 2014. 9. 15..
//  Copyright (c) 2014년 youknowone.org. All rights reserved.
//

@import Foundation;
#import <AddressBook/AddressBook.h>

@interface ABMultiValue : NSObject<NSCopying, NSMutableCopying>

@property(nonatomic,readonly) ABMultiValueRef ref;

- (instancetype)initWithABMultiValueRef:(CFTypeRef)ref;
+ (instancetype)multiValueWithABMultiValueRef:(CFTypeRef)ref;

- (id)valueAtIndex:(NSUInteger)index;
@property(nonatomic,readonly) NSArray *allValues;
@property(nonatomic,readonly) NSUInteger count;
- (NSUInteger)indexOfValue:(id)value;
- (NSString *)labelAtIndex:(NSUInteger)index;

- (ABMultiValueIdentifier)identifierAtIndex:(NSUInteger)index;
- (NSUInteger)indexForIdentifier:(ABMultiValueIdentifier)identifier;

@property(nonatomic,readonly) ABPropertyType propertyType;

- (NSString *)localizedLabelAtIndex:(NSUInteger)index;

@end


@interface ABMutableMultiValue : ABMultiValue

- (instancetype)initWithPropertyType:(ABPropertyType)type;

- (BOOL)addValue:(id)value label:(NSString *)label outIdentifier:(ABMultiValueIdentifier *)identifier;
- (BOOL)setValue:(id)value atIndex:(NSUInteger)index;
- (BOOL)setLabel:(NSString *)label atIndex:(NSUInteger)index;
- (BOOL)insertValue:(id)value label:(NSString *)label atIndex:(NSUInteger)index outIdentifier:(ABMultiValueIdentifier *)identifier;
- (BOOL)removeValueAndLabelAtIndex:(NSUInteger)index;

@end
