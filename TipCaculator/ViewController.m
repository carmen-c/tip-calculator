//
//  ViewController.m
//  TipCaculator
//
//  Created by carmen cheng on 2016-11-11.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentage;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillShowNotification object:self.view.window];
    

}

- (IBAction)adjustTipPercentage:(id)sender {
    self.tipPercentageTextField.text = [NSString stringWithFormat:@"%.f%%", self.slider.value];
    self.tipPercentage.text = [NSString stringWithFormat:@"%.f%%", self.slider.value];
}

- (IBAction)calculateTip:(id)sender {
    float billEntered = [self.billAmountTextField.text floatValue];
    float tipPercent = [self.tipPercentageTextField.text floatValue];
    float tip = billEntered * (tipPercent/100);
    self.tipAmount.text = [NSString stringWithFormat:@"$ %.2f", tip];
    self.tipPercentage.text = [NSString stringWithFormat:@"%.f%%", tipPercent];

}

#pragma mark - keyboard

-(void) keyboardShow: (NSNotification *)sender{
    CGSize keyboardSize = [[[sender userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    [UIView animateWithDuration:0.3 animations:^{
        CGRect bill = self.billAmountTextField.frame;
        bill.size.height -= keyboardSize.height;
        self.billAmountTextField.frame = bill;
    }];
}

-(void) keyboardHide: (NSNotification *)sender{
    CGSize keyboardSize = [[[sender userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    [UIView animateWithDuration:0.3 animations:^{
    CGRect bill = self.billAmountTextField.frame;
    bill.size.height -= keyboardSize.height;
    self.billAmountTextField.frame = bill;
}];
}

@end
