//
//  ScheduleTableViewController.h
//  ShowerScheduler
//
//  Created by Alexandra Barry on 6/26/14.
//  Copyright (c) 2014 AlexBarryServices. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ScheduleTableViewController : UITableViewController 

@property (nonatomic, strong) NSArray *daysArray; //= [@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday"];
@property (nonatomic, strong) NSMutableArray *datesArray;

- (void)inputArrayElementsFromIndex:(int)x withLength:(int)y;

//@property (nonatomic, strong) Matrix?

@end
