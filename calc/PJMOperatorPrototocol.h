//
//  Operator.h
//  calc
//
//  Created by Patrick Murray on 7/4/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PJMUtilities.h"

@protocol PJMOperatorPrototocol <NSObject>

/**
 Precedence
 @returns NSNumber for the precedence level as per BODMAS
 */
- (NSNumber *) precendence;

/**
 Name
 @returns NSString for the name of the operation, to be used as the descriptor
 */
+ (NSString *) name;

/**
 Calculates the operation. This also throws depending on the operation
 @param left The Left side of the equation
 @param right The Right side of the equation
 @returns NSNumber The resultant number from the equations
 @exception Exception if the calculation overflows or underflows an int
 */
- (NSNumber *) calculateWithLeft:(NSNumber *)left right:(NSNumber *)right;

@end
