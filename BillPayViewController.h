//
//  BillPayViewController.h
//  ShowerScheduler
//
//  Created by Alexandra Barry on 8/5/14.
//  Copyright (c) 2014 AlexBarryServices. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BillPayViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *RentPayerTextField;
@property (weak, nonatomic) IBOutlet UITextField *CablePayerTextField;
@property (weak, nonatomic) IBOutlet UITextField *ElectricPayerTextField;
@property (weak, nonatomic) IBOutlet UITextField *OilPayerTextField;

@property (weak, nonatomic) IBOutlet UITextField *RentPaymentTextField;
@property (weak, nonatomic) IBOutlet UITextField *CablePaymentTextField;
@property (weak, nonatomic) IBOutlet UITextField *ElectricPaymentTextField;
@property (weak, nonatomic) IBOutlet UITextField *OilPaymentTextField;

@property (weak, nonatomic) IBOutlet UIButton *CalculateButton;

@property (weak, nonatomic) IBOutlet UILabel *OwedLine1;
@property (weak, nonatomic) IBOutlet UILabel *OwedLine2;
@property (weak, nonatomic) IBOutlet UILabel *OwedLine3;

- (IBAction)CalculateButtonPressed:(id)sender;

@end
