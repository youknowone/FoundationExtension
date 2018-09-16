//
//  ABAddressBook.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 2014. 9. 15..
//  Copyright (c) 2014년 youknowone.org. All rights reserved.
//

@import Foundation;
#import <AddressBook/AddressBook.h>

@class ABRecord;

@interface ABAddressBook: NSObject

@property(readonly,nonatomic) ABAddressBookRef ref;

typedef void (^ABAAddressBookRequestAccessCompletionHandler) (bool granted, NSError *error);

+ (ABAuthorizationStatus)authorizationStatus;

- (instancetype)initWithABAddressBookRef:(ABAddressBookRef)ref;
- (instancetype)initWithOptions:(NSDictionary *)options error:(NSError *)error;

- (void)requestAccessWithCompletion:(ABAAddressBookRequestAccessCompletionHandler)completion;
@property(readonly,nonatomic) BOOL hasUnsavedChanges;

- (void)revert;
- (BOOL)save:(NSError **)error;
- (BOOL)addRecord:(ABRecord *)record error:(out NSError **)error;
- (BOOL)removeRecord:(ABRecord *)record error:(out NSError **)error;

//- (void)registerExternalChangeCallback
//- (void)unregisterExternalChangeCallback

@end
