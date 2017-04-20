//
//  NSMutableArray+Stack.m
//  calc
//
//  Created by Patrick Murray on 7/4/17.
//  Copyright © 2017 UTS. All rights reserved.
//
//  Sourced From: "Justin Shacklette" http://saturnboy.com/2011/02/stack-queue-nsmutablearray/

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)


-(void) pushObject:(id)object {
    [self addObject:object];
}


-(id) pop {
    id lastObject;
    if (self.count > 0) {
        lastObject = [self lastObject];
        [self removeObject:lastObject];
    }
    return lastObject;
}


-(id) peek {
    
    id lastObject = [self lastObject];
    return lastObject;
}
@end
