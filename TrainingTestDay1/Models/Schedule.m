//
//  Schedule.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/26.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "Schedule.h"

const NSInteger ScheduleHalfOfHourTimeInterval = 1800;

@implementation Schedule

- (instancetype)initWithDate:(NSDate *)date title:(NSString *)title place:(NSString *)place detail:(NSString *)detail {
    if (self = [self init]) {
        _date = date;
        _title = title;
        _place = place;
        _detail = detail;
    }

    return self;
}

@end
