//
//  Schedule.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/26.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

@interface Schedule : NSObject

UIKIT_EXTERN const NSInteger SchedulesCount;
UIKIT_EXTERN const NSInteger HalfOfHourTimeInterval;

@property (strong, nonatomic) NSDate *date;

+ (NSArray<Schedule *> *)schedulesWithDate:(NSDate *)date;

- (instancetype)initWithDate:(NSDate *)date;

@end
