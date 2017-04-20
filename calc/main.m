//
//  main.m
//  calc
//
//  Created by Patrick Murray on 31/3/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PJMCalcOperation.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        @try {
            // Retrieve the arguments from the process info
            NSArray *arguments = [[NSProcessInfo processInfo] arguments];
            
            // Create an instance of the calculator
            PJMCalcOperation *calculator = [[PJMCalcOperation alloc] init];
            
            // Pass the calculator our expressions and receive a number in return
            NSNumber *result = [calculator calculateExpression:arguments];
            
            // Convert the number to an int for easier printing
            int intResult = result.intValue;
            
            // Print result
            printf("%d", intResult);
        } @catch (NSException *exception) {
            
            // Die
            exit(1);
        }
        
    }
    return 0;
}
