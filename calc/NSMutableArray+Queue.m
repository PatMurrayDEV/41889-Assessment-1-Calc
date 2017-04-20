//
//  NSMutableArray+Queue.m
//  calc
//
//  Created by Patrick Murray on 7/4/17.
//  Copyright © 2017 UTS. All rights reserved.
//
//  Sourced From: "Justin Shacklette" http://saturnboy.com/2011/02/stack-queue-nsmutablearray/

#import "NSMutableArray+Queue.h"

@implementation NSMutableArray (Queue)

- (void)enQueue:(id)object {
    [self insertObject:object atIndex:0];
}

- (id)deQueue {
    id result;
    if (self.count > 0) {
        result = [self objectAtIndex:0];
        [self removeObjectAtIndex:0];
    }
    return result;
}
@end
