//
//  ScheduleTableViewController.m
//  ShowerScheduler
//
//  Created by Alexandra Barry on 6/26/14.
//  Copyright (c) 2014 AlexBarryServices. All rights reserved.
//

#import "ScheduleTableViewController.h"
#import "ScheduleTableViewCell.h"

@interface ScheduleTableViewController ()

{
    NSArray *_daysArray;
    NSMutableArray *_datesArray;
    NSMutableArray *_weekOfDatesArray;
    
    NSDateFormatter *dateFormatter;
    NSLocale *locale;
    NSTimeInterval DAY_IN_SECONDS;
    
    NSDate *now;
    NSString *date;
    
    NSDate *future;
    NSString *futureDate;
    
    NSInteger weekday;
    NSInteger futureWeekday;
    
    NSCalendar *calendar;
    NSDateComponents *components;
    NSString *myNewString;
    NSString *myNewStringAgain;
    
    //- (void)inputArrayElementsFromIndex:(int)x withLength:(int)y;
    
}

@end

@implementation ScheduleTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customizeAppearance];
    
    /*
    ScheduleTableViewController *scheduleTableViewController = [[ScheduleTableViewController alloc] init];
    scheduleTableViewController.datesArray = _datesArray;
    scheduleTableViewController.daysArray = _daysArray;
    scheduleTableViewController->weekOfDatesArray = weekOfDatesArray;
    */
    
    _daysArray = @[@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday"];
    _weekOfDatesArray = [NSMutableArray arrayWithCapacity:7];
    _datesArray = [NSMutableArray arrayWithCapacity:5];
    
    //- (NSInteger)weekday;
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    locale = [NSLocale currentLocale];
    [dateFormatter setLocale:locale];
    
    //[dateFormatter setDoesRelativeDateFormatting:YES];
    
    now = [[NSDate alloc] init];
    date = [dateFormatter stringFromDate:now];
    calendar = [NSCalendar currentCalendar];
    components = [calendar components:NSWeekdayCalendarUnit fromDate:now];
    weekday = [components weekday];
    
    [_weekOfDatesArray addObject:date];
    
    
    DAY_IN_SECONDS= 86400;
    
    int i = 1;
    while (i < 7){
        future = [[NSDate alloc] init];
        future = [[NSDate date] dateByAddingTimeInterval:(i*DAY_IN_SECONDS)];
        futureDate = [dateFormatter stringFromDate:future];
        components = [calendar components:NSWeekdayCalendarUnit fromDate:future];
        futureWeekday = [components weekday];
        [_weekOfDatesArray addObject:futureDate];
        i++;
        //NSLog(@"%@", futureDate);
    }

    switch((int)weekday){
        case 1: //Sunday
            [self inputArrayElementsFromIndex:1 withLength:5];
            break;
        case 2: //Monday
            [self inputArrayElementsFromIndex:0 withLength:5];
            break;
        case 3: //Tuesday
            [self inputArrayElementsFromIndex:5 withLength:1]; //FIX TUESDAY! should say 6
            [self inputArrayElementsFromIndex:0 withLength:4];
            break;
        case 4: //Wednesday
            [self inputArrayElementsFromIndex:5 withLength:2];
            [self inputArrayElementsFromIndex:0 withLength:3];
            break;
        case 5: //Thursday
            [self inputArrayElementsFromIndex:4 withLength:3];
            [self inputArrayElementsFromIndex:0 withLength:2];
            break;
        case 6: //Friday
            [self inputArrayElementsFromIndex:3 withLength:4];
            [self inputArrayElementsFromIndex:0 withLength:1];
            break;
        case 7: //Saturday
            [self inputArrayElementsFromIndex:2 withLength:5];
            break;
    }
   
    
 
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}




- (void)inputArrayElementsFromIndex:(int)x withLength:(int)y
{
    for (int i = 0; i < y; i++){
        if (![_weekOfDatesArray objectAtIndex:(x+1)]){
            [_datesArray addObject: date];
        }else{
        [_datesArray addObject:[_weekOfDatesArray objectAtIndex:(x+i)]];
        }
    }
    
}


 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ScheduleCell"];
   
    
    UIColor *lightBlue = [UIColor colorWithRed:0.26 green:0.76 blue:0.98 alpha:1];
    UIFont *helveticaNeueTextLabel = [UIFont fontWithName:@"Helvetica Neue" size:18];
    UIFont *helveticaNeueDetailTextLabel = [UIFont fontWithName:@"Helvetica Neue" size:14];

    
    cell.textLabel.text = (self.daysArray)[indexPath.row];
    cell.textLabel.textColor = lightBlue;
    cell.textLabel.font = helveticaNeueTextLabel;
    
    cell.detailTextLabel.text = (self.datesArray)[indexPath.row];
    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.detailTextLabel.font = helveticaNeueDetailTextLabel;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

-(void) customizeAppearance{
    
    //UIColor *lightPurple = [UIColor colorWithRed:0.95 green:0.63 blue:0.95 alpha:1];
    UIColor *lightBlue = [UIColor colorWithRed:0.26 green:0.76 blue:0.98 alpha:1];
    //UIColor *superLightBlue = [UIColor colorWithRed: 0.26 green:0.76 blue:0.98 alpha:0.05];
    
    [[UINavigationBar appearance] setBackgroundColor: lightBlue];
    [[UINavigationBar appearance] setBarTintColor: lightBlue];
    
    NSDictionary *font = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica Neue" size:20], NSFontAttributeName, [UIColor whiteColor],  NSForegroundColorAttributeName, nil];
    
    [[UINavigationBar appearance] setTitleTextAttributes:font];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    

    
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackTranslucent];
    //[[UIBarButtonItem appearance] setTitleTextAttributes:font]; //doesnt work
}


@end
