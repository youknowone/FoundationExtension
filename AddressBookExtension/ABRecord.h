//
//  ABRecord.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 2014. 9. 15..
//  Copyright (c) 2014년 youknowone.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookExtension/ABAddressBook.h>

@class ABMultiValue;

@interface ABRecord: NSObject

@property(readonly,nonatomic) ABRecord *ref;

- (instancetype)initWithABRecordRef:(ABRecordRef)ref;
- (instancetype)initWithABRecordRefNoRetain:(ABRecordRef)ref;

@property(readonly,nonatomic) ABRecordID recordID;
@property(readonly,nonatomic) ABRecordType recordType;

@property(readonly,nonatomic) NSString *compositeName;
- (id)valueForProperty:(ABPropertyID)property;
- (ABMultiValue *)multivalueForProperty:(ABPropertyID)property;
- (BOOL)setValue:(id)value forProperty:(ABPropertyID)property error:(NSError **)error;
- (BOOL)removeValueForProperty:(ABPropertyID)property error:(NSError **)error;

@end


@interface ABSource : ABRecord

@end


@class ABPerson;
@interface ABGroup : ABRecord

- (instancetype)initInSource:(ABSource *)source;

@property(readonly,nonatomic) NSArray *allMembers;
- (NSArray *)allSortedMembersUsingOrdering:(ABPersonSortOrdering)ordering;

- (BOOL)addMember:(ABPerson *)person error:(NSError **)error;
- (BOOL)removeMember:(ABPerson *)person error:(NSError **)error;

@end


@interface ABPerson : ABRecord

#define ABPersonImageFormatThumbnail kABPersonImageFormatThumbnail
#define ABPersonImageFormatOriginalSize kABPersonImageFormatOriginalSize

- (instancetype)initInSource:(ABSource *)source;

- (NSComparisonResult)compare:(ABPerson *)person usingOrdering:(ABPersonSortOrdering)order;

@property(copy,nonatomic) NSData *imageData;
- (NSData *)imageDataWithFormat:(ABPersonImageFormat)format;
- (BOOL)setImageData:(NSData *)imageData error:(NSError **)error;
@property(readonly,nonatomic) BOOL hasImageData;
// - (BOOL)removeImageData; // user setImageData:nil

- (NSArray *)linkedPeople;
- (ABSource *)source;

@property(readonly,nonatomic) NSString *compositeNameDelimiter NS_AVAILABLE_IOS(7_0);
@property(readonly,nonatomic) ABPersonCompositeNameFormat compositeNameFormat NS_AVAILABLE_IOS(7_0);

+ (ABPersonSortOrdering)sortOrdering;

@end


@interface ABAddressBook (Source)

@property(readonly,nonatomic) NSArray *allSources;
@property(readonly,nonatomic) ABSource *defaultSource;
- (ABSource *)sourceWithRecordID:(ABRecordID)recordID;

@end


@interface ABAddressBook (Group)

@property(readonly,nonatomic) NSUInteger groupCount;
- (ABGroup *)groupWithRecordID:(ABRecordID)recordID;
@property(readonly,nonatomic) NSArray *allGroups;
- (NSArray *)allGroupsInSource:(ABSource *)source;
@property(readonly,nonatomic) ABSource *source;

@end


@interface ABAddressBook (Person)

@property(readonly,nonatomic) NSUInteger personCount;
- (ABPerson *)personWithRecordID:(ABRecordID)recordID;
@property(readonly,nonatomic) NSArray *allPeople;
- (NSArray *)allPeopleInSource:(ABSource *)source;
- (NSArray *)allSortedPeopleInSource:(ABSource *)source usingOrdering:(ABPersonSortOrdering)ordering;
- (NSArray *)peopleWithName:(NSString *)name;

@end
