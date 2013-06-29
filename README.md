@mainpage FoundationExtension

This library includes small Cocoa/UIKit extensions. This library does not includes high-level data structure, algorithm or frameworks, but collection of code snippets.

 * Many common snippets in a method call.
 * Looks like native foundation methods - It follows Apple Coding Guideline and Foundation naming convention.

See document on [Github] (http://youknowone.github.com/FoundationExtension)

# Download

    git clone git://github.com/youknowone/FoundationExtension.git
    cd FoundationExtension
    git submodule update --init

# How to use
* Compiled library
  1. Build project
  2. Add FoundationExtension or UIKitExtension target as dependency
* Directy source
  1. Add files what you need to your project
* CocoaPod
  1. Visit and follow http://cocoapods.org/

If your compiler is gcc or old clang, add '-force\_load' to static library.

# Why useful
Make your code short! Do not allow evil objc to make your code verbose.
This library includes many shortcuts for common work.

## NSData from URL
Foundation

    NSString *URLString = [NSSring stringWithFormat:@"http://"HOST_URL"/api/%@", key];
    NSURL *URL = [NSURL URLWithString:URLString];

FoundationExtension

    NSURL *URL = [[@"http://"HOST_URL"/api/%@" format:key] URL];

@see @ref NSString(Shortcuts)
@see @ref NSString(NSURL)

## iPhone MAC Address
Foundation
  * No way.

FoundationExtension

    [[UIDevice currentDevice] MACAddress]

@see @ref UIDevice(Shortcuts)

## performSelector, with 3 object
Foundation
  * No way. You should use <objc/runtime.h>

FoundationExtension

    [obj performSelector:sel withObject:o1 withObject:o2 withObject:o3];

@see @ref NSObject(ObjCRuntime)

## Get NSData from post request
Foundation

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:@"field1=value1"];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];

FoundationExtension

    NSData *data = [NSData dataWithContentsOfURL:URL postBody:@{@"field1":@"value1"} encoding:NSUTF8StringEncoding];

@see @ref NSData(NSURLRequest)

## Get NSData from Multipart Form POST
Foundation
  * No way.

FoundationExtension

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    [request setHTTPMultiPartFormPostBody:@{@"filename":data} encoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithContentOfURLRequest:request];

@see NSURLRequestAdditions.h

## Truncate strings in array
Foundation

    NSMutableArray *newArray = [NSMutableArray array];
    for (NSString *s in array) {
        [newArray addObject:[s substringToIndex:20]];
    }

FoundationExtension NSArray

    NSArray *newArray = [array arrayByMappingOperation:^(NSString *obj){ [obj substringToIndex:20]; }];

FoundationExtension NSMutableArray

    [array map::^(NSString *obj){ [obj substringToIndex:20]; }];

@see @ref Map/Filter/Reduce
@see NSAFunctional.h

## Get a class name
Foundation

    NSString *className = [NSString stringWithUTF8String:class_getName(obj.class)];

FoundationExtension

    NSString *className = obj.class.name;

@see @ref NSObject(ObjCRuntime)
@see @ref NSObject(ObjCRuntimeClass)

## encode/decode base64 string (especially for In-App Purchase / Facebook API)
Foundation
  * No way.

FoundationExtension

    NSString *base64String = [data base64String];

    NSData *data = [NSData dataWithBase64String:base64]

@see @ref NSData(Serialization)

## Get hexadecimal value from base 16 string
Foundation

    int value;
    sscanf(string.UTF8String, "%x", &value);

FoundationExtension

    NSInteger value = [string hexadecimalValue];

@see @ref NSData(Serialization)

## How about base 12 string?
Foundation
  * Why should foundation has this?

FoundationExtension

    NSInteger value = [string integetValueBase:12];

@see @ref NSString(Evaluation)

## md5 hash
Foundation

    unsigned char hashedChars[CC_MD5_DIGEST_LENGTH];
    CC_MD5([data bytes], (CC_LONG)[self length], hashedChars);
    NSMutableString *result = [[NSMutableString alloc] init];
    for ( int i = 0; i<CC_MD5_DIGEST_LENGTH; i++ ) {
        [result appendFormat:@"%02x", *(hashedChars+i)];
    }

FoundationExtension

    NSString *result = [data digestStringByMD5];

@see @ref NSData(CommonCrypto)

## plist dictionary decode from HTTP post request
Foundation
  * Get data from NSURLRequest. Ehh.. so what can I do now? (Use NSPropertyListSerialization)

FoundationExtension

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    [request setHTTPPostBody:@{@"key1":@"value1"} encoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithContentOfURLRequest:request];
    NSDictionary *dictionary = [NSDictionary dictionaryWithData:data];

@see @ref NSMutableURLRequest(HTTPMethod)
@see @ref NSData(NSURLRequest)
@see @ref NSDictionary(NSData)

## UIColor from HTML color code
UIKitExtension

    UIColor *color = [UIColor colorWithHTMLExpression:@"#f0f0f0"];

@see @ref UIColor(HTMLColor)

## Change implementation to new one
FoundationExtension

    [class methodObjectForSelector:@selector(method1)].implementation
      = [class methodObjectForSelector:@selector(method2)].implementation;
    // now [obj method1] equals [obj method2]

@see NSAMethod

## Retrieve accessibility for private variable.
FoundationExtension

    @interface Secret: NSObject { @private id _attr; } @end // #1 remember the '_attr'
    // Hack the Secret!
    @interface Secret (Accessor)
    @property
        (nonatomic, retain) id attr; // #2 remember the 'attr'
    @end
    @implementation Secret (Accessor)
    NSAPropertyGetter(attr, "_attr") // #2, #1 to create getter
    NSAPropertyRetainSetter(setAttr, "_attr") // #2, #1 to create getter
    @end

@see NSObject(ObjCRuntime)

## For more
See the document! [http://youknowone.github.com/FoundationExtension] (http://youknowone.github.com/FoundationExtension)
