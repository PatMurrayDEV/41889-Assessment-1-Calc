//
//  PJMCalcOperation.m
//  calc
//
//  Created by Patrick Murray on 31/3/17.
//  Copyright © 2017 UTS. All rights reserved.
//

// Import header
#import "PJMCalcOperation.h"

// Import extensions and Utilities
#import "NSMutableArray+Queue.h"
#import "NSMutableArray+Stack.h"
#import "NSString+Extensions.h"
#import "PJMUtilities.h"

// Import the Operator protocol and the various operators
#import "PJMOperatorPrototocol.h"
#import "PJMPlus.h"
#import "PJMMinus.h"
#import "PJMTimes.h"
#import "PJMDivide.h"
#import "PJMModulus.h"


@implementation PJMCalcOperation

NSMutableArray <NSNumber *> * queue;                // Queue to hold the numbers
NSMutableArray <PJMOperatorPrototocol> * stack;     // Stack to hold the operators
NSDictionary * operators;                           // Dictionary of supported operators

/**
 Initialises an instance of the Calculator Operation class
 @return PJMCalcOperation
 */
- (PJMCalcOperation *) init {
    self = [super init];
    if (self != nil) {
        // Set up the stack and the queue
        queue = [[NSMutableArray alloc] init];
        stack = [[NSMutableArray<PJMOperatorPrototocol> alloc] init];
        
        // Populate the operators dictionary
        operators = @{
                      [PJMPlus name]     :    [[PJMPlus alloc] init],
                      [PJMMinus name]    :    [[PJMMinus alloc] init],
                      [PJMTimes name]    :    [[PJMTimes alloc] init],
                      [PJMDivide name]   :    [[PJMDivide alloc] init],
                      [PJMModulus name]  :    [[PJMModulus alloc] init]
                      };
        return self;
    }
    return nil;
}


// The main calculator class
// This implements the bulk of the computing
- (NSNumber *) calculateExpression: (NSArray *)arguments {
    
    // Fail if last argument is not a number
    if (![arguments.lastObject isValidNumber]) {
        [PJMUtilities throwException:@"Invalid Input" reason:@"exit with nonzero status on invalid input"];
    }
    
    // Enumerate through the list of arguments
    // enumerateObjectsUsingBlock is used so that both the object and the Index can be used inside the block with no extra overhead
    [arguments enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // Get the current token
        NSString *arg = obj;
        
        // An odd index MUST be a number.
        // This confirms that. Throws an exception if not
        if (idx % 2 != 0) {
            if (![arg isValidNumber]) {
                [PJMUtilities throwException:@"Invalid Input" reason:@"exit with nonzero status on invalid input: %@", arg];
            }
        }
        
        // Check if the current argument is an operator
        if ([arg isValidOperator:operators.allKeys]) {
            
            // Get which operator it is that conforms to the protocol
            id <PJMOperatorPrototocol> operator = [operators objectForKey:arg];
            
            // If the current operator does not have a higer precedence perform the previous operator
            if (!([operator precendence] > [[stack lastObject] precendence])) {
                [self performOperator];
            }
            
            // Store the current Operator on the stack
            [stack pushObject:operator];
            
        } else {
            
            // Check it doesn't overflow an int
            long argumentNumber = [arg longLongValue];
            if (labs(argumentNumber) - INT_MAX > 0) {
                [PJMUtilities throwException:@"Invalid Input" reason:@"exit with nonzero status on invalid input: %@", arg];
            }
            
            // Add it to the number queue (reuse the long long from above to save casting the number twice)
            NSNumber *number = [NSNumber numberWithLongLong:argumentNumber];
            [queue enQueue:number];
        }
        
    }];
    
    // Run while we still have operators left in the stack
    while (stack.count > 0) {
        [self performOperator];
    }
    
    // Return the result
    return [queue deQueue];
}

// Perform the operator
- (void) performOperator {
    
    // Get the operator off the stack
    id <PJMOperatorPrototocol> operator = [stack pop];
    
    // Grab the next two in the queue
    NSNumber * right = [queue deQueue];
    NSNumber * left = [queue deQueue];
    
    // Calculate the result
    NSNumber * result = [operator calculateWithLeft:left right:right];
    
    // put it back in the queue
    [queue enQueue:result];
}


@end
