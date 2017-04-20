//
//  PJMUtilities.m
//  calc
//
//  Created by Patrick Murray on 19/4/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import "PJMUtilities.h"

@implementation PJMUtilities

// Simpler formatter for throwing ecxeptions to help clean up codebase
// Performs the same function just with fewer parameters
// Also additional steps to be taken like logging before throwing.
+ (void) throwException:(NSString *)name reason:(NSString *)reason, ...  {
    @throw [NSException exceptionWithName:name reason:reason userInfo:nil];
}



+ (void) checkIntegerOverflowWithPrecedence:(int)precedence left:(int)left right:(int)right {
    
    // Uses safe rearrangements of algeabraic forms to test for overflows without causing them.
    // Can be expandned to accomodate more precendence levels later
    switch (precedence) {
        case 0:
        case 1:
            if (abs(right) > INT_MAX - abs(left)) {
                [PJMUtilities throwException:@"Integer Overflow" reason:@"Error on integer overflow: %d + %d", left, right];
            } else if (abs(right) < INT_MIN + abs(left)) {
                [PJMUtilities throwException:@"Integer Underflow" reason:@"Error on integer underflow: %d + %d", left, right];
            }
            break;
        case 2:
            if (left == 0) break; // Quick check to ensure we don't accidently divide by zero in the overflow check
            if (abs(right) > INT_MAX / abs(left)) {
                [PJMUtilities throwException:@"Integer Overflow" reason:@"Error on integer overflow: %d * %d", left, right];
            } else if (abs(right) < INT_MIN / abs(left)) {
                [PJMUtilities throwException:@"Integer Underflow" reason:@"Error on integer underflow: %d * %d", left, right];
            }
        default:
            break;
    }
    
}

@end
