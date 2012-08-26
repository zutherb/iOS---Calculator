//
//  CalculatorStackElement.h
//  Calculator
//
//  Created by Bernd Zuther on 26.08.12.
//  Copyright (c) 2012 Bernd Zuther. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorStackElement : NSObject

@property double operand;
@property (nonatomic) NSString *operation;

- (CalculatorStackElement*) init : (double) operand : (NSString*) operation;
- (double) getOperand;
- (NSString*) getOperation;

@end
