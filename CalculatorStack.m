//
//  CalculatorStack.m
//  Calculator
//
//  Created by Bernd Zuther on 26.08.12.
//  Copyright (c) 2012 Bernd Zuther. All rights reserved.
//

#import "CalculatorStack.h"
#import "CalculatorStackElement.h"

@interface CalculatorStack()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorStack

@synthesize operandStack = _operandStack;

- (NSMutableArray *) operandStack
{
    if(!_operandStack){
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

- (void) pushOperand : (double) operand : (NSString *) operation{
    CalculatorStackElement* element =[[CalculatorStackElement alloc] init:operand :operation];
    [self.operandStack addObject:element];

};

- (CalculatorStackElement*) getAndRemoveFirstOperand
{
    CalculatorStackElement *operandObject = [self.operandStack objectAtIndex:0];
    if(operandObject) [self.operandStack removeObjectAtIndex:0];
    return operandObject;
}

- (double) performOperation{
    if([self.operandStack count] > 1){
        CalculatorStackElement *operandObject1 = [self getAndRemoveFirstOperand];
        if([@"*" isEqualToString:operandObject1.operation]){
            CalculatorStackElement *operandObject2 = [self getAndRemoveFirstOperand];
            return operandObject1.operand * operandObject2.operand;
        } else if([@"/" isEqualToString:operandObject1.operation]){
            CalculatorStackElement *operandObject2 = [self getAndRemoveFirstOperand];
            if(!operandObject2.operand) return 0;
            return operandObject1.operand / operandObject2.operand;
        } else if([@"+" isEqualToString:operandObject1.operation]){
            CalculatorStackElement *operandObject2 = [self getAndRemoveFirstOperand];
            if(!operandObject2.operand) return 0;
            return operandObject1.operand + operandObject2.operand;
        } else if([@"-" isEqualToString:operandObject1.operation]){
            CalculatorStackElement *operandObject2 = [self getAndRemoveFirstOperand];
            if(!operandObject2.operand) return 0;
            return operandObject1.operand - operandObject2.operand;
        }
    }
    return 0;
};

@end
