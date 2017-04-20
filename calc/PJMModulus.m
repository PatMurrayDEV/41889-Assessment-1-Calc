//
//  PJMModulus.m
//  calc
//
//  Created by Patrick Murray on 9/4/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import "PJMModulus.h"

@implementation PJMModulus

- (NSNumber *) precendence {
    return @2;
}

+ (NSString *) name {
    return @"%";
}

- (NSNumber *) calculateWithLeft:(NSNumber *)left right:(NSNumber *)right {
    return @(left.intValue % right.intValue);
}

@end
