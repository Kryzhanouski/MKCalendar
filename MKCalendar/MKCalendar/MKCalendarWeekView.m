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
@property (nonatomic, strong) MKCalendarDaysOfWeekView* daysOfWeekView;
@end


@implementation MKCalendarWeekView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
    self.backgroundColor = [UIColor redColor];
    self.daysOfWeekView = [[MKCalendarDaysOfWeekView alloc] init];
    [self.daysOfWeekView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.daysOfWeekView];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[daysOfWeekView]|" options:0 metrics:nil views:@{@"daysOfWeekView":self.daysOfWeekView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[daysOfWeekView(84)]" options:0 metrics:nil views:@{@"daysOfWeekView":self.daysOfWeekView}]];
}

@end
