//
//  CalendarDateCell.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/21.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "CalendarDateCell.h"

NSString *const CalendarDateCellIdentifier = @"CalendarDateCell";
const CGFloat CalendarDateCellHeight = 66;

@interface CalendarDateCell ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation CalendarDateCell

- (void)setText:(NSString *)text {
    self.label.text = text;
}

- (void)setColor:(UIColor *)color {
    self.label.textColor = color;
}

@end
