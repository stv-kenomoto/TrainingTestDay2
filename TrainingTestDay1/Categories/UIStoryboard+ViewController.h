//
//  UIStoryboard+ViewController.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/26.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

#import "ScheduleDetailViewController.h"
#import "ScheduleListViewController.h"

@interface UIStoryboard (ViewController)

+ (UIViewController *)viewControllerWithName:(NSString *)name id:(NSString *)id;

+ (ScheduleDetailViewController *)scheduleDetailViewControllerWithMinimumSchedule:(Schedule *)minimumSchedule maximumSchedule:(Schedule *)maximumSchedule;

+ (ScheduleListViewController *)scheduleListViewControllerWithDate:(NSDate *)date;

@end
