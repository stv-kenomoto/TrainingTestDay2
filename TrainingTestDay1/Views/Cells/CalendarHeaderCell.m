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

- (void)setupWithWeek:(Week *)week {
    self.label.text = week.name;
    self.label.textColor = week.color;
}

@end
