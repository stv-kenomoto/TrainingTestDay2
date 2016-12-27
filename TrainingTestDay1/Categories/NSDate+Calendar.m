//
//  NSDate+Calendar.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/22.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "NSDate+Calendar.h"

@implementation NSDate (Calendar)

const NSInteger NSCalendarDaysPerWeek = 7;

- (NSRange)rangeOfWeeks {
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth
                                              inUnit:NSCalendarUnitMonth
                                             forDate:[self firstDateOfMonth]];
}

- (NSInteger)numberOfWeeks {
    return [self rangeOfWeeks].length;
}

- (NSInteger)numberOfDaysInMonth {
    return [self numberOfWeeks] * NSCalendarDaysPerWeek;
}

- (NSDate *)firstDateOfMonth {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                                                   fromDate:self];
    components.day = 1;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDateWeekdayType)weekdayType {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday
                                               fromDate:self];
    return [components weekday];
}

- (NSDate *)dateForCellAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger ordinalityOfFirstDay = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay
                                            inUnit:NSCalendarUnitWeekOfMonth
                                           forDate:[self firstDateOfMonth]];

    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.day = indexPath.item - (ordinalityOfFirstDay - 1);

    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents
                                                                 toDate:[self firstDateOfMonth]
                                                                options:0];

    return date;
}

- (BOOL)isEqualMonthWithDate:(NSDate *)date {
    NSDateComponents *componentsForCell = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:date];
    NSInteger monthForCell = [componentsForCell month];

    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self];
    NSInteger month = [components month];

    return monthForCell == month;
}

- (NSString *)dateStringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSDate *)monthNextDate {
    NSInteger addValue = -1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

- (NSDate *)monthPrevDate {
    NSInteger addValue = 1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

@end
