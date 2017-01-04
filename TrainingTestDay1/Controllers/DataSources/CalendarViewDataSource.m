//
//  CalendarViewDataSource.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/21.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "CalendarViewDataSource.h"
#import "CalendarDateCell.h"
#import "CalendarHeaderCell.h"

@implementation CalendarViewDataSource

- (instancetype) initWithCalendars:(NSArray<Calendar *> *) calendars {
    if (self = [self init]) {
        _calendars = calendars;
    }

    return self;
}

- (CalendarHeaderCell *)calendarHeaderCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    CalendarHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CalendarHeaderCellIdentifier forIndexPath:indexPath];
    Calendar *calendar = self.calendars[indexPath.row];
    [cell setupWithCalendar:calendar];
    return cell;
}

- (CalendarDateCell *)calendarDateCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    CalendarDateCell *cell = (CalendarDateCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CalendarDateCellIdentifier forIndexPath:indexPath];
    Calendar *calendar = self.calendars[indexPath.row];
    [cell setupWithCalendar:calendar];
    return cell;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return CalendarViewDataSourceCellTypeCount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case CalendarViewDataSourceCellTypeHeader:
            return CalendarDaysPerWeek;
        default:
            return self.calendars.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case CalendarViewDataSourceCellTypeHeader:
            return [self calendarHeaderCellWithCollectionView:collectionView indexPath:indexPath];
        default:
            return [self calendarDateCellWithCollectionView:collectionView indexPath:indexPath];
    }
}

@end
