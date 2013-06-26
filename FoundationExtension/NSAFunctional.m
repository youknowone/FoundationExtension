//
//  NSAFunctional.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 12. 10. 30..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import "NSAFunctional.h"

void NSAApply(id<NSFastEnumeration> enumerator, NSAObjectProcedure procedure) {
    for (id item in enumerator) {
        procedure(item);
    }
}

void NSAApplyWithIndex(id<NSFastEnumeration> enumerator, NSAObjectProcedureWithIndex procedure) {
    NSUInteger index = 0;
    for (id item in enumerator) {
        procedure(item, index);
        index += 1;
    }
}

#pragma mark -

@interface _NSAFunctionalMapEnumerator : NSEnumerator {
    NSEnumerator *_enumerator;
    NSAObjectUnaryOperator _mapper;
}

- (id)initWithEnumerator:(NSEnumerator *)enumerator mapper:(NSAObjectUnaryOperator)mapper;

@end

@implementation _NSAFunctionalMapEnumerator

- (id)initWithEnumerator:(NSEnumerator *)enumerator mapper:(NSAObjectUnaryOperator)mapper {
    self = [super init];
    if (self != nil) {
        self->_mapper = mapper;
        self->_enumerator = enumerator;
    }
    return self;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id [])stackbuf count:(NSUInteger)len {
    if(state->state == 0)
    {
        state->state = 1;
        state->mutationsPtr = &state->extra[0];
    }

    NSUInteger count = [self->_enumerator countByEnumeratingWithState:state objects:stackbuf count:len];
    for (NSUInteger i = 0; i < count; i++) {
        stackbuf[i] = self->_mapper(stackbuf[i]);
    }
    return count;
}

@end

NSEnumerator *NSAMap(NSEnumerator *enumerator, NSAObjectUnaryOperator mapper) {
    return [[[_NSAFunctionalMapEnumerator alloc] initWithEnumerator:enumerator mapper:mapper] autorelease];
}


@interface _NSAFunctionalMapWithIndexEnumerator : NSEnumerator {
    NSEnumerator *_enumerator;
    NSAObjectUnaryOperatorWithIndex _mapper;
}

- (id)initWithEnumerator:(NSEnumerator *)enumerator mapper:(NSAObjectUnaryOperatorWithIndex)mapper;

@end

@implementation _NSAFunctionalMapWithIndexEnumerator

- (id)initWithEnumerator:(NSEnumerator *)enumerator mapper:(NSAObjectUnaryOperatorWithIndex)mapper {
    self = [super init];
    if (self != nil) {
        self->_mapper = mapper;
        self->_enumerator = enumerator;
    }
    return self;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id [])stackbuf count:(NSUInteger)len {
    if(state->state == 0)
    {
        state->mutationsPtr = &state->extra[0];
    }

    NSUInteger count = [self->_enumerator countByEnumeratingWithState:state objects:stackbuf count:len];
    for (NSUInteger i = 0; i < count; i++) {
        stackbuf[i] = self->_mapper(stackbuf[i], state->state);
        state->state += 1;
    }
    return count;
}

@end

NSEnumerator *NSAMapWithIndex(NSEnumerator *enumerator, NSAObjectUnaryOperatorWithIndex mapper) {
    return [[[_NSAFunctionalMapWithIndexEnumerator alloc] initWithEnumerator:enumerator mapper:mapper] autorelease];
}

#pragma mark -

@interface _NSAFunctionalMapFilterEnumerator : NSEnumerator {
    NSEnumerator *_enumerator;
    NSAObjectUnaryOperator _mapper;
}

- (id)initWithEnumerator:(NSEnumerator *)enumerator mapper:(NSAObjectUnaryOperator)mapper;

@end

@implementation _NSAFunctionalMapFilterEnumerator

- (id)initWithEnumerator:(NSEnumerator *)enumerator mapper:(NSAObjectUnaryOperator)mapper {
    self = [super init];
    if (self != nil) {
        self->_mapper = mapper;
        self->_enumerator = enumerator;
    }
    return self;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id [])stackbuf count:(NSUInteger)len {
    if(state->state == 0)
    {
        state->state = 1;
        state->mutationsPtr = &state->extra[0];
    }
    state->itemsPtr = stackbuf;

    NSUInteger count = 0;
    id obj;
    while((obj = [_enumerator nextObject]) && (count < len))
    {
        id res = self->_mapper(obj);
        if (res == nil) {
            continue;
        }
        stackbuf[count] = res;
        count++;
    }
    return count;
}

@end

NSEnumerator *NSAMapFilter(NSEnumerator *enumerator, NSAObjectUnaryOperator mapper) {
    return [[[_NSAFunctionalMapFilterEnumerator alloc] initWithEnumerator:enumerator mapper:mapper] autorelease];
}


@interface _NSAFunctionalMapFilterWithIndexEnumerator : NSEnumerator {
    NSEnumerator *_enumerator;
    NSAObjectUnaryOperatorWithIndex _mapper;
}

- (id)initWithEnumerator:(NSEnumerator *)enumerator mapper:(NSAObjectUnaryOperatorWithIndex)mapper;

@end

@implementation _NSAFunctionalMapFilterWithIndexEnumerator

- (id)initWithEnumerator:(NSEnumerator *)enumerator mapper:(NSAObjectUnaryOperatorWithIndex)mapper {
    self = [super init];
    if (self != nil) {
        self->_mapper = mapper;
        self->_enumerator = enumerator;
    }
    return self;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id [])stackbuf count:(NSUInteger)len {
    if(state->state == 0)
    {
        state->mutationsPtr = &state->extra[0];
    }
    state->itemsPtr = stackbuf;

    NSUInteger count = 0;
    id obj;
    while((obj = [_enumerator nextObject]) && (count < len))
    {
        id res = self->_mapper(obj, state->state);
        state->state++;
        if (res == nil) {
            continue;
        }
        stackbuf[count] = res;
        count++;
    }
    return count;
}

@end

NSEnumerator *NSAMapFilterWithIndex(NSEnumerator *enumerator, NSAObjectUnaryOperatorWithIndex mapper) {
    return [[[_NSAFunctionalMapFilterWithIndexEnumerator alloc] initWithEnumerator:enumerator mapper:mapper] autorelease];
}

#pragma mark -

@interface _NSAFunctionalFilterEnumerator : NSEnumerator {
    NSEnumerator *_enumerator;
    NSAObjectPicker _filter;
}

- (id)initWithEnumerator:(NSEnumerator *)enumerator filter:(NSAObjectPicker)filter;

@end

@implementation _NSAFunctionalFilterEnumerator

- (id)initWithEnumerator:(NSEnumerator *)enumerator filter:(NSAObjectPicker)filter {
    self = [super init];
    if (self != nil) {
        self->_filter = filter;
        self->_enumerator = enumerator;
    }
    return self;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id [])stackbuf count:(NSUInteger)len {
    if(state->state == 0)
    {
        state->state = 1;
        state->mutationsPtr = &state->extra[0];
    }
    state->itemsPtr = stackbuf;

    NSUInteger count = 0;
    id obj;
    while((obj = [_enumerator nextObject]) && (count < len))
    {
        if (!self->_filter(obj)) {
            continue;
        }
        stackbuf[count] = obj;
        count++;
    }
    return count;
}

@end

NSEnumerator *NSAFilter(NSEnumerator *enumerator, NSAObjectPicker filter) {
    return [[[_NSAFunctionalFilterEnumerator alloc] initWithEnumerator:enumerator filter:filter] autorelease];
}


@interface _NSAFunctionalFilterWithIndexEnumerator : NSEnumerator {
    NSEnumerator *_enumerator;
    NSAObjectPickerWithIndex _filter;
}

- (id)initWithEnumerator:(NSEnumerator *)enumerator filter:(NSAObjectPickerWithIndex)filter;

@end

@implementation _NSAFunctionalFilterWithIndexEnumerator

- (id)initWithEnumerator:(NSEnumerator *)enumerator filter:(NSAObjectPickerWithIndex)filter {
    self = [super init];
    if (self != nil) {
        self->_filter = filter;
        self->_enumerator = enumerator;
    }
    return self;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id [])stackbuf count:(NSUInteger)len {
    if(state->state == 0)
    {
        state->mutationsPtr = &state->extra[0];
    }
    state->itemsPtr = stackbuf;

    NSUInteger count = 0;
    id obj;
    while((obj = [_enumerator nextObject]) && (count < len))
    {
        BOOL result = self->_filter(obj, state->state);
        state->state++;
        if (!result) {
            continue;
        }
        stackbuf[count] = obj;
        count++;
    }
    return count;
}

@end

NSEnumerator *NSAFilterWithIndex(NSEnumerator *enumerator, NSAObjectPickerWithIndex filter) {
    return [[[_NSAFunctionalFilterWithIndexEnumerator alloc] initWithEnumerator:enumerator filter:filter] autorelease];
}

#pragma mark -

id NSAReduce(NSEnumerator *enumerator, NSAObjectBinaryOperator operation) {
    return NSAReduceWithInitialObject(enumerator, operation, [operation nextObject]);
}

id NSAReduceWithInitialObject(id<NSFastEnumeration> enumerator, NSAObjectBinaryOperator operation, id initial) {
    id res = initial;
    for (id obj in enumerator) {
        res = operation(res, obj);
    }
    return res;
}

#pragma mark -

@implementation NSEnumerator (Functional)

- (void)applyProcedure:(NSAObjectProcedure)procedure {
    NSAApply(self, procedure);
}

- (void)applyProcedureWithIndex:(NSAObjectProcedureWithIndex)procedure {
    NSAApplyWithIndex(self, procedure);
}

- (NSArray *)arrayByMappingOperator:(NSAObjectUnaryOperator)mapper {
    return NSAMap(self, mapper).allObjects;
}

- (NSArray *)arrayByMappingOperatorWithIndex:(NSAObjectUnaryOperatorWithIndex)mapper {
    return NSAMapWithIndex(self, mapper).allObjects;
}

- (NSArray *)arrayByMapFilteringOperator:(NSAObjectUnaryOperator)mapper {
    return NSAMapFilter(self, mapper).allObjects;
}

- (NSArray *)arrayByMapFilteringOperatorWithIndex:(NSAObjectUnaryOperatorWithIndex)mapper {
    return NSAMapFilterWithIndex(self, mapper).allObjects;
}

- (NSArray *)arrayByFilteringOperator:(NSAObjectPicker)filter {
    return NSAFilter(self, filter).allObjects;
}

- (NSArray *)arrayByFilteringOperatorWithIndex:(NSAObjectPickerWithIndex)filter {
    return NSAFilterWithIndex(self, filter).allObjects;
}

- (id)reduce:(NSAObjectBinaryOperator)reduce {
    return NSAReduce(self, reduce);
}

- (id)reduce:(NSAObjectBinaryOperator)reduce initialObject:(id)initialObject {
    return NSAReduceWithInitialObject(self, reduce, initialObject);
}

@end


@implementation NSArray (Functional)

- (void)applyProcedure:(NSAObjectProcedure)procedure {
    NSAApply(self, procedure);
}

- (void)applyProcedureWithIndex:(NSAObjectProcedureWithIndex)procedure {
    NSAApplyWithIndex(self, procedure);
}

- (NSArray *)arrayByMappingOperator:(NSAObjectUnaryOperator)mapper {
    return NSAMap(self.objectEnumerator, mapper).allObjects;
}

- (NSArray *)arrayByMappingOperatorWithIndex:(NSAObjectUnaryOperatorWithIndex)mapper {
    return NSAMapWithIndex(self.objectEnumerator, mapper).allObjects;
}

- (NSArray *)arrayByMapFilteringOperator:(NSAObjectUnaryOperator)mapper {
    return NSAMapFilter(self.objectEnumerator, mapper).allObjects;
}

- (NSArray *)arrayByMapFilteringOperatorWithIndex:(NSAObjectUnaryOperatorWithIndex)mapper {
    return NSAMapFilterWithIndex(self.objectEnumerator, mapper).allObjects;
}

- (NSArray *)arrayByFilteringOperator:(NSAObjectPicker)filter {
    return NSAFilter(self.objectEnumerator, filter).allObjects;
}

- (NSArray *)arrayByFilteringOperatorWithIndex:(NSAObjectPickerWithIndex)filter {
    return NSAFilterWithIndex(self.objectEnumerator, filter).allObjects;
}

- (id)reduce:(NSAObjectBinaryOperator)reduce {
    return NSAReduce(self.objectEnumerator, reduce);
}

- (id)reduce:(NSAObjectBinaryOperator)reduce initialObject:(id)initialObject {
    return NSAReduceWithInitialObject(self.objectEnumerator, reduce, initialObject);
}

@end


@implementation NSMutableArray (Functional)

- (void)map:(NSAObjectUnaryOperator)mapper {
    NSUInteger count = self.count;
    for (NSUInteger i = 0; i < count; i++) {
        self[i] = mapper(self[i]);
    }
}

- (void)mapWithIndex:(NSAObjectUnaryOperatorWithIndex)mapper {
    NSUInteger count = self.count;
    for (NSUInteger i = 0; i < count; i++) {
        self[i] = mapper(self[i], i);
    }
}

- (void)mapFilter:(NSAObjectUnaryOperator)mapper {
    NSMutableIndexSet *removes = [[NSMutableIndexSet alloc] init];
    NSUInteger count = self.count;
    for (NSUInteger i = 0; i < count; i++) {
        id result = mapper(self[i]);
        if (result == nil) {
            [removes addIndex:i];
        } else {
            self[i] = result;
        }
    }
    [self removeObjectsAtIndexes:removes];
    [removes release];
}

- (void)mapFilterWithIndex:(NSAObjectUnaryOperatorWithIndex)mapper {
    NSMutableIndexSet *removes = [[NSMutableIndexSet alloc] init];
    NSUInteger count = self.count;
    for (NSUInteger i = 0; i < count; i++) {
        id result = mapper(self[i], i);
        if (result == nil) {
            [removes addIndex:i];
        } else {
            self[i] = result;
        }
    }
    [self removeObjectsAtIndexes:removes];
    [removes release];
}

- (void)filter:(NSAObjectPicker)filter {
    NSMutableIndexSet *removes = [[NSMutableIndexSet alloc] init];
    NSUInteger count = self.count;
    for (NSUInteger i = 0; i < count; i++) {
        BOOL result = filter(self[i]);
        if (!result) {
            [removes addIndex:i];
        }
    }
    [self removeObjectsAtIndexes:removes];
    [removes release];
}

- (void)filterWithIndex:(NSAObjectPickerWithIndex)filter {
    NSMutableIndexSet *removes = [[NSMutableIndexSet alloc] init];
    NSUInteger count = self.count;
    for (NSUInteger i = 0; i < count; i++) {
        BOOL result = filter(self[i], i);
        if (!result) {
            [removes addIndex:i];
        }
    }
    [self removeObjectsAtIndexes:removes];
    [removes release];
}

@end


@implementation NSDictionary (Functional)

- (void)applyProcedureWithKey:(NSAObjectProcedureWithKey)procedure {
    for (id key in self.keyEnumerator) {
        procedure(self[key], key);
    }
}

- (NSDictionary *)dictionaryByMappingOperator:(NSAObjectUnaryOperator)mapper {
    NSUInteger length = self.count;
    id *objects = malloc(sizeof(id) * length);
    id<NSCopying> *keys = malloc(sizeof(id<NSCopying>) * length);
    NSInteger i = 0;
    for (id key in self.keyEnumerator) {
        keys[i] = key;
        objects[i] = mapper(self[key]);
        i += 1;
    }
    NSDictionary *result = [NSDictionary dictionaryWithObjects:objects forKeys:keys count:length];
    free(objects);
    free(keys);
    return result;
}

- (NSDictionary *)dictionaryByMappingOperatorWithKey:(NSAObjectUnaryOperatorWithKey)mapper {
    NSUInteger length = self.count;
    id *objects = malloc(sizeof(id) * length);
    id<NSCopying> *keys = malloc(sizeof(id<NSCopying>) * length);
    NSInteger i = 0;
    for (id key in self.keyEnumerator) {
        keys[i] = key;
        objects[i] = mapper(self[key], key);
        i += 1;
    }
    NSDictionary *result = [NSDictionary dictionaryWithObjects:objects forKeys:keys count:length];
    free(objects);
    free(keys);
    return result;
}

- (NSDictionary *)dictionaryByMapFilteringOperator:(NSAObjectUnaryOperator)mapper {
    NSUInteger length = self.count;
    id *objects = malloc(sizeof(id) * length);
    id<NSCopying> *keys = malloc(sizeof(id<NSCopying>) * length);
    NSInteger i = 0;
    for (id key in self.keyEnumerator) {
        id object = mapper(self[key]);
        if (object) {
            keys[i] = key;
            objects[i] = object;
            i += 1;
        }
    }
    NSDictionary *result = [NSDictionary dictionaryWithObjects:objects forKeys:keys count:i];
    free(objects);
    free(keys);
    return result;
}

- (NSDictionary *)dictionaryByMapFilteringOperatorWithKey:(NSAObjectUnaryOperatorWithKey)mapper {
    NSUInteger length = self.count;
    id *objects = malloc(sizeof(id) * length);
    id<NSCopying> *keys = malloc(sizeof(id<NSCopying>) * length);
    NSInteger i = 0;
    for (id key in self.keyEnumerator) {
        id object = mapper(self[key], key);
        if (object) {
            keys[i] = key;
            objects[i] = object;
            i += 1;
        }
    }
    NSDictionary *result = [NSDictionary dictionaryWithObjects:objects forKeys:keys count:i];
    free(objects);
    free(keys);
    return result;
}

- (NSDictionary *)dictionaryByFilteringOperator:(NSAObjectPicker)filter {
    NSUInteger length = self.count;
    id *objects = malloc(sizeof(id) * length);
    id<NSCopying> *keys = malloc(sizeof(id<NSCopying>) * length);
    NSInteger i = 0;
    for (id key in self.keyEnumerator) {
        id object = self[key];
        if (filter(object)) {
            keys[i] = key;
            objects[i] = object;
            i += 1;
        }
    }
    NSDictionary *result = [NSDictionary dictionaryWithObjects:objects forKeys:keys count:i];
    free(objects);
    free(keys);
    return result;
}

- (NSDictionary *)dictionaryByFilteringOperatorWithKey:(NSAObjectPickerWithKey)filter {
    NSUInteger length = self.count;
    id *objects = malloc(sizeof(id) * length);
    id<NSCopying> *keys = malloc(sizeof(id<NSCopying>) * length);
    NSInteger i = 0;
    for (id key in self.keyEnumerator) {
        id object = self[key];
        if (filter(object, key)) {
            keys[i] = key;
            objects[i] = object;
            i += 1;
        }
    }
    NSDictionary *result = [NSDictionary dictionaryWithObjects:objects forKeys:keys count:i];
    free(objects);
    free(keys);
    return result;
}

@end


@implementation NSMutableDictionary (Functional)

- (void)map:(NSAObjectUnaryOperator)mapper {
    for (id key in self.keyEnumerator) {
        id object = mapper(self[key]);
        self[key] = object;
    }
}

- (void)mapWithKey:(NSAObjectUnaryOperatorWithKey)mapper {
    for (id key in self.keyEnumerator) {
        id object = mapper(self[key], key);
        self[key] = object;
    }
}

- (void)mapFilter:(NSAObjectUnaryOperator)mapper {
    NSMutableArray *candidates = [NSMutableArray array];
    for (id key in self.keyEnumerator) {
        id object = mapper(self[key]);
        if (object == nil) {
            [candidates addObject:key];
        } else {
            self[key] = object;
        }
    }
    for (id key in candidates) {
        [self removeObjectForKey:key];
    }
}

- (void)mapFilterWithKey:(NSAObjectUnaryOperatorWithKey)mapper {
    NSMutableArray *candidates = [NSMutableArray array];
    for (id key in self.keyEnumerator) {
        id object = mapper(self[key], key);
        if (object == nil) {
            [candidates addObject:key];
        } else {
            self[key] = object;
        }
    }
    for (id key in candidates) {
        [self removeObjectForKey:key];
    }
}

- (void)filter:(NSAObjectPicker)filter {
    NSMutableArray *candidates = [NSMutableArray array];
    for (id key in self.keyEnumerator) {
        BOOL filtered = filter(self[key]);
        if (!filtered) {
            [candidates addObject:key];
        }
    }
    for (id key in candidates) {
        [self removeObjectForKey:key];
    }
}

- (void)filterWithKey:(NSAObjectPickerWithKey)filter {
    NSMutableArray *candidates = [NSMutableArray array];
    for (id key in self.keyEnumerator) {
        BOOL filtered = filter(self[key], key);
        if (!filtered) {
            [candidates addObject:key];
        }
    }
    for (id key in candidates) {
        [self removeObjectForKey:key];
    }
}

@end

