//
//  CalculatorStackElement.m
//  Calculator
//
//  Created by Bernd Zuther on 26.08.12.
//  Copyright (c) 2012 Bernd Zuther. All rights reserved.
//

#import "CalculatorStackElement.h"

@implementation CalculatorStackElement

@synthesize operand = _operand;
@synthesize operation = _operation;

- (CalculatorStackElement*) init : (double) operand1 : (NSString*) operation2
{
    self = [super init];
    
    if (self != nil) {
        _operand = operand1;
        _operation = operation2;
    }
    return self;
}

- (double) getOperand{
    return self.operand;
}

- (NSString*) getOperation
{
    return self.operation;
}

@end
