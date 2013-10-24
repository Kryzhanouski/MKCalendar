//
//  MKCalendarWeekViewController.m
//  MKCalendar
//
//  Created by Mark Kryzhanouski on 10/24/13.
//  Copyright (c) 2013 Snow Petrel. All rights reserved.
//

#import "MKCalendarWeekViewController.h"
#import "MKCalendarWeekView.h"

@interface MKCalendarWeekViewController ()

@property (nonatomic, weak) MKCalendarWeekView* customView;

@end

@implementation MKCalendarWeekViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initialSetup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initialSetup];
}

- (void)initialSetup
{
}

#pragma mark - Controller Livecycle
- (void)loadView
{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    MKCalendarWeekView* customView = [[MKCalendarWeekView alloc] initWithFrame:frame];
    customView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.customView = customView;
    self.view = customView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
