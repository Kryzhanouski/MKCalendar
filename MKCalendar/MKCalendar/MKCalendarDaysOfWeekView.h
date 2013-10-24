//
//  MKCalendarDaysOfWeekView.h
//  MKCalendar
//
//  Created by Mark Kryzhanouski on 10/24/13.
//  Copyright (c) 2013 Snow Petrel. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MKCalendarDaysOfWeekViewDelegate;




@interface MKCalendarDaysOfWeekView : UIView

@property (nonatomic, weak) id<MKCalendarDaysOfWeekViewDelegate> delegate;

// Designated Initializer
- (id)initWithFrame:(CGRect)frame calendar:(NSCalendar*)calendar;
- (id)initWithCalendar:(NSCalendar*)calendar;

- (void)setDate:(NSDate*)date;
- (NSDate*)date;

- (void)setDate:(NSDate*)date animated:(BOOL)animated;

@end




@protocol MKCalendarDaysOfWeekViewDelegate <NSObject>

- (void)daysOfWeekView:(MKCalendarDaysOfWeekView*)view didChangeDateTo:(NSDate*)date;

@end
