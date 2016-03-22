//
//  NSArrayRC.m
//  FoundationExtensionRC
//
//  Created by Jeong YunWon on 2016. 3. 21..
//  Copyright © 2016년 youknowone.org. All rights reserved.
//

#import "NSArrayRC.h"


@implementation NSArray (CreationRC)

- (instancetype)initWithObject:(id)object count:(NSUInteger)count {
    id *objects = (__unsafe_unretained id *)malloc(sizeof(id) * count);
    for (NSUInteger i = 0; i < count; i++) {
        objects[i] = object;
    }
    self = [self initWithObjects:objects count:count];
    free(objects);
    return self;
}

+ (instancetype)arrayWithObject:(id)object count:(NSUInteger)count {
    return [[[self alloc] initWithObject:object count:count] autorelease];
}

- (instancetype)initWithObjectCopy:(id)object count:(NSUInteger)count mutable:(BOOL)flag {
    id *objects = malloc(sizeof(id) * count);
    if (flag) {
        for (NSUInteger i = 0; i < count; i++) {
            objects[i] = [object mutableCopy];
        }
    } else {
        for (NSUInteger i = 0; i < count; i++) {
            objects[i] = [object copy];
        }
    }
    typeof(self) result = [self initWithObjects:objects count:count];
    free(objects);
    return result;

}

@end
