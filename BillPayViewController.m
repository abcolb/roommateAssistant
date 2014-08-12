//
//  BillPayViewController.m
//  ShowerScheduler
//
//  Created by Alexandra Barry on 8/5/14.
//  Copyright (c) 2014 AlexBarryServices. All rights reserved.
//

#import "BillPayViewController.h"

@interface BillPayViewController () {
    NSString *rentPayer;
    NSString *cablePayer;
    NSString *electricPayer;
    NSString *oilPayer;
    
    float rentPayment;
    float cablePayment;
    float electricPayment;
    float oilPayment;
    
    float totalPayment;
    float differenceCable;
    float differenceElectric;
    float differenceOil;
    
    NSString *defaultPlaceholder;
}

@end

@implementation BillPayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.RentPayerTextField.delegate = self;
    self.CablePayerTextField.delegate = self;
    self.ElectricPayerTextField.delegate = self;
    self.OilPayerTextField.delegate = self;
    
    self.RentPaymentTextField.delegate = self;
    self.ElectricPaymentTextField.delegate = self;
    self.OilPaymentTextField.delegate = self;
    self.CablePaymentTextField.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CalculateButtonPressed:(id)sender {
    NSLog(@"CalculatePressed");
    
    rentPayer = [self.RentPayerTextField text];
    cablePayer = [self.CablePayerTextField text];
    electricPayer = [self.ElectricPayerTextField text];
    oilPayer = [self.OilPayerTextField text];
    
    rentPayment = [[self.RentPaymentTextField text] floatValue];
    cablePayment = [[self.CablePaymentTextField text] floatValue];
    electricPayment = [[self.ElectricPaymentTextField text] floatValue];
    oilPayment = [[self.OilPaymentTextField text] floatValue];
    
    totalPayment = (rentPayment + cablePayment + electricPayment + oilPayment)/4;
    
    differenceCable = totalPayment - cablePayment;
    differenceElectric = totalPayment - electricPayment;
    differenceOil = totalPayment - oilPayment;
    
    NSString *differenceCableString = [[NSString alloc] initWithFormat:@"%.2f", differenceCable];
    NSString *differenceElectricString = [[NSString alloc] initWithFormat:@"%.2f", differenceElectric];
    NSString *differenceOilString = [[NSString alloc] initWithFormat:@"%.2f", differenceOil];
    
    
    //[self.OwedLine1 setText: (@"%@ owes %@ $", cablePayer, rentPayer, differenceCableString)];
    self.OwedLine1.text = [NSString stringWithFormat:@"%@ owes %@ $%@.", cablePayer, rentPayer, differenceCableString];
    [self.OwedLine1 setNeedsDisplay];
    
    self.OwedLine2.text = [NSString stringWithFormat:@"%@ owes %@ $%@.", electricPayer, rentPayer, differenceElectricString];
    [self.OwedLine2 setNeedsDisplay];
    
    self.OwedLine3.text = [NSString stringWithFormat:@"%@ owes %@ $%@.", oilPayer, rentPayer, differenceOilString];
    [self.OwedLine3 setNeedsDisplay];
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    defaultPlaceholder = textField.placeholder;
    textField.placeholder = @"";
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    textField.placeholder = defaultPlaceholder;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
