//
//  PJMMinus.m
//  calc
//
//  Created by Patrick Murray on 7/4/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import "PJMMinus.h"

@implementation PJMMinus

- (NSNumber *) precendence {
    return @1;
}

+ (NSString *) name {
    return @"-";
}

- (NSNumber *) calculateWithLeft:(NSNumber *)left right:(NSNumber *)right {   
    int leftInt = left.intValue;
    int rightInt = right.intValue;
    
    // Check overflow / underflow, and throw if fails
    [PJMUtilities checkIntegerOverflowWithPrecedence:[self precendence].intValue left:leftInt right:rightInt];
    
    return @(leftInt - rightInt);
}


@end
