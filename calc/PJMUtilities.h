//
//  PJMUtilities.h
//  calc
//
//  Created by Patrick Murray on 19/4/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PJMUtilities : NSObject

/**
 Simpler formatter for throwing ecxeptions to help clean up codebase. Use in place of traditional throw
 @param name Exception name
 @param reason Formatted string for the reason
 @exception The created exception (side effect)
 */
+ (void) throwException:(NSString *)name reason:(NSString *)reason, ... NS_FORMAT_FUNCTION(2,3);

/**
 Checker for overflow / underflow. Chooses the correct check based on the precedence of the operator
 @param precedence Precedence int of the operator (e.g., 1 for +, 2 for x)
 @param left Int for the left side of the equation
 @param right Int for the right side of the equation
 @exception Throws if the resultant int overflows or underflows
 */
+ (void) checkIntegerOverflowWithPrecedence:(int)precedence left:(int)left right:(int)right;

@end
