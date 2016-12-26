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

UIKIT_EXTERN const NSInteger NSCalendarDaysPerWeek;

- (NSRange)rangeOfWeeks;

- (NSInteger)numberOfWeeks;

- (NSInteger)numberOfDaysInMonth;

- (NSDate *)firstDateOfMonth;

- (NSDateWeekdayType)weekdayType;

- (NSDate *)dateForCellAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)dayStringForCellAtIndexPath:(NSIndexPath *)indexPath;

- (NSDateWeekdayType)weekdayTypeForCellAtIndexPath:(NSIndexPath *)indexPath;

- (BOOL)isEqualToDateForCellAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)dateStringWithFormat:(NSString *)format;

- (NSDate *)monthNextDate;

- (NSDate *)monthPrevDate;

@end
