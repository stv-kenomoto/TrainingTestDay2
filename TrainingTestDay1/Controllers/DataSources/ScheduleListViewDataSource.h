//
//  ScheduleListViewDataSource.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/26.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

#import "Schedule.h"

@interface ScheduleListViewDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSArray<Schedule *> *schedules;

- (instancetype)initWithSchedules:(NSArray<Schedule *> *)schedules;

@end
