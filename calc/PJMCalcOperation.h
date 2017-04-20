//
//  PJMCalcOperation.h
//  calc
//
//  Created by Patrick Murray on 31/3/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PJMCalcOperation : NSObject

/**
 Calculate an expression using the Shunting Yard Algorithm. This also checks for the validity of the input expression.
 @param arguments An NSArray of arguments tokenized from the expression
 @returns NSNumber the result
 @exception Exceptions for any invalid calculations or expressions
 */
- (NSNumber *) calculateExpression: (NSArray *)arguments;

@end
