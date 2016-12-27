//
//  ScheduleDB.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/27.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import Foundation;

@interface ScheduleDB : NSObject

+ (BOOL)insertWithMinimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate title:(NSString *)title place:(NSString *)place detail:(NSString *)detail;

+ (void)create;

@end
