//
//  FoundationExtensionTests.m
//  FoundationExtensionTests
//
//  Created by Jeong YunWon on 11. 3. 21..
//  Copyright 2011 youknowone.org All rights reserved.
//

#import <XCTest/XCTest.h>
#import <FoundationExtension/FoundationExtension.h>


@interface TestObject : NSObject {
@private
    id obj1;
    NSString *obj2;
    NSString *obj3;
    NSInteger val;
}

@end

@implementation TestObject

- (instancetype)init {
    self = [super init];
    self->obj1 = self;
    self->obj2 = nil;
    self->obj3 = nil;
    self->val = 42;
    return self;
}

@end


@interface TestObject (Private)

@property(nonatomic, readonly) NSInteger val;
@property(nonatomic, assign) id obj1;
@property(nonatomic, retain) NSString *obj2;
@property(nonatomic, copy) NSString *obj3;

@end


@implementation TestObject (Private)

NSAPropertyGetterForType(val, @"val", NSInteger)

NSAPropertyGetter(obj1, @"obj1")
NSAPropertyAssignSetter(setObj1, @"obj1")
NSAPropertyGetter(obj2, @"obj2")
NSAPropertyRetainSetter(setObj2, @"obj2")
NSAPropertyGetter(obj3, @"obj3")
NSAPropertyCopySetter(setObj3, @"obj3")

@end


@interface FoundationExtensionTests : XCTestCase<NSTimerDelegate>

@end


@implementation FoundationExtensionTests

- (void)timerHasFired:(NSTimer *)timer {
    // never
}

- (BOOL)timerShouldRepeat:(NSTimer *)timer {
    return NO;
}

- (void)setUp
{
    [super setUp];

    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.

    [super tearDown];
}

//- (void)testClassName {
//    id className = [[[self class] name] copy];
//    XCTAssertTrue([className isEqualToString:@"FoundationExtensionTests"], @"Taken name is: %@", className); // causes error
//}

- (void)testClassObject {
    NSAString *string = [[NSAString alloc] initWithString:@"blah"];
    XCTAssertEqual(string.class, [NSAString class], @"");
}

- (void)testRuntimeAccessor {
    TestObject *obj = [[TestObject alloc] init];
    XCTAssertEqual(obj.val, (NSInteger)42, @"");

    NSString *new = [NSMutableString stringWithString:@"Hello"]; // to make new object.

    XCTAssertEqual(obj.obj1, obj, @"");
    obj.obj1 = new;
    XCTAssertEqual(obj.obj1, new, @"");
    obj.obj1 = nil;
    XCTAssertEqual(obj.obj1, (NSObject *)nil, @"");

    XCTAssertEqual((id)obj.obj2, (id)nil, @"");
    obj.obj2 = new;
    XCTAssertEqual(obj.obj2, new, @"");
    obj.obj2 = nil;
    XCTAssertEqual(obj.obj2, (NSObject *)nil, @"");

    XCTAssertEqual((id)obj.obj3, (id)nil, @"");
    obj.obj3 = new;
    XCTAssertFalse(obj.obj3 == new, @"");
    XCTAssertEqualObjects(obj.obj3, new, @"");
    obj.obj3 = nil;
    XCTAssertEqual(obj.obj3, (NSObject *)nil, @"");

    [obj self];
}

- (int)return0 { return 0; }
- (int)return1 { return 1; }

- (void)testClassMethod {
    XCTAssertEqual(0, [self return0], @"");
    XCTAssertEqual(1, [self return1], @"");
    {
        NSAMethod *m0 = [self.class methodObjectForSelector:@selector(return0)];
        NSAMethod *m1 = [self.class methodObjectForSelector:@selector(return0)];
        XCTAssertEqual(m0.method, m1.method, @"");
        XCTAssertEqualObjects(m0, m1, @"");
    }
    {
        NSAMethod *m0 = [self.class methodObjectForSelector:@selector(return0)];
        NSAMethod *m1 = [self.class methodObjectForSelector:@selector(return1)];
        m0.implementation = m1.implementation;
        XCTAssertEqual(1, [self return0], @"");
    }
}



- (void)testString {
    XCTAssertEqual([@"Hello, World" hasSubstring:@""], NO, @"");
}

- (void)testStringFormat {
    {
        NSString *formatted = [@"%d %d %d" format0:nil, 10, 9, 8];
        XCTAssertTrue([formatted isEqualToString:@"10 9 8"], @"formatted was: %@", formatted);
    }
    {
        NSString *formatted = [@"%@ %d %s" format:@"Hello", 10, "World"];
        XCTAssertTrue([formatted isEqualToString:@"Hello 10 World"], @"formatted was: %@", formatted);
    }
    {
        NSString *formatted = [@"%@" format:@"Hello"];
        XCTAssertTrue([formatted isEqualToString:@"Hello"], @"formatted was: %@", formatted);
    }
    {
        NSString *formatted = [@"%%%%%@" format:@"Hello"];
        XCTAssertTrue([formatted isEqualToString:@"%%Hello"], @"formatted was: %@", formatted);
    }
    {
        NSString *aPath = @"/tmp";
        NSString *test = [aPath stringByAppendingPathFormat:@"/%@/%@", @"dir", @"file.ext"];
        XCTAssertTrue([test isEqualToString:@"/tmp/dir/file.ext"], @"result: %@", test);
    }
    {
        NSMutableString *string = [NSMutableString stringWithFormat:@"format %d", 1];
        [string appendString:@" hi"];
        XCTAssertEqualObjects(string, @"format 1 hi", @"");
    }
}

- (void)testStringConcatnation {
    NSString *concat = [NSString stringWithConcatnatingStrings:@"Hello, ", @"World!", nil];

    XCTAssertTrue([concat isEqualToString:@"Hello, World!"], @"");
}

- (void)testStringTrimming {
    XCTAssertEqualObjects([@"  \thi \t" stringByTrimmingWhitespaceCharacters], @"hi", @"");
    XCTAssertEqualObjects([@"  \thi \n\t" stringByTrimmingWhitespaceCharacters], @"hi \n", @"");
    XCTAssertEqualObjects([@"  \thi \n\t" stringByTrimmingWhitespaceAndNewlineCharacters], @"hi", @"");
}

- (void)testArrayRearrangement {
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@0, @1, @2, @3, @4, nil];
    XCTAssertEqualObjects(array, (@[@0, @1, @2, @3, @4]), @"result: %@", array);
    [array moveObjectAtIndex:3 toIndex:3];
    XCTAssertEqualObjects(array, (@[@0, @1, @2, @3, @4]), @"result: %@", array);

    array = [NSMutableArray arrayWithObjects:@0, @1, @2, @3, @4, nil];
    XCTAssertEqualObjects(array, (@[@0, @1, @2, @3, @4]), @"result: %@", array);
    [array moveObjectAtIndex:0 toIndex:3];
    XCTAssertEqualObjects(array, (@[@1, @2, @3, @0, @4]), @"result: %@", array);

    array = [NSMutableArray arrayWithObjects:@0, @1, @2, @3, @4, nil];
    XCTAssertEqualObjects(array, (@[@0, @1, @2, @3, @4]), @"result: %@", array);
    [array moveObjectAtIndex:4 toIndex:0];
    XCTAssertEqualObjects(array, (@[@4, @0, @1, @2, @3]), @"result: %@", array);
}

- (void)testArrayWithEnumerator {
    NSArray *array = @[@1, @2, @3];
    NSArray *newArray = [NSArray arrayWithEnumerator:array.objectEnumerator];

    XCTAssertEqualObjects(array, newArray, @"");
}

- (void)testHexadecimalString {
    NSData *data = [NSData dataWithBytes:"\0aa\0" length:4];
    NSString *result = [data hexadecimalString];
    XCTAssertTrue([result isEqualToString:@"00616100"], @"");
}

- (void)testBase64String {
    // test from http://en.wikipedia.org/wiki/Base64#Examples
    NSData *data = [@"Man is distinguished, not only by his reason, but by this singular passion from other animals, which is a lust of the mind, that by a perseverance of delight in the continued and indefatigable generation of knowledge, exceeds the short vehemence of any carnal pleasure." dataUsingUTF8Encoding];
    NSString *solution = @"TWFuIGlzIGRpc3Rpbmd1aXNoZWQsIG5vdCBvbmx5IGJ5IGhpcyByZWFzb24sIGJ1dCBieSB0aGlzIHNpbmd1bGFyIHBhc3Npb24gZnJvbSBvdGhlciBhbmltYWxzLCB3aGljaCBpcyBhIGx1c3Qgb2YgdGhlIG1pbmQsIHRoYXQgYnkgYSBwZXJzZXZlcmFuY2Ugb2YgZGVsaWdodCBpbiB0aGUgY29udGludWVkIGFuZCBpbmRlZmF0aWdhYmxlIGdlbmVyYXRpb24gb2Yga25vd2xlZGdlLCBleGNlZWRzIHRoZSBzaG9ydCB2ZWhlbWVuY2Ugb2YgYW55IGNhcm5hbCBwbGVhc3VyZS4=";
    NSString *encode = [data base64String];
    XCTAssertEqual(encode.length, solution.length, @"length: %luu expected: %lu",(unsigned long) (unsigned long)encode.length, (unsigned long)solution.length);
    XCTAssertTrue([encode isEqualToString:solution], @"result: %@", encode);

    NSData *decode = [NSData dataWithBase64String:solution];
    XCTAssertEqual(decode.length, data.length, @"length: %lu expected: %lu", (unsigned long)decode.length, (unsigned long)data.length);
    XCTAssertTrue([decode isEqualToData:data], @"result: %@ expected: %@", [NSString stringWithUTF8Data:decode], [NSString stringWithUTF8Data:data]);
}

- (void)testHexadecimal
{
    NSData *data = [@"SAMPLE" dataUsingEncoding:NSUTF8StringEncoding];
    XCTAssertTrue([[data hexadecimalString] isEqual:@"53414d504c45"], @"hexadecimal encode");

    XCTAssertTrue([@"SAMPLE" isEqual:[NSString stringWithUTF8Data:[NSData dataWithHexadecimalString:@"53414d504c45"]]], @"hexadecimal decode: %@", [NSString stringWithUTF8Data:[NSData dataWithHexadecimalString:@"53414d504c45"]]);
}

- (void)testTuple
{
    NSAMutableTuple *tuple = [NSAMutableTuple tupleWithFirst:@1 second:@2];
    XCTAssertEqual((int)[tuple.first integerValue], 1, @"");
    XCTAssertEqual((int)[tuple.second integerValue], 2, @"");

    tuple.first = @3;
    tuple.second = @4;
    XCTAssertEqual((int)[tuple.first integerValue], 3, @"");
    XCTAssertEqual((int)[tuple.second integerValue], 4, @"");

    [tuple swap];
    XCTAssertEqual((int)[tuple.first integerValue], 4, @"");
    XCTAssertEqual((int)[tuple.second integerValue], 3, @"");
}

- (void)testTriple
{
    NSAMutableTriple *obj = [NSAMutableTriple tripleWithFirst:@1 second:@2 third:@3];
    XCTAssertEqual((int)[obj.first integerValue], 1, @"");
    XCTAssertEqual((int)[obj.second integerValue], 2, @"");
    XCTAssertEqual((int)[obj.third integerValue], 3, @"");

    obj.first = @4;
    obj.second = @5;
    obj.third = @6;
    XCTAssertEqual((int)[obj.first integerValue], 4, @"");
    XCTAssertEqual((int)[obj.second integerValue], 5, @"");
    XCTAssertEqual((int)[obj.third integerValue], 6, @"");
}

- (void)testTimer {
    NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:1.0 delegate:self];
    [timer schedule];
    [timer invalidate];
}

- (void)testEnumerator {
    NSInteger count = 0;
    for (NSString *test in [NSAInfiniteEnumerator enumeratorWithObject:@"test"]) {
        XCTAssertEqualObjects(test, @"test");
        count ++;
        if (count == 10000) {
            break;
        }
    }

    NSInteger sum = 0;
    for (NSNumber *n in [NSARangeEnumerator enumeratorWithCount:10]) {
        sum += n.integerValue;
    }
    XCTAssertEqual(sum, 45);
    for (NSNumber *n in [NSARangeEnumerator enumeratorWithRange:NSMakeRange(10, 91)]) {
        sum += n.integerValue;
    }
    XCTAssertEqual(sum, 5050);

    NSABlockEnumerator *enumerator = [NSABlockEnumerator enumeratorWithBlock:^id(NSUInteger index, BOOL *stop) {
        if (index >= 100) {
            *stop = YES;
        }
        return @(index);
    }];
    sum = 0;
    for (NSNumber *n in enumerator) {
        sum += n.integerValue;
    }
    XCTAssertEqual(sum, 5050);

    NSArray *objects = [[NSARangeEnumerator enumeratorWithCount:5] arrayByMappingOperator:^id(id obj) {
        return [NSNull null];
    }];
    NSArray *nullObjects = [NSArray arrayWithObject:[NSNull null] count:5];
    XCTAssertEqualObjects(objects, nullObjects, @"enum: %@ / init: %@", objects, nullObjects);
}

- (void)testFunctional {
    {
        NSSet *a = [NSSet setWithObjects:@1, @2, @3, @4, nil];
        NSInteger idx = 0;
        for (id i in NSAMap(a.objectEnumerator, ^(id obj) { return @([obj integerValue] - 1); })) {
            idx += 1;
        }
        XCTAssertEqual((int)idx, 4, @"");

        idx = 0;
        for (id i in NSAFilter(a.objectEnumerator, ^(id obj) {
            return (BOOL)([obj integerValue] % 2 == 0);
        })) {
            idx += 1;
            XCTAssertEqual([i integerValue] % 2, 0, @"");
        }
        XCTAssertEqual((int)idx, 2, @"");

        idx = 0;
        for (id i in NSAMapFilter(a.objectEnumerator, ^(id obj) { return ([obj integerValue] % 2 != 0) ? @([obj integerValue] - 1) : nil; })) {
            idx += 1;
        }
        XCTAssertEqual((int)idx, 2, @"");

        NSNumber *res = NSAReduceWithInitialObject(a.objectEnumerator, ^(id obj1, id obj2) { return @([obj1 integerValue] + [obj2 integerValue]); }, @0);
        XCTAssertEqualObjects(res, @10, @"");
    }

    {
        NSOrderedSet *a = [[NSOrderedSet alloc] initWithObjects:@1, @2, @3, @4, nil];
        NSInteger idx = 0;
        for (id i in NSAMap(a.objectEnumerator, ^(id obj) { return @([obj integerValue] - 1); })) {
            XCTAssertEqual([i integerValue], idx, @"");
            idx += 1;
        }
        XCTAssertEqual((int)idx, 4, @"");

        idx = 0;
        for (id i in NSAFilter(a.objectEnumerator, ^(id obj) { return (BOOL)([obj integerValue] % 2 == 0); })) {
            idx += 1;
            XCTAssertEqual([i integerValue] / 2, (idx + 2) / 2, @"");
        }
        XCTAssertEqual((int)idx, 2, @"");

        idx = 0;
        for (id i in NSAMapFilter(a.objectEnumerator, ^(id obj) { return ([obj integerValue] % 2 != 0) ? @([obj integerValue] - 1) : nil; })) {
            idx += 1;
            XCTAssertEqual([i integerValue] / 2, idx / 2, @"");
        }
        XCTAssertEqual((int)idx, 2, @"");

        NSNumber *res = NSAReduceWithInitialObject(a.objectEnumerator, ^(id obj1, id obj2) { return @([obj1 integerValue] + [obj2 integerValue]); }, @0);
        XCTAssertEqualObjects(res, @10, @"");
    }

    {
        NSArray *a = @[@1, @2, @3, @4];
        NSAApplyWithIndex(a.objectEnumerator, ^(NSNumber *obj, NSUInteger index) {
            XCTAssertEqual([obj unsignedIntegerValue] - 1, index, @"");
        });
        [a applyProcedureWithIndex:^(NSNumber *obj, NSUInteger index) {
            XCTAssertEqual([obj unsignedIntegerValue] - 1, index, @"");
        }];

        NSInteger idx = 0;
        for (id i in NSAMap(a.objectEnumerator, ^(id obj) { return @([obj integerValue] - 1); })) {
            XCTAssertEqual([i integerValue], idx, @"");
            idx += 1;
        }
        XCTAssertEqual((int)idx, 4, @"");

        idx = 0;
        for (NSNumber *i in NSAMapWithIndex(a.objectEnumerator, ^id(NSNumber *obj, NSUInteger index) {
            XCTAssertEqual(obj.unsignedIntegerValue - 1, index, @"");
            return @(obj.integerValue + index);
        })) {
            XCTAssertEqual(i.integerValue, idx * 2 + 1, @"");
            idx += 1;
        }

        idx = 0;
        for (NSNumber *i in [a arrayByMappingOperatorWithIndex:^id(NSNumber *obj, NSUInteger index) {
            XCTAssertEqual(obj.unsignedIntegerValue - 1, index, @"");
            return @(obj.integerValue + index);
        }]) {
            XCTAssertEqual(i.integerValue, idx * 2 + 1, @"");
            idx += 1;
        }
        XCTAssertEqual((int)idx, 4, @"");

        idx = 0;
        for (id i in NSAFilter(a.objectEnumerator, ^(id obj) { return (BOOL)([obj integerValue] % 2 == 0); })) {
            idx += 1;
            XCTAssertEqual([i integerValue] / 2, (idx + 2) / 2, @"");
        }
        XCTAssertEqual((int)idx, 2, @"");

        idx = 0;
        for (id i in NSAMapFilter(a.objectEnumerator, ^(id obj) { return ([obj integerValue] % 2 != 0) ? @([obj integerValue] - 1) : nil; })) {
            idx += 1;
            XCTAssertEqual([i integerValue] / 2, idx / 2, @"");
        }
        XCTAssertEqual((int)idx, 2, @"");

        NSNumber *res = NSAReduceWithInitialObject(a.objectEnumerator, ^(id obj1, id obj2) { return @([obj1 integerValue] + [obj2 integerValue]); }, @0);
        XCTAssertEqualObjects(res, @10, @"");
    }

    {
        NSArray *a = @[@1, @2, @3, @4];
        NSArray *r = [a.reverseObjectEnumerator arrayByFilteringOperator:^BOOL(id obj) { return YES; }];
        XCTAssertEqualObjects(r, (@[@4, @3, @2, @1]), @"");

        NSNumber *f = [a firstObjectByFilteringOperator:^BOOL(id obj) { return [obj integerValue] == 1; }];
        XCTAssertEqualObjects(f, @1, @"");
    }

    {
        NSMutableArray *a = [NSMutableArray arrayWithObjects:@1, @2, @3, @4, nil];
        NSInteger idx = 0;
        [a map:^(id obj) { return @([obj integerValue] - 1); }];
        for (id i in a) {
            XCTAssertEqual([i integerValue], idx, @"");
            idx += 1;
        }
        XCTAssertEqual((int)idx, 4, @"");

        a = [NSMutableArray arrayWithObjects:@1, @2, @3, @4, nil];
        idx = 0;
        [a filter:^(id obj) { return (BOOL)([obj integerValue] % 2 == 0); }];
        for (id i in a) {
            idx += 1;
            XCTAssertEqual([i integerValue] / 2, (idx + 2) / 2, @"");
        }
        XCTAssertEqual((int)idx, 2, @"");

        a = [NSMutableArray arrayWithObjects:@1, @2, @3, @4, nil];
        idx = 0;
        [a mapFilter:^(id obj) { return ([obj integerValue] % 2 != 0) ? @([obj integerValue] - 1) : nil; }];
        for (id i in a) {
            idx += 1;
            XCTAssertEqual([i integerValue] / 2, idx / 2, @"");
        }
    }
}

- (void)testAttributedString {
    NSAttributedString *obj = [NSAttributedString attributedString];
    XCTAssertEqualObjects(obj, [[NSAttributedString alloc] initWithString:@""], @"");
}

#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1070
- (void)testJSON {
    id object = [NSJSONSerialization JSONObjectWithString:@"[1, 2, 3]" options:0 error:NULL];
    XCTAssertEqualObjects(object, (@[@1, @2, @3]), @"");
}
#endif

- (void)testOrderedDictionary {
    {
        NSAMutableOrderedDictionary *obj = [NSAMutableOrderedDictionary dictionary];
        obj[@1] = @"1";
        obj[@2] = @"2";
        obj[@3] = @"3";
        obj[@4] = @"4";
        obj[@5] = @"5";
        NSInteger count = 0;
        for (id key in obj) {
            count += 1;
            XCTAssertEqualObjects(obj[key], [NSString stringWithInteger:count], @"");
        }
    }
    {
        NSAOrderedDictionary *obj = [NSAOrderedDictionary dictionaryWithObject:@"obj" forKey:@"key"];
        XCTAssertEqualObjects(obj[@"key"], @"obj", @"");
        XCTAssertEqualObjects([obj objectAtIndex:0], @"obj", @"");
    }
    {
        NSAMutableOrderedDictionary *obj = [NSAMutableOrderedDictionary dictionaryWithObject:@"obj" forKey:@"key"];
        XCTAssertEqualObjects(obj[@"key"], @"obj", @"");
        XCTAssertEqualObjects([obj objectAtIndex:0], @"obj", @"");
    }
}

- (void)testNumber {
    XCTAssertEqualObjects([@0 description], [@0 typeFormedDescription], @"");
    XCTAssertEqualObjects([[@1.0 description] stringByAppendingString:@".0"], [@1.0 typeFormedDescription], @"");
    NSNumber *b = @YES;
    XCTAssertEqualObjects(@"YES", [b typeFormedDescription], @"");
}

- (void)testVersion {
    NSAVersion *version = [NSAVersion versionWithString:@"10.8.4"];
    XCTAssertEqual(version.major, (NSInteger)10, @"");
    XCTAssertEqual(version.minor, (NSInteger)8, @"");
    XCTAssertEqual(version.bugfix, (NSInteger)4, @"");
}

- (void)testShuffle {
    NSMutableArray *array = [@[@"1", @"2", @"3"] mutableCopy];
    [array shuffle];
    XCTAssertEqual(array.count, (NSUInteger)3);
}


@end
