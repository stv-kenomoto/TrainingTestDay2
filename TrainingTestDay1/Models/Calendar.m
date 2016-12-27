//
//  Calendar.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/27.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "Calendar.h"
#import "NSDate+Calendar.h"

const NSInteger CalendarDaysPerWeek = 7;

@implementation Calendar

+ (NSArray<Calendar *> *)calendarWithDate:(NSDate *)date {
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    dateComponents.day = 1;
    NSDate *firstDateOfMonth = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];

    NSInteger numberOfWeeks = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth
                                               inUnit:NSCalendarUnitMonth
                                              forDate:firstDateOfMonth].length;
    NSInteger numberOfDaysInMonth = numberOfWeeks * CalendarDaysPerWeek;

    NSMutableArray *calendars = [@[] mutableCopy];
    for (NSInteger i = 0; i < numberOfDaysInMonth; i++) {
        NSInteger ordinalityOfFirstDay = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay
                                                                                 inUnit:NSCalendarUnitWeekOfMonth
                                                                                forDate:firstDateOfMonth];

        NSDateComponents *nextComponents = [NSDateComponents new];
        nextComponents.day = i - (ordinalityOfFirstDay - 1);

        NSDate *nextDate = [[NSCalendar currentCalendar] dateByAddingComponents:nextComponents
                                                                     toDate:firstDateOfMonth
                                                                    options:0];

        NSInteger month = [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:date] month];
        NSInteger monthOfNexDate =[[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:nextDate] month];
        [calendars addObject:[[Calendar alloc] initWithDate:nextDate isDifferentMonth:month != monthOfNexDate]];
    }

    return calendars;
}

- (instancetype)initWithDate:(NSDate *)date isDifferentMonth:(BOOL)isDifferentMonth {
    if (self = [super init]) {
        _date = date;
        _isDifferentMonth = isDifferentMonth;
    }

    return self;
}

@end
