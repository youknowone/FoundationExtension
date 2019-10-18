//
//  ABProperty.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 2014. 9. 15..
//  Copyright (c) 2014년 youknowone.org. All rights reserved.
//

#import <AddressBookExtension/ABRecord.h>

typedef NSUInteger ABPersonKind;

@interface ABPerson (Property)

@property(readonly,nonatomic) NSString *firstName;
@property(readonly,nonatomic) NSString *lastName;
@property(readonly,nonatomic) NSString *middleName;
@property(readonly,nonatomic) NSString *nickname;
@property(readonly,nonatomic) NSString *organization;
@property(readonly,nonatomic) NSString *jobTitle;
@property(readonly,nonatomic) NSString *department;
@property(readonly,nonatomic) ABMultiValue *emails;
@property(readonly,nonatomic) NSDate *birthday;
@property(readonly,nonatomic) NSString *note;
@property(readonly,nonatomic) NSDate *creationDate;
@property(readonly,nonatomic) NSDate *modificationDate;
@property(readonly,nonatomic) ABPersonKind kind;
@property(readonly,nonatomic) ABMultiValue *phones;
@property(readonly,nonatomic) ABMultiValue *URLs;
@property(readonly,nonatomic) ABMultiValue *socialProfiles;

@end


#define ABPersonCompositeNameFormatFirstNameFirst kABPersonCompositeNameFormatFirstNameFirst
#define ABPersonCompositeNameFormatLastNameFirst kABPersonCompositeNameFormatLastNameFirst

// Generic labels
#define ABWorkLabel ((NSString *)kABWorkLabel)
#define ABHomeLabel ((NSString *)kABHomeLabel)
#define ABOtherLabel ((NSString *)kABOtherLabel)

// Property keys

#define ABPersonFirstNameProperty kABPersonFirstNameProperty          // First name - kABStringPropertyType
#define ABPersonLastNameProperty kABPersonLastNameProperty           // Last name - kABStringPropertyType
#define ABPersonMiddleNameProperty kABPersonMiddleNameProperty         // Middle name - kABStringPropertyType
#define ABPersonPrefixProperty kABPersonPrefixProperty             // Prefix ("Sir" "Duke" "General") - kABStringPropertyType
#define ABPersonSuffixProperty kABPersonSuffixProperty             // Suffix ("Jr." "Sr." "III") - kABStringPropertyType
#define ABPersonNicknameProperty kABPersonNicknameProperty           // Nickname - kABStringPropertyType
#define ABPersonFirstNamePhoneticProperty kABPersonFirstNamePhoneticProperty  // First name Phonetic - kABStringPropertyType
#define ABPersonLastNamePhoneticProperty kABPersonLastNamePhoneticProperty   // Last name Phonetic - kABStringPropertyType
#define ABPersonMiddleNamePhoneticProperty kABPersonMiddleNamePhoneticProperty // Middle name Phonetic - kABStringPropertyType
#define ABPersonOrganizationProperty kABPersonOrganizationProperty       // Company name - kABStringPropertyType
#define ABPersonJobTitleProperty kABPersonJobTitleProperty           // Job Title - kABStringPropertyType
#define ABPersonDepartmentProperty kABPersonDepartmentProperty         // Department name - kABStringPropertyType
#define ABPersonEmailProperty kABPersonEmailProperty              // Email(s) - kABMultiStringPropertyType
#define ABPersonBirthdayProperty kABPersonBirthdayProperty           // Birthday associated with this person - kABDateTimePropertyType
#define ABPersonNoteProperty kABPersonNoteProperty               // Note - kABStringPropertyType
#define ABPersonCreationDateProperty kABPersonCreationDateProperty       // Creation Date (when first saved)
#define ABPersonModificationDateProperty kABPersonModificationDateProperty   // Last saved date

// Addresses
#define ABPersonAddressProperty kABPersonAddressProperty            // Street address - kABMultiDictionaryPropertyType
#define ABPersonAddressStreetKey ((NSString *)kABPersonAddressStreetKey)
#define ABPersonAddressCityKey ((NSString *)kABPersonAddressCityKey)
#define ABPersonAddressStateKey ((NSString *)kABPersonAddressStateKey)
#define ABPersonAddressZIPKey ((NSString *)kABPersonAddressZIPKey)
#define ABPersonAddressCountryKey ((NSString *)kABPersonAddressCountryKey)
#define ABPersonAddressCountryCodeKey ((NSString *)kABPersonAddressCountryCodeKey)


// Dates
#define ABPersonDateProperty kABPersonDateProperty               // Dates associated with this person - kABMultiDatePropertyType
#define ABPersonAnniversaryLabel ((NSString *)kABPersonAnniversaryLabel)

// Kind
#define ABPersonKindProperty kABPersonKindProperty               // Person/Organization - kABIntegerPropertyType
#define ABPersonKindPerson ([(NSNumber *)kABPersonKindPerson unsignedIntegerValue])
#define ABPersonKindOrganization ([(NSNumber *)kABPersonKindOrganization unsignedIntegerValue])

// Phone numbers
#define ABPersonPhoneProperty kABPersonPhoneProperty              // Generic phone number - kABMultiStringPropertyType
#define ABPersonPhoneMobileLabel ((NSString *)kABPersonPhoneMobileLabel)
#define ABPersonPhoneIPhoneLabel ((NSString *)kABPersonPhoneIPhoneLabel )
#define ABPersonPhoneMainLabel ((NSString *)kABPersonPhoneMainLabel)
#define ABPersonPhoneHomeFAXLabel ((NSString *)kABPersonPhoneHomeFAXLabel)
#define ABPersonPhoneWorkFAXLabel ((NSString *)kABPersonPhoneWorkFAXLabel)
#define ABPersonPhoneOtherFAXLabel ((NSString *)kABPersonPhoneOtherFAXLabel )
#define ABPersonPhonePagerLabel ((NSString *)kABPersonPhonePagerLabel)

// IM
#define ABPersonInstantMessageProperty kABPersonInstantMessageProperty     // Instant Messaging - kABMultiDictionaryPropertyType
#define ABPersonInstantMessageServiceKey ((NSString *)kABPersonInstantMessageServiceKey)     // Service ("Yahoo", "Jabber", etc.)
#define ABPersonInstantMessageServiceYahoo ((NSString *)kABPersonInstantMessageServiceYahoo)
#define ABPersonInstantMessageServiceJabber ((NSString *)kABPersonInstantMessageServiceJabber)
#define ABPersonInstantMessageServiceMSN ((NSString *)kABPersonInstantMessageServiceMSN)
#define ABPersonInstantMessageServiceICQ ((NSString *)kABPersonInstantMessageServiceICQ)
#define ABPersonInstantMessageServiceAIM ((NSString *)kABPersonInstantMessageServiceAIM)
#define ABPersonInstantMessageServiceQQ ((NSString *)kABPersonInstantMessageServiceQQ )
#define ABPersonInstantMessageServiceGoogleTalk ((NSString *)kABPersonInstantMessageServiceGoogleTalk )
#define ABPersonInstantMessageServiceSkype ((NSString *)kABPersonInstantMessageServiceSkype )
#define ABPersonInstantMessageServiceFacebook ((NSString *)kABPersonInstantMessageServiceFacebook )
#define ABPersonInstantMessageServiceGaduGadu ((NSString *)kABPersonInstantMessageServiceGaduGadu )

#define ABPersonInstantMessageUsernameKey ((NSString *)kABPersonInstantMessageUsernameKey)    // Username

// URLs
#define ABPersonURLProperty kABPersonURLProperty                // URL - kABMultiStringPropertyType
#define ABPersonHomePageLabel ((NSString *)kABPersonHomePageLabel) // Home Page

// Related names
#define ABPersonRelatedNamesProperty kABPersonRelatedNamesProperty       // Names - kABMultiStringPropertyType
#define ABPersonFatherLabel ((NSString *)kABPersonFatherLabel)    // Father
#define ABPersonMotherLabel ((NSString *)kABPersonMotherLabel)    // Mother
#define ABPersonParentLabel ((NSString *)kABPersonParentLabel)    // Parent
#define ABPersonBrotherLabel ((NSString *)kABPersonBrotherLabel)   // Brother
#define ABPersonSisterLabel ((NSString *)kABPersonSisterLabel)    // Sister
#define ABPersonChildLabel ((NSString *)kABPersonChildLabel)      // Child
#define ABPersonFriendLabel ((NSString *)kABPersonFriendLabel)    // Friend
#define ABPersonSpouseLabel ((NSString *)kABPersonSpouseLabel)    // Spouse
#define ABPersonPartnerLabel ((NSString *)kABPersonPartnerLabel)   // Partner
#define ABPersonAssistantLabel ((NSString *)kABPersonAssistantLabel) // Assistant
#define ABPersonManagerLabel ((NSString *)kABPersonManagerLabel)   // Manager

// Social Profile
#define ABPersonSocialProfileProperty  kABPersonSocialProfileProperty 		// kABMultiDictionaryPropertyType
#define ABPersonSocialProfileURLKey ((NSString *)kABPersonSocialProfileURLKey )			// string representation of a url for the social profile
// the following properties are optional
#define ABPersonSocialProfileServiceKey ((NSString *)kABPersonSocialProfileServiceKey )			// string representing the name of the service (Twitter, Facebook, LinkedIn, etc.)
#define ABPersonSocialProfileUsernameKey ((NSString *)kABPersonSocialProfileUsernameKey )			// string representing the user visible name
#define ABPersonSocialProfileUserIdentifierKey ((NSString *)kABPersonSocialProfileUserIdentifierKey )	// string representing the service specific identifier (optional)

#define ABPersonSocialProfileServiceTwitter ((NSString *)kABPersonSocialProfileServiceTwitter )
#define ABPersonSocialProfileServiceSinaWeibo ((NSString *)kABPersonSocialProfileServiceSinaWeibo )
#define ABPersonSocialProfileServiceGameCenter ((NSString *)kABPersonSocialProfileServiceGameCenter )
#define ABPersonSocialProfileServiceFacebook ((NSString *)kABPersonSocialProfileServiceFacebook )
#define ABPersonSocialProfileServiceMyspace ((NSString *)kABPersonSocialProfileServiceMyspace )
#define ABPersonSocialProfileServiceLinkedIn ((NSString *)kABPersonSocialProfileServiceLinkedIn )
#define ABPersonSocialProfileServiceFlickr ((NSString *)kABPersonSocialProfileServiceFlickr )

// Alternate birthday
#define ABPersonAlternateBirthdayProperty  kABPersonAlternateBirthdayProperty                 // kABDictionaryPropertyType
#define ABPersonAlternateBirthdayCalendarIdentifierKey ((NSString *)kABPersonAlternateBirthdayCalendarIdentifierKey )    // string representing the calendar identifier for CFCalendarRef
#define ABPersonAlternateBirthdayEraKey ((NSString *)kABPersonAlternateBirthdayEraKey )                   // CFNumberRef - kCFNumberNSIntegerType
#define ABPersonAlternateBirthdayYearKey ((NSString *)kABPersonAlternateBirthdayYearKey )                  // CFNumberRef - kCFNumberNSIntegerType
#define ABPersonAlternateBirthdayMonthKey ((NSString *)kABPersonAlternateBirthdayMonthKey )                 // CFNumberRef - kCFNumberNSIntegerType
#define ABPersonAlternateBirthdayIsLeapMonthKey ((NSString *)kABPersonAlternateBirthdayIsLeapMonthKey )           // CFNumberRef - kCFNumberCharType (aka NSNumber Bool type)
#define ABPersonAlternateBirthdayDayKey ((NSString *)kABPersonAlternateBirthdayDayKey )                   // CFNumberRef - kCFNumberNSIntegerType
