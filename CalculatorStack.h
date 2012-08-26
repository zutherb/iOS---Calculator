//
//  CalculatorStack.h
//  Calculator
//
//  Created by Bernd Zuther on 26.08.12.
//  Copyright (c) 2012 Bernd Zuther. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorStack : NSObject

- (void) pushOperand : (double) operand;
- (double) performOperation : (NSString *) operation;

@end
