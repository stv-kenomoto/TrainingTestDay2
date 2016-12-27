//
//  ScheduleDB.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/27.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import Foundation;

#import "Schedule.h"

@interface ScheduleDB : NSObject

+ (NSArray<Schedule *> *)schedulesWithDate:(NSDate *)date;

+ (BOOL)updateWithMinimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate title:(NSString *)title place:(NSString *)place detail:(NSString *)detail;

+ (BOOL)deleteWithDate:(NSDate *)date;

+ (void)create;

@end
