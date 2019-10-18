//
//  ABProperty.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 2014. 9. 15..
//  Copyright (c) 2014년 youknowone.org. All rights reserved.
//

#import "ABProperty.h"
#import "ABRecord.h"
#import "ABMultiValue.h"

@implementation ABPerson (Property)

- (NSString *)firstName {
    return [self valueForProperty:ABPersonFirstNameProperty];
}

- (NSString *)lastName {
    return [self valueForProperty:ABPersonLastNameProperty];
}

- (NSString *)middleName {
    return [self valueForProperty:ABPersonMiddleNameProperty];
}

- (NSString *)nickname {
    return [self valueForProperty:ABPersonNicknameProperty];
}

- (NSString *)organization {
    return [self valueForProperty:ABPersonOrganizationProperty];
}

- (NSString *)jobTitle {
    return [self valueForProperty:ABPersonJobTitleProperty];
}

- (NSString *)department {
    return [self valueForProperty:ABPersonDepartmentProperty];
}

- (ABMultiValue *)emails {
    ABMultiValue *values = [self multivalueForProperty:ABPersonEmailProperty];
    return values;
}

- (NSDate *)birthday {
    return [self valueForProperty:ABPersonBirthdayProperty];
}

- (NSString *)note {
    return [self valueForProperty:ABPersonNoteProperty];
}

- (NSDate *)creationDate {
    return [self valueForProperty:ABPersonCreationDateProperty];
}

- (NSDate *)modificationDate {
    return [self valueForProperty:ABPersonModificationDateProperty];
}

- (ABPersonKind)kind {
    NSNumber *kindNumber = [self valueForProperty:ABPersonKindProperty];
    return [kindNumber unsignedIntegerValue];
}

- (ABMultiValue *)phones {
    ABMultiValue *values = [self multivalueForProperty:ABPersonPhoneProperty];
    return values;
}

- (ABMultiValue *)URLs {
    ABMultiValue *values = [self multivalueForProperty:ABPersonURLProperty];
    return values;
}

- (ABMultiValue *)socialProfiles {
    ABMultiValue *values = [self multivalueForProperty:ABPersonSocialProfileProperty];
    return values;
}

@end
