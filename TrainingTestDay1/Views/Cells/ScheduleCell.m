//
//  ScheduleCell.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/26.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "NSDate+Calendar.h"
#import "NSString+Localizable.h"
#import "ScheduleCell.h"

NSString *const ScheduleCellIdentifier = @"ScheduleCell";

@interface ScheduleCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scheduleLabel;

@end

@implementation ScheduleCell

- (void)setupWithSchedule:(Schedule *)schedule {
    self.timeLabel.text = [schedule.date dateStringWithFormat:NSStringScheduleTimeFormat.localized];
    self.scheduleLabel.text = schedule.title;
    if (self.scheduleLabel.text.length == 0) {
        self.backgroundColor = [UIColor clearColor];
    } else {
        self.backgroundColor = [UIColor colorWithRed:187/255.0 green:222/255.0 blue:251/255.0 alpha:1.0];
    }
}

@end
