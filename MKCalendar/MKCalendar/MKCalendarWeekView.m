//
//  MKCalendarWeekView.m
//  MKCalendar
//
//  Created by Mark Kryzhanouski on 10/24/13.
//  Copyright (c) 2013 Snow Petrel. All rights reserved.
//

#import "MKCalendarWeekView.h"
#import "MKCalendarDaysOfWeekView.h"

@interface MKCalendarWeekView ()
@property (nonatomic, strong) NSCalendar* calendar;
@property (nonatomic, strong) NSDate* date;


@property (nonatomic, strong) UINavigationBar* topBar;
@property (nonatomic, strong) MKCalendarDaysOfWeekView* daysOfWeekView;
@end


@implementation MKCalendarWeekView

- (id)initWithFrame:(CGRect)frame calendar:(NSCalendar*)calendar
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.calendar = calendar;
        [self initialSetup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame calendar:nil];
}

- (id)initWithCalendar:(NSCalendar*)calendar
{
    return [self initWithFrame:CGRectZero calendar:calendar];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initialSetup];
}

- (void)initialSetup
{
    self.backgroundColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1.0f];
    
    self.topBar = [[UINavigationBar alloc] init];
    [self.topBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.topBar];
    UINavigationItem* item = [[UINavigationItem alloc] init];
    item.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"October" style:UIBarButtonItemStyleBordered target:nil action:0];
    item.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:0],
                                 [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:nil action:0]];
    [self.topBar setItems:@[item]];
    
    
    self.daysOfWeekView = [[MKCalendarDaysOfWeekView alloc] initWithCalendar:self.calendar];
    [self.daysOfWeekView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.daysOfWeekView];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[topBar]|" options:0 metrics:nil views:@{@"topBar":self.topBar}]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[daysOfWeekView]|" options:0 metrics:nil views:@{@"daysOfWeekView":self.daysOfWeekView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topBar(64)][daysOfWeekView(84)]" options:0 metrics:nil views:@{@"topBar":self.topBar,@"daysOfWeekView":self.daysOfWeekView}]];
}

#pragma mark - Implement Public Interface
- (void)setDate:(NSDate*)date
{
    [self setDate:date animated:NO];
}

- (void)setDate:(NSDate*)date animated:(BOOL)animated
{
    _date = date;
    [self.daysOfWeekView setDate:date animated:animated];
}

@end
