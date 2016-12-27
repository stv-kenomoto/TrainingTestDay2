//
//  UINavigationController+Navigator.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/26.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

#import "Schedule.h"

@interface UINavigationController (Navigator)

- (void)navigateToSchedueDetailWithMinimumSchedule:(Schedule *)minimumSchedule maximumSchedule:(Schedule *)maximumSchedule;

- (void)navigateToSchedueListWithDate:(NSDate *)date;

@end
