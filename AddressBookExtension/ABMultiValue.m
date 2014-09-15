//
//  ABMultiValue.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 2014. 9. 15..
//  Copyright (c) 2014년 youknowone.org. All rights reserved.
//

#import "ABMultiValue.h"


@implementation ABMultiValue

@synthesize ref=_ref;

- (instancetype)initWithABMultiValueRef:(CFTypeRef)ref {
    self = [super init];
    self->_ref = ref;
    CFRetain(self->_ref);
    return self;
}

+ (instancetype)multiValueWithABMultiValueRef:(CFTypeRef)ref {
    return [[[self alloc] initWithABMultiValueRef:ref] autorelease];
}

- (id)copyWithZone:(NSZone *)zone {
    return [self retain];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    ABMutableMultiValueRef copied = ABMultiValueCreateMutableCopy(self->_ref);
    ABMutableMultiValue *obj = [[ABMutableMultiValue alloc] initWithABMultiValueRef:copied];
    CFRelease(copied);
    return obj;
}

- (id)valueAtIndex:(NSUInteger)index {
    CFTypeRef obj = ABMultiValueCopyValueAtIndex(self->_ref, (CFIndex)index);
    CFAutorelease(obj);
    return (id)obj;
}

- (NSArray *)allValues {
    CFArrayRef obj = ABMultiValueCopyArrayOfAllValues(self->_ref);
    CFAutorelease(obj);
    return (NSArray *)obj;
}

- (NSUInteger)count {
    return ABMultiValueGetCount(self->_ref);
}

- (NSUInteger)indexOfValue:(id)value {
    CFIndex index = ABMultiValueGetFirstIndexOfValue(self->_ref, (CFTypeRef)value);
    return (NSUInteger)index;
}

- (NSString *)labelAtIndex:(NSUInteger)index {
    CFStringRef obj = ABMultiValueCopyLabelAtIndex(self->_ref, (CFIndex)index);
    CFAutorelease(obj);
    return (NSString *)obj;
}

- (NSString *)localizedLabelAtIndex:(NSUInteger)index {
    CFStringRef label = (CFStringRef)[self labelAtIndex:index];
    label = ABAddressBookCopyLocalizedLabel(label);
    CFAutorelease(label);
    return (NSString *)label;
}

- (ABMultiValueIdentifier)identifierAtIndex:(NSUInteger)index {
    return ABMultiValueGetIdentifierAtIndex(self->_ref, (CFIndex)index);
}

- (NSUInteger)indexForIdentifier:(ABMultiValueIdentifier)identifier {
    return ABMultiValueGetIndexForIdentifier(self->_ref, identifier);
}

- (ABPropertyType)propertyType {
    return ABMultiValueGetPropertyType(self->_ref);
}

@end


@implementation ABMutableMultiValue

- (instancetype)initWithPropertyType:(ABPropertyType)type {
    ABMutableMultiValueRef ref = ABMultiValueCreateMutable(type);
    self = [self initWithABMultiValueRef:ref];
    CFRelease(ref);
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return [self mutableCopyWithZone:zone];
}

- (BOOL)addValue:(id)value label:(NSString *)label outIdentifier:(ABMultiValueIdentifier *)outIdentifier {
    return ABMultiValueAddValueAndLabel(self.ref, (CFTypeRef)value, (CFStringRef)label, outIdentifier);
}

- (BOOL)setValue:(id)value atIndex:(NSUInteger)index {
    return ABMultiValueReplaceValueAtIndex(self.ref, value, index);
}

- (BOOL)setLabel:(NSString *)label atIndex:(NSUInteger)index {
    return ABMultiValueReplaceLabelAtIndex(self.ref, (CFStringRef)label, index);
}

- (BOOL)insertValue:(id)value label:(NSString *)label atIndex:(NSUInteger)index outIdentifier:(ABMultiValueIdentifier *)identifier {
    return ABMultiValueInsertValueAndLabelAtIndex(self.ref, value, (CFStringRef)label, index, identifier);
}

- (BOOL)removeValueAndLabelAtIndex:(NSUInteger)index {
    return ABMultiValueRemoveValueAndLabelAtIndex(self.ref, index);
}

@end
