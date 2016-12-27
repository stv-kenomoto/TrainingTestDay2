//
//  ScheduleListViewController.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/26.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "NSDate+Calendar.h"
#import "NSString+Localizable.h"
#import "ScheduleDB.h"
#import "ScheduleListViewController.h"
#import "ScheduleListViewDataSource.h"
#import "UINavigationController+Navigator.h"

@interface ScheduleListViewController () <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ScheduleListViewDataSource *scheduleListViewDataSource;

@end

@implementation ScheduleListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [self.date dateStringWithFormat:NSStringScheduleListTitleFormat.localized];
    self.tableView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSArray<Schedule *> *schedules = [ScheduleDB schedulesWithDate:self.date];
    self.scheduleListViewDataSource = [[ScheduleListViewDataSource alloc] initWithSchedules:schedules];
    self.tableView.dataSource = self.scheduleListViewDataSource;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Schedule *minimumSchedule = self.scheduleListViewDataSource.schedules[indexPath.row];
    Schedule *maximumSchedule = self.scheduleListViewDataSource.schedules.lastObject;
    [self.navigationController navigateToSchedueDetailWithMinimumSchedule:minimumSchedule maximumSchedule:maximumSchedule];
}

@end
