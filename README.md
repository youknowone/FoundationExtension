@mainpage

# FoundationExtension
This library includes small Cocoa/UIKit extensions make your codes short.

See document on [Github] (http://youknowone.github.com/FoundationExtension)

# How to use
* Compiled library
  1. build project
  1. add FoundationExtension or UIKitExtension target as dependency
  1. if UIKitExtension: add '-force\_load {path\_for\_libUIKitExtension.a}' to 'other linker flags'
* Directy source
  1. add files what you need to your project

# Why useful
Make your code short! Do not allow evil objc to make your code verbose.
This library includes many shortcuts for common work.

## NSData from URL
Foundation

    NSString *URLString = [NSSring stringWithFormat:@"http://"HOST_URL"/api/%@", key];
    NSURL *URL = [NSURL URLWithString:URLString];

FoundationExtension

    NSURL *URL = [[@"http://"HOST_URL"/api/%@" format:key] URL];

## performSelector, with 3 object
Foundation
  * No way. You should use <objc/runtime.h>

FoundationExtension

    [obj performSelector:sel withObject:o1 withObject:o2 withObject:o3];

## get NSData from post request
Foundation

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:@"field1=value1"];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
FoundationExtension

    NSData *data = [NSData dataWithContentsOfURL:URL postBody:@{@"field1":@"value1"} encoding:NSUTF8StringEncoding];
    
## get NSData from Multipart Form POST
Foundation
  * Meh...

FoundationExtension

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    [request setHTTPMultiPartFormPostBody:@{@"filename":data} encoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithContentOfURLRequest:request];
    
## get class name
Foundation

    NSString *className = [NSString stringWithUTF8String:class_getName(obj.class)];
    
FoundationExtension

    NSString *className = obj.classObject.name;
    
## encode base64 string (especially for IAP)
Foundation
  * No way.

FoundationExtension

    NSString *base64String = [data base64String];
    
## get hexadecimal value from base 16 string
Foundation

    int value;
    sscanf(string.UTF8String, "%x", &value);

FoundationExtension

    NSInteger value = [string hexadecimalValue];
    
## How about base 12 string?
Foundation
  * Meh...

FoundationExtension

    NSInteger value = [string integetValueBase:12];

## md5 hash
Foundation

    unsigned char hashedChars[CC_MD5_DIGEST_LENGTH];
    CC_MD5([data bytes], (CC_LONG)[self length], hashedChars);
    NSMutableString *result = [[NSMutableString alloc] init];
    for ( int i = 0; i<CC_MD5_DIGEST_LENGTH; i++ )
        [result appendFormat:@"%02x", *(hashedChars+i)];
    
FoundationExtension

    NSString *result = [data digestStringByMD5];
    
## plist dictionary decode from HTTP post request
Foundation
  * Meh... (get data from NSURLRequest, and from NSData.. huh?)

FoundationExtension

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    [request setHTTPPostBody:@{@"key1":@"value1"} encoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithContentOfURLRequest:request];
    NSDictionary *dictionary = [NSDictionary dictionaryWithData:data];
    
## UIColor from HTML color code
FoundationExtension
    
    UIColor *color = [UIColor colorWithHTMLExpression:@"#f0f0f0"];
