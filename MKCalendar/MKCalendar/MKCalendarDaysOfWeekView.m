//
//  MKCalendarDaysOfWeekView.m
//  MKCalendar
//
//  Created by Mark Kryzhanouski on 10/24/13.
//  Copyright (c) 2013 Snow Petrel. All rights reserved.
//

#import "MKCalendarDaysOfWeekView.h"

@interface MKCalendarDaysOfWeekView ()
@property (nonatomic, strong) NSCalendar* calendar;
@property (nonatomic, strong) NSDate* date;
@end


@implementation MKCalendarDaysOfWeekView

- (id)initWithFrame:(CGRect)frame calendar:(NSCalendar*)calendar
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialSetup];
    }
    return self;
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
}

#pragma mark - Implement Public Interface
- (void)setDate:(NSDate*)date
{
    [self setDate:date animated:NO];
}

- (void)setDate:(NSDate*)date animated:(BOOL)animated
{
    _date = date;
}

@end
