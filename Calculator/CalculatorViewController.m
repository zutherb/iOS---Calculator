//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Bernd Zuther on 26.08.12.
//  Copyright (c) 2012 Bernd Zuther. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorStack.h"

@interface CalculatorViewController ()

@property BOOL   commaPressed;
@property double diplayValue;
@property double multiplier;
@property (nonatomic)  CalculatorStack *calculatorStack;

@end

@implementation CalculatorViewController

@synthesize display;
@synthesize diplayValue;
@synthesize multiplier;
@synthesize commaPressed;
@synthesize calculatorStack = _calculatorStack;

- (CalculatorStack *)calculatorStack{
    if(!_calculatorStack) _calculatorStack = [[CalculatorStack alloc] init];
    return _calculatorStack;
}

- (IBAction)digitPressed:(UIButton *)sender {
    int digit = sender.currentTitle.intValue;
    NSLog(@"touched %d", digit);
    if(self.diplayValue == 0){
        self.multiplier = 1;
        self.diplayValue = digit;
    } else {
        self.multiplier = 10;
        self.diplayValue *= self.multiplier;
        self.diplayValue += sender.currentTitle.doubleValue;
    }
    self.display.text = [NSString stringWithFormat:@"%.f", diplayValue];
}

- (IBAction)clearDisplay {
    self.display.text = @"0";
    self.diplayValue = 0;
    self.multiplier = 1;
}

- (IBAction)operationPressed:(UIButton *)sender {
    [self.calculatorStack pushOperand:diplayValue];
    [self clearDisplay];
    
    NSString *operation = [sender currentTitle];
    double result = [self.calculatorStack performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%.f", result];
}

- (IBAction)commaPressed:(id)sender {
    self.commaPressed = YES;
}

@end
