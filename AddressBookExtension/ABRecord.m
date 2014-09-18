//
//  ABRecord.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 2014. 9. 15..
//  Copyright (c) 2014년 youknowone.org. All rights reserved.
//

#import "ABRecord.h"
#import "ABMultiValue.h"
#import "NSAFunctional.h"

NSArray *_ABArrayOfGroupRefToGroup(CFArrayRef rawGroups);
NSArray *_ABArrayOfPersonRefToPerson(CFArrayRef rawPeople);


NSArray *_ABArrayOfGroupRefToGroup(CFArrayRef rawGroups) {
    if (rawGroups == nil) {
        return nil;
    }
    NSArray *groups = [(NSArray *)rawGroups arrayByMappingOperator:^id(id obj) {
        return [[[ABGroup alloc] initWithABRecordRef:(ABRecordRef)obj] autorelease];
    }];
    CFRelease(rawGroups);
    return groups;
}

NSArray *_ABArrayOfPersonRefToPerson(CFArrayRef rawPeople) {
    if (rawPeople == nil) {
        return nil;
    }
    NSArray *people = [(NSArray *)rawPeople arrayByMappingOperator:^id(id obj) {
        return [[[ABPerson alloc] initWithABRecordRef:(ABRecordRef)obj] autorelease];
    }];
    CFRelease(rawPeople);
    return people;
}


@implementation ABAddressBook (Source)

- (NSArray *)allSources {
    CFArrayRef rawSources = ABAddressBookCopyArrayOfAllSources(self.ref);
    if (rawSources == nil) {
        return nil;
    }
    NSArray *sources = [(NSArray *)rawSources arrayByMappingOperator:^id(id obj) {
        return [[[ABSource alloc] initWithABRecordRef:(ABRecordRef)obj] autorelease];
    }];
    CFRelease(rawSources);
    return sources;
}

- (ABSource *)defaultSource {
    ABRecordRef obj = ABAddressBookCopyDefaultSource(self.ref);
    ABSource *source = [[[ABSource alloc] initWithABRecordRef:obj] autorelease];
    CFRelease(obj);
    return source;
}

- (ABSource *)sourceWithRecordID:(ABRecordID)recordID {
    ABRecordRef obj = ABAddressBookGetSourceWithRecordID(self.ref, recordID);
    ABSource *source = [[[ABSource alloc] initWithABRecordRef:obj] autorelease];
    CFRelease(obj);
    return source;
}

@end


@implementation ABAddressBook (Group)

- (NSUInteger)groupCount {
    return ABAddressBookGetGroupCount(self.ref);
}

- (ABGroup *)groupWithRecordID:(ABRecordID)recordID {
    ABRecordRef groupRef = ABAddressBookGetGroupWithRecordID(self.ref, recordID);
    ABGroup *group = [[ABGroup alloc] initWithABRecordRef:groupRef];
    return [group autorelease];
}

- (NSArray *)allGroups {
    CFArrayRef obj = ABAddressBookCopyArrayOfAllGroups(self.ref);
    return _ABArrayOfGroupRefToGroup(obj);
}

- (NSArray *)allGroupsInSource:(ABSource *)source {
    CFArrayRef obj = ABAddressBookCopyArrayOfAllGroupsInSource(self.ref, source.ref);
    return _ABArrayOfGroupRefToGroup(obj);
}

- (ABSource *)source {
    ABRecordRef sourceRef = ABGroupCopySource(self.ref);
    ABSource *source = [[ABSource alloc] initWithABRecordRefNoRetain:sourceRef];
    return [source autorelease];
}

@end


@implementation ABAddressBook (Person)

- (NSUInteger)personCount {
    return ABAddressBookGetPersonCount(self.ref);
}

- (NSArray *)allPeople {
    CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(self.ref);
    return _ABArrayOfPersonRefToPerson(people);
}

- (NSArray *)allPeopleInSource:(ABSource *)source {
    CFArrayRef people = ABAddressBookCopyArrayOfAllPeopleInSource(self.ref, source.ref);
    return _ABArrayOfPersonRefToPerson(people);
}

- (NSArray *)allSortedPeopleInSource:(ABSource *)source usingOrdering:(ABPersonSortOrdering)ordering {
    CFArrayRef people = ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(self.ref, source.ref, ordering);
    return _ABArrayOfPersonRefToPerson(people);
}

- (NSArray *)peopleWithName:(NSString *)name {
    CFArrayRef people = ABAddressBookCopyPeopleWithName(self.ref, (CFStringRef)name);
    return _ABArrayOfPersonRefToPerson(people);
}

- (ABPerson *)personWithRecordID:(ABRecordID)recordID {
    ABRecordRef obj = ABAddressBookGetPersonWithRecordID(self.ref, recordID);
    ABPerson *source = [[[ABPerson alloc] initWithABRecordRefNoRetain:obj] autorelease];
    return source;
}


@end


@implementation ABRecord

@synthesize ref=_ref;

- (instancetype)initWithABRecordRefNoRetain:(ABRecordRef)aRef {
    if (aRef == nil) {
        [self autorelease];
        return nil;
    }
    self = [super init];
    self->_ref = aRef;
    return self;
}

- (instancetype)initWithABRecordRef:(ABRecordRef)aRef {
    self = [self initWithABRecordRefNoRetain:aRef];
    CFRetain(aRef);
    return self;
}

- (void)dealloc {
    CFRelease(self->_ref);
    [super dealloc];
}

- (ABRecordID)recordID {
    return ABRecordGetRecordID(self->_ref);
}

- (ABRecordType)recordType {
    return ABRecordGetRecordType(self->_ref);
}

- (NSString *)compositeName {
    CFStringRef obj = ABRecordCopyCompositeName(self->_ref);
    if (obj != nil) {
        CFAutorelease(obj);
    }
    return (NSString *)obj;
}

- (id)valueForProperty:(ABPropertyID)property {
    CFTypeRef obj = ABRecordCopyValue(self->_ref, property);
    if (obj != nil) {
        CFAutorelease(obj);
    }
    return (id)obj;
}

- (ABMultiValue *)multivalueForProperty:(ABPropertyID)property {
    ABMultiValueRef obj = ABRecordCopyValue(self->_ref, property);
    if (obj == nil) {
        return nil;
    }
    ABMultiValue *multivalue = [ABMultiValue multiValueWithABMultiValueRef:obj];
    CFRelease(obj);
    return multivalue;
}

- (BOOL)setValue:(id)value forProperty:(ABPropertyID)property error:(NSError **)error {
    return ABRecordSetValue(self->_ref, property, value, (CFErrorRef *)error);
}

- (BOOL)removeValueForProperty:(ABPropertyID)property error:(NSError **)error {
    return ABRecordRemoveValue(self->_ref, property, (CFErrorRef *)error);
}

@end


@implementation ABSource

@end


@implementation ABGroup

- (instancetype)init {
    ABRecordRef ref = ABGroupCreate();
    self = [super initWithABRecordRefNoRetain:ref];
    return self;
}

- (instancetype)initInSource:(ABSource *)source {
    ABRecordRef ref = ABGroupCreateInSource(source.ref);
    self = [super initWithABRecordRefNoRetain:ref];
    return self;
}

- (NSArray *)allMembers {
    CFArrayRef obj = ABGroupCopyArrayOfAllMembers(self.ref);
    return _ABArrayOfPersonRefToPerson(obj);
}

- (NSArray *)allSortedMembersUsingOrdering:(ABPersonSortOrdering)ordering {
    CFArrayRef obj = ABGroupCopyArrayOfAllMembersWithSortOrdering(self.ref, ordering);
    return _ABArrayOfPersonRefToPerson(obj);
}

- (BOOL)addMember:(ABPerson *)person error:(NSError **)error {
    return ABGroupAddMember(self.ref, person.ref, (CFErrorRef *)error);
}

- (BOOL)removeMember:(ABPerson *)person error:(NSError **)error {
    return ABGroupRemoveMember(self.ref, person.ref, (CFErrorRef *)error);
}

@end


@implementation ABPerson

- (instancetype)init {
    ABRecordRef ref = ABPersonCreate();
    self = [super initWithABRecordRefNoRetain:ref];
    return self;
}

- (instancetype)initInSource:(ABSource *)source {
    ABRecordRef ref = ABPersonCreateInSource(source.ref);
    self = [super initWithABRecordRefNoRetain:ref];
    return self;
}

- (NSComparisonResult)compare:(ABPerson *)person usingOrdering:(ABPersonSortOrdering)order {
    return (NSComparisonResult)ABPersonComparePeopleByName(self.ref, person.ref, order);
}

- (NSData *)imageData {
    CFDataRef obj = ABPersonCopyImageData(self.ref);
    if (obj != nil) {
        CFAutorelease(obj);
    }
    return (NSData *)obj;
}

- (NSData *)imageDataWithFormat:(ABPersonImageFormat)format {
    CFDataRef obj = ABPersonCopyImageDataWithFormat(self.ref, format);
    if (obj != nil) {
        CFAutorelease(obj);
    }
    return (NSData *)obj;
}

- (void)setImageData:(NSData *)imageData {
    [self setImageData:imageData error:NULL];
}

- (BOOL)setImageData:(NSData *)imageData error:(NSError **)error {
    if (imageData == nil) {
        return ABPersonRemoveImageData(self.ref, (CFErrorRef *)error);
    } else {
        return ABPersonSetImageData(self.ref, (CFDataRef)imageData, (CFErrorRef *)error);
    }
}

- (BOOL)hasImageData {
    return ABPersonHasImageData(self.ref);
}

- (NSArray *)linkedPeople {
    CFArrayRef people = ABPersonCopyArrayOfAllLinkedPeople(self.ref);
    return _ABArrayOfPersonRefToPerson(people);
}

- (ABSource *)source {
    ABRecordRef sourceRef = ABPersonCopySource(self.ref);
    ABSource *source = [[ABSource alloc] initWithABRecordRefNoRetain:sourceRef];
    return [source autorelease];
}

- (NSString *)compositeNameDelimiter {
    CFStringRef obj = ABPersonCopyCompositeNameDelimiterForRecord(self.ref);
    if (obj != nil) {
        CFAutorelease(obj);
    }
    return (NSString *)obj;
}

- (ABPersonCompositeNameFormat)compositeNameFormat {
    return ABPersonGetCompositeNameFormatForRecord(self.ref);
}

+ (ABPersonSortOrdering)sortOrdering {
    return ABPersonGetSortOrdering();
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<ABPerson: %@>", self.compositeName];
}

@end
