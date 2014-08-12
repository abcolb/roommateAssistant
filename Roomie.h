//
//  Roomie.h
//  ShowerScheduler
//
//  Created by Alexandra Barry on 6/26/14.
//  Copyright (c) 2014 AlexBarryServices. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Roomie : NSObject

@property (nonatomic, strong) NSString *name; //copy?? strong? weak?

@property (nonatomic, assign) NSInteger *mondayReservation; //or just int?
@property (nonatomic, assign) NSInteger *tuesdayReservation;
@property (nonatomic, assign) NSInteger *wednesdayReservation;
@property (nonatomic, assign) NSInteger *thursdayReservation;
@property (nonatomic, assign) NSInteger *fridayReservation;

@property (nonatomic, assign) BOOL *inShower;

@end
