//
//  UINavigationController+Navigator.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/26.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "UINavigationController+Navigator.h"
#import "UIStoryboard+ViewController.h"
#import "UIViewController+BackButton.h"

@implementation UINavigationController (Navigator)

- (void)navigateToSchedueDetailWithMinimumSchedule:(Schedule *)minimumSchedule maximumSchedule:(Schedule *)maximumSchedule; {
    [self.topViewController setupBackButton];
    [self pushViewController:[UIStoryboard scheduleDetailViewControllerWithMinimumSchedule:minimumSchedule maximumSchedule:maximumSchedule] animated:YES];
}

- (void)navigateToSchedueListWithDate:(NSDate *)date {
    [self.topViewController setupBackButton];
    [self pushViewController:[UIStoryboard scheduleListViewControllerWithDate:date] animated:YES];
}

@end
