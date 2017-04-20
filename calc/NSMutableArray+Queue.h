//
//  NSMutableArray+Queue.h
//  calc
//
//  Created by Patrick Murray on 7/4/17.
//  Copyright © 2017 UTS. All rights reserved.
//
//  Sourced From: "Justin Shacklette" http://saturnboy.com/2011/02/stack-queue-nsmutablearray/

#import <Foundation/Foundation.h>

@interface NSMutableArray (Queue)

/**
 enQueues a new object on the end of the queue
 @param object Takes any object
 */
- (void)enQueue:(id)object;

/**
 deQueues an object from the queue
 @return id the obejct that was deQueued
 */
- (id)deQueue;

@end
