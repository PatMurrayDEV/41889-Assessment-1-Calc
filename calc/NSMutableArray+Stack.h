//
//  NSMutableArray+Stack.h
//  calc
//
//  Created by Patrick Murray on 7/4/17.
//  Copyright © 2017 UTS. All rights reserved.
//
//  Sourced From: "Justin Shacklette" http://saturnboy.com/2011/02/stack-queue-nsmutablearray/

#import <Foundation/Foundation.h>

@interface NSMutableArray (Stack)

/**
 Push an object to the stack
 @param object Takes any object
 */
- (void) pushObject: (id) object;

/**
 Pops an object from the stack
 @return id the obejct that was poped
 */
- (id) pop;

/**
 Peek at an obejct in the stack
 @return id the obejct that was peeked at
 */
- (id) peek;

@end
