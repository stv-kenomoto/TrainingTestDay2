//
//  NSDate+Calendar.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/22.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

typedef NS_ENUM(NSInteger, NSDateWeekdayType) {
    NSDateWeekdayTypeSunday = 1,
    NSDateWeekdayTypeMonday,
    NSDateWeekdayTypeTuesday,
    NSDateWeekdayTypeWednesday,
    NSDateWeekdayTypeThursday,
    NSDateWeekdayTypeFriday,
    NSDateWeekdayTypeSaturday
};

@interface NSDate (Calendar)

- (NSDateWeekdayType)weekdayType;

- (NSString *)dateStringWithFormat:(NSString *)format;

- (NSDate *)monthNextDate;

- (NSDate *)monthPrevDate;

@end
