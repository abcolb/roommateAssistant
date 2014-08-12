//
//  ReservationTableViewController.h
//  ShowerScheduler
//
//  Created by Alexandra Barry on 8/1/14.
//  Copyright (c) 2014 AlexBarryServices. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReservationTableViewController;

@protocol ReservationTableViewControllerDelegate <NSObject>
- (void)reservationTableViewController:(ReservationTableViewController *)controller didSelectRoomie:(NSString *)roomie;
//- (void)reservationTableViewControllerDidCancel:(ReservationTableViewController *)controller;
//- (void)reservationTableViewControllerDidSave:(ReservationTableViewController *)controller;
@end

@interface ReservationTableViewController : UITableViewController

@property (nonatomic, weak) id <ReservationTableViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *roomie;

//- (IBAction)cancel:(id)sender;
//- (IBAction)done:(id)sender;

@end


