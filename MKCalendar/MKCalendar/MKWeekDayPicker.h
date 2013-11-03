//
//  MKWeekDayPickerView.h
//  MKCalendar
//
//  Created by Mark on 11/3/13.
//  Copyright (c) 2013 Snow Petrel. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MKWeekDayPicker : UIControl

- (id)initWithItems:(NSArray *)items; // items is array of NSStrings

@property(nonatomic, readonly, strong) NSArray* items;
@property(nonatomic) NSInteger selectedIndex;


@end
