//
//  ICDataObject.h
//  FoundationExtension
//
//  Created by youknowone on 12. 3. 30..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

@interface NSATuple: NSObject {
    id _first, _second;
}
@property(nonatomic, retain) id first, second;

+ (id)tuple;

- (id)initWithFirst:(id)first second:(id)second;
+ (id)tupleWithFirst:(id)first second:(id)second;

- (void)swap;

@end

@interface NSATriple: NSObject {
    id _first, _second, _third;
}
@property(nonatomic, retain) id first, second, third;

+ (id)triple;

- (id)initWithFirst:(id)first second:(id)second third:(id)third;
+ (id)tripleWithFirst:(id)first second:(id)second third:(id)third;

@end