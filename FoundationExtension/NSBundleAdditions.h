//
//  NSBundleAdditions.h
//  FoundationExtension
//
//  Created by youknowone on 10. 11. 1..
//  Copyright 2010 youknowone.org All rights reserved.
//

FOUNDATION_EXTERN NSString *NSResourceDirectory(void);
FOUNDATION_EXTERN NSString *NSPathForResourceFile(NSString *filename);

@interface NSBundle (FoundationExtension)

- (NSString *) pathForResourceFile:(NSString *)filename;
- (NSString *) pathForResource:(NSString *)filename __deprecated;

@end
