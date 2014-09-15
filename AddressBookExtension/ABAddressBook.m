//
//  ABAddressBook.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 2014. 9. 15..
//  Copyright (c) 2014년 youknowone.org. All rights reserved.
//

#import "ABAddressBook.h"
#import "ABRecord.h"

@implementation ABAddressBook

@synthesize ref=_ref;

+ (ABAuthorizationStatus)authorizationStatus {
    return ABAddressBookGetAuthorizationStatus();
}

- (instancetype)init {
    ABAddressBookRef aRef = ABAddressBookCreateWithOptions(NULL, nil);
    if (aRef == nil) {
        return nil;
    }
    self = [self initWithABAddressBookRef:aRef];
    CFRelease(aRef);
    return self;
}

- (instancetype)initWithABAddressBookRef:(ABAddressBookRef)aRef {
    if (aRef == nil) {
        return nil;
    }
    self = [super init];
    CFRetain(aRef);
    self->_ref = aRef;
    return self;
}

- (instancetype)initWithOptions:(NSDictionary *)options error:(NSError *)error {
    ABAddressBookRef aRef = ABAddressBookCreateWithOptions((CFDictionaryRef)options, (CFErrorRef *)&error);
    self = [self initWithABAddressBookRef:aRef];
    CFRelease(aRef);
    return self;
}

- (void)dealloc {
    CFRelease(self->_ref);
    [super dealloc];
}

- (void)requestAccessWithCompletion:(ABAAddressBookRequestAccessCompletionHandler)completion {
    ABAddressBookRequestAccessWithCompletion(self->_ref, (ABAddressBookRequestAccessCompletionHandler)completion);
}

- (BOOL)hasUnsavedChanges {
    return ABAddressBookHasUnsavedChanges(self->_ref);
}

- (void)revert {
    ABAddressBookRevert(self->_ref);
}

- (BOOL)save:(NSError **)error {
    return ABAddressBookSave(self->_ref, (CFErrorRef *)error);
}

- (BOOL)addRecord:(ABRecord *)record error:(NSError **)error {
    return ABAddressBookAddRecord(self->_ref, record.ref, (CFErrorRef *)error);
}

- (BOOL)removeRecord:(ABRecord *)record error:(NSError **)error {
    return ABAddressBookRemoveRecord(self->_ref, record.ref, (CFErrorRef *)error);
}

@end
