//
//  NSString+Extensions.h
//  calc
//
//  Created by Patrick Murray on 13/4/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extensions)

/**
 Checks whether a string is in fact a number
 @returns BOOL
 */
- (BOOL) isValidNumber;

/**
 Checks whether a string is contained in an array. This is no faster than normal, just neater.
 @param operators the array of operators
 @returns BOOL
 */
- (BOOL) isValidOperator:(NSArray *)operators;

@end
