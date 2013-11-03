//
//  MKWeekDayPickerView.m
//  MKCalendar
//
//  Created by Mark on 11/3/13.
//  Copyright (c) 2013 Snow Petrel. All rights reserved.
//

#import "MKWeekDayPicker.h"


@interface MKWeekDayPicker ()

@property(nonatomic, strong) NSArray* items;
@property(nonatomic, strong) NSArray* buttons;

@end

@implementation MKWeekDayPicker

- (id)initWithItems:(NSArray *)items
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        // Initialization code
        self.items = items;
        [self initialSetup];
    }
    return self;
}

- (void)initialSetup
{
    UIImage* selectedImage = [self generateSelectedImage];
    
    NSMutableArray* buttons = [NSMutableArray array];
    for (int i = 0; i < [self.items count]; i++) {
        NSString* title = [self.items objectAtIndex:i];
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        [button setImage:selectedImage forState:UIControlStateSelected];
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, 2, 0, 0)];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:18];
        button.tag = i;
        [button addTarget:self action:@selector(selectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            button.selected = YES;
            button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
            [button setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -selectedImage.size.width, 0.0, 0.0 )];
        }
        [buttons addObject:button];
        [self addSubview:button];
    }
    self.buttons = buttons;
    
    UIButton* previous = nil;
    UIButton* next = nil;
    for (UIButton* button in self.buttons) {
        next = button;
        if (previous == nil) {
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-4-[next]" options:0 metrics:0 views:@{@"next":next}]];
        } else {
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[previous]-2-[next(==previous)]" options:0 metrics:0 views:@{@"previous":previous,@"next":next}]];
        }
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[next(36)]" options:0 metrics:0 views:@{@"next":next}]];
        previous = button;
    }
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[next]-4-|" options:0 metrics:0 views:@{@"next":next}]];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    if (_selectedIndex != selectedIndex) {
        UIButton* button = [[self buttons] objectAtIndex:_selectedIndex];
        button.selected = NO;
        button.titleLabel.font = [UIFont systemFontOfSize:18];
        [button setTitleEdgeInsets:UIEdgeInsetsZero];
        _selectedIndex = selectedIndex;
        button = [[self buttons] objectAtIndex:_selectedIndex];
        button.selected = YES;
        button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -[button imageForState:UIControlStateSelected].size.width, 0.0, 0.0 )];
    }
}

- (void)selectButtonAction:(UIButton*)sender
{
    NSInteger tag = sender.tag;
    [self setSelectedIndex:tag];
}

- (UIImage*)generateSelectedImage
{
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat imageWigth = 35 * scale;
    CGFloat imageheight = 35 * scale;
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, imageWigth, imageheight, 8, imageWigth*4, rgbColorSpace, kCGBitmapAlphaInfoMask & kCGImageAlphaPremultipliedFirst);
    CGColorSpaceRelease( rgbColorSpace );
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetAllowsAntialiasing(context, YES);
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, imageWigth, imageheight));
    CGContextFillPath(context);
    
    CGImageRef cgImage = CGBitmapContextCreateImage(context);
    return [UIImage imageWithCGImage:cgImage scale:scale orientation:UIImageOrientationUp];
}
@end
