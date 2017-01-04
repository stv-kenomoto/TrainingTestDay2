//
//  CalendarHeaderCell.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/21.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "CalendarHeaderCell.h"
#import "NSDate+Calendar.h"
#import "NSString+Localizable.h"

NSString *const CalendarHeaderCellIdentifier = @"CalendarHeaderCell";
const CGFloat CalendarHeaderCellHeight = 33;

@interface CalendarHeaderCell ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation CalendarHeaderCell

- (void)setupWithCalendar:(Calendar *)calendar {
    self.label.text = [calendar.date dateStringWithFormat:NSStringWeekFormat.localized];
    switch ([calendar.date weekdayType]) {
        case NSDateWeekdayTypeSunday:
            self.label.textColor = [UIColor redColor];
            break;

        case NSDateWeekdayTypeSaturday:
            self.label.textColor = [UIColor blueColor];
            break;

        default:
            self.label.textColor = [UIColor blackColor];
    }
}

@end
