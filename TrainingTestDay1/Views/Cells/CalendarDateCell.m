//
//  CalendarDateCell.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/21.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "CalendarDateCell.h"
#import "NSDate+Calendar.h"
#import "NSString+Localizable.h"

NSString *const CalendarDateCellIdentifier = @"CalendarDateCell";
const CGFloat CalendarDateCellHeight = 66;

@interface CalendarDateCell ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *scheduleMarkLabel;

@end

@implementation CalendarDateCell

- (void)setupWithCalendar:(Calendar *)calendar {
    self.label.text = [calendar.date dateStringWithFormat:NSStringDayFormat.localized];

    if (calendar.isSchedule) {
        [self.scheduleMarkLabel setHidden:NO];
    } else {
        [self.scheduleMarkLabel setHidden:YES];
    }

    if (calendar.isDifferentMonth) {
        self.label.textColor = [UIColor lightGrayColor];
        self.scheduleMarkLabel.textColor = [UIColor lightGrayColor];
        return;
    }

    switch ([calendar.date weekdayType]) {
        case NSDateWeekdayTypeSunday:
            self.label.textColor = [UIColor redColor];
            self.scheduleMarkLabel.textColor = [UIColor redColor];
            break;

        case NSDateWeekdayTypeSaturday:
            self.label.textColor = [UIColor blueColor];
            self.scheduleMarkLabel.textColor = [UIColor blueColor];
            break;

        default:
            self.label.textColor = [UIColor blackColor];
            self.scheduleMarkLabel.textColor = [UIColor blackColor];
            break;
    }
}

@end
