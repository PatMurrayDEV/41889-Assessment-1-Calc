//
//  NSString+Extensions.m
//  calc
//
//  Created by Patrick Murray on 13/4/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)

- (BOOL) isValidNumber {
    
    // Is it zero?
    if ([self isEqualToString:@"0"]) {
        return YES;
    }
    
    // Otherwise actually compute if its a number
    NSMutableString *string = [NSMutableString stringWithString:self];
    // If theres a + sign at the start ignore it
    if ([[string substringToIndex:1] isEqualToString:@"+"]) {
        string = [NSMutableString stringWithString:[string substringFromIndex:1]];
    }
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    return [nf numberFromString:string] != nil;
}

- (BOOL) isValidOperator:(NSArray *)operators {
    return [operators containsObject:self];
}

@end
