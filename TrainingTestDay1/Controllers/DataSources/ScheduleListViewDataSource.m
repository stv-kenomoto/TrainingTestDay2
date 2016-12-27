//
//  ScheduleListViewDataSource.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/26.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "ScheduleCell.h"
#import "ScheduleListViewDataSource.h"

@implementation ScheduleListViewDataSource

- (instancetype)initWithSchedules:(NSArray<Schedule *> *)schedules {
    if (self = [self init]) {
        _schedules = schedules;
    }

    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.schedules.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ScheduleCell *cell = (ScheduleCell *)[tableView dequeueReusableCellWithIdentifier:ScheduleCellIdentifier forIndexPath:indexPath];
    Schedule *schedule = self.schedules[indexPath.row];
    [cell setupWithSchedule:schedule];
    return cell;
}

@end
