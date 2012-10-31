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


@implementation NSArray (FE_Functional)

- (void)applyProcedure:(NSAObjectProcedure)procedure {
    NSAApply(self, procedure);
}

- (NSArray *)arrayByMappingOperator:(NSAObjectUnaryOperator)mapper {
    return NSAMap(self.objectEnumerator, mapper).allObjects;
}

- (NSArray *)arrayByMapFilteringOperator:(NSAObjectUnaryOperator)mapper {
    return NSAMapFilter(self.objectEnumerator, mapper).allObjects;
}

- (NSArray *)arrayByFilteringOperator:(NSAObjectPicker)filter {
    return NSAFilter(self.objectEnumerator, filter).allObjects;
}

- (id)reduce:(NSAObjectBinaryOperator)reduce {
    return NSAReduce(self.objectEnumerator, reduce);
}

- (id)reduce:(NSAObjectBinaryOperator)reduce initialObject:(id)initialObject {
    return NSAReduceWithInitialObject(self.objectEnumerator, reduce, initialObject);
}

@end


@implementation NSMutableArray (FE_Functional)

- (void)map:(NSAObjectUnaryOperator)mapper {
    NSUInteger count = self.count;
    for (NSUInteger i = 0; i < count; i++) {
        [self replaceObjectAtIndex:i withObject:mapper([self objectAtIndex:i])];
    }
}

- (void)mapFilter:(NSAObjectUnaryOperator)mapper {
    NSMutableIndexSet *removes = [[NSMutableIndexSet alloc] init];
    NSUInteger count = self.count;
    for (NSUInteger i = 0; i < count; i++) {
        id result = mapper([self objectAtIndex:i]);
        if (result == nil) {
            [removes addIndex:i];
        } else {
            [self replaceObjectAtIndex:i withObject:result];
        }
    }
    [self removeObjectsAtIndexes:removes];
    [removes release];
}

- (void)filter:(NSAObjectPicker)filter {
    NSMutableIndexSet *removes = [[NSMutableIndexSet alloc] init];
    NSUInteger count = self.count;
    for (NSUInteger i = 0; i < count; i++) {
        BOOL result = filter([self objectAtIndex:i]);
        if (!result) {
            [removes addIndex:i];
        }
    }
    [self removeObjectsAtIndexes:removes];
    [removes release];
}

@end
