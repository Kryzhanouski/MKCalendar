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
@property (nonatomic, strong) NSDateFormatter* dateFormatter;
@property (nonatomic, strong) NSDate* date;
@property (nonatomic, strong) NSArray* weekdaySymbolLabels;
@end


@implementation MKCalendarDaysOfWeekView

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
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self initializeWeekdaySymbolLabels];
}

#pragma mark - Implement Private Interface
- (void)initializeWeekdaySymbolLabels
{
    NSArray* veryShortStandaloneWeekdaySymbols = [self.dateFormatter veryShortStandaloneWeekdaySymbols];
    NSMutableArray* symbolLabels = [NSMutableArray array];
    UIColor* weekendDayTextColor = [UIColor colorWithRed:184.0f/255.0f green:184.0f/255.0f blue:184.0f/255.0f alpha:1.0f];
    UIColor* workDayTextColor = [UIColor blackColor];
    UIFont* font = [UIFont systemFontOfSize:10];
    for (int i = 0; i < [veryShortStandaloneWeekdaySymbols count]; i++) {
        NSString* symbol = [veryShortStandaloneWeekdaySymbols objectAtIndex:i];
        UIColor* textColor = workDayTextColor;
        if (i == 0 || i == 6) {
            textColor = weekendDayTextColor;
        }
        UILabel* label = [[UILabel alloc] init];
        [label setTranslatesAutoresizingMaskIntoConstraints:NO];
        label.textColor = textColor;
        label.font = font;
        label.text = symbol;
        //        label.backgroundColor = [UIColor redColor];
        [symbolLabels addObject:label];
        [self addSubview:label];
    }
    
    NSInteger firstWeekday = [self.calendar firstWeekday];
    for (int i = 1; i < firstWeekday; i++) {
        id firstObj = [symbolLabels firstObject];
        [symbolLabels removeObject:firstObj];
        [symbolLabels addObject:firstObj];
    }
    
    self.weekdaySymbolLabels = symbolLabels;
    
    NSAssert([self.weekdaySymbolLabels count] == 7, @"Number of weekday symbols should be equal to 7");
    //    NSInteger numberOfDaysInWeek = 7;
    CGFloat labelWidth = 10;
    CGFloat labelHeight = 10;
    CGFloat spacing = 35;//(CGRectGetWidth(self.bounds) - numberOfDaysInWeek*labelWidth)/numberOfDaysInWeek-1;
    NSDictionary* views = [NSDictionary dictionaryWithObjects:self.weekdaySymbolLabels forKeys:@[@"view1",@"view2",@"view3",@"view4",@"view5",@"view6",@"view7"]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[view1(width)]-spacing-[view2(width)]-spacing-[view3(width)]-spacing-[view4(width)]-spacing-[view5(width)]-spacing-[view6(width)]-spacing-[view7(width)]" options:NSLayoutFormatAlignAllTop metrics:@{@"width":@(labelWidth),@"spacing":@(spacing)} views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view1(height)]" options:NSLayoutFormatAlignAllTop metrics:@{@"height":@(labelHeight)} views:views]];
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
