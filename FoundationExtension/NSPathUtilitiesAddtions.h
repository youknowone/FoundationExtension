//
//  NSPathUtilitiesAddtions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 11. 2..
//  Copyright 2010 youknowone.org All rights reserved.
//

FOUNDATION_EXTERN NSString *NSPathForUserDirectory(NSSearchPathDirectory directory);
FOUNDATION_EXTERN NSString *NSPathForUserFileInDirectory(NSSearchPathDirectory directory, NSString *filename);

FOUNDATION_EXTERN NSString *NSPathForHomeFile(NSString *filename);
FOUNDATION_EXTERN NSString *NSPathForHomeFileForUser(NSString *filename, NSString *userName);

// OSX to ~/Library, IOS to ~/Documents
FOUNDATION_EXTERN NSString *NSUserConfigurationDirectory(void);
FOUNDATION_EXTERN NSString *NSPathForUserConfigurationFile(NSString *filename);
