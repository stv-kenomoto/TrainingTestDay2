//
//  UIStoryboard+ViewController.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/26.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "UIStoryboard+ViewController.h"

@implementation UIStoryboard (ViewController)

static NSString *const StoryboardNameScheduleDetail = @"ScheduleDetail";
static NSString *const StoryboardNameScheduleList = @"ScheduleList";

static NSString *const StoryboardIDScheduleDetail = @"ScheduleDetail";
static NSString *const StoryboardIDScheduleList = @"ScheduleList";

+ (UIViewController *)viewControllerWithName:(NSString *)name id:(NSString *)id {
    return [[UIStoryboard storyboardWithName:name bundle:nil] instantiateViewControllerWithIdentifier:id];
}

+ (ScheduleDetailViewController *)scheduleDetailViewControllerWithMinimumSchedule:(Schedule *)minimumSchedule maximumSchedule:(Schedule *)maximumSchedule; {
    ScheduleDetailViewController *viewController = (ScheduleDetailViewController *)[self viewControllerWithName:StoryboardNameScheduleDetail
                                                                                                         id:StoryboardIDScheduleDetail];
    viewController.minimumSchedule = minimumSchedule;
    viewController.maximumSchedule = maximumSchedule;
    return viewController;
}

+ (ScheduleListViewController *)scheduleListViewControllerWithDate:(NSDate *)date {
    ScheduleListViewController *viewController = (ScheduleListViewController *)[self viewControllerWithName:StoryboardNameScheduleList
                                                                                                         id:StoryboardIDScheduleList];
    viewController.date = date;
    return viewController;
}

@end
