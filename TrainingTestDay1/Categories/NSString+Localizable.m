//
//  NSString+Localizable.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/22.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "NSString+Localizable.h"

NSString *const NSStringBack = @"back";
NSString *const NSStringCalendarTitleFormat = @"calendarTitleFormat";
NSString *const NSStringDayFormat = @"dayFormat";
NSString *const NSStringDone = @"done";
NSString *const NSStringEndTimeFormat = @"endTimeFormat";
NSString *const NSStringSchedule = @"schedule";
NSString *const NSStringScheduleListTitleFormat = @"scheduleListTitleFormat";
NSString *const NSStringScheduleTimeFormat = @"scheduleTimeFormat";
NSString *const NSStringStartTimeFormat = @"startTimeFormat";
NSString *const NSStringWeekFormat = @"weekFormat";

@implementation NSString (Localizable)

- (NSString *)localized {
    return NSLocalizedString(self, self);
}

@end
