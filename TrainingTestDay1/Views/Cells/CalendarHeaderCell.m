//
//  CalendarHeaderCell.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/21.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "CalendarHeaderCell.h"

NSString *const CalendarHeaderCellIdentifier = @"CalendarHeaderCell";
const CGFloat CalendarHeaderCellHeight = 33;

@interface CalendarHeaderCell ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation CalendarHeaderCell

- (void)setText:(NSString *)text {
    self.label.text = text;
}

- (void)setColor:(UIColor *)color {
    self.label.textColor = color;
}

@end
