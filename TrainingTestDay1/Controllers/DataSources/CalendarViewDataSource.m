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
#import "NSDate+Calendar.h"
#import "WeekPlist.h"

@interface CalendarViewDataSource ()

@property (strong, nonatomic) NSArray<Week *> *weeks;

@end

@implementation CalendarViewDataSource

- (instancetype) init {
    if (self = [super init]) {
        _date = [NSDate date];
        _weeks = [WeekPlist weeks];
    }

    return self;
}

- (instancetype) initWithDate:(NSDate *)date {
    if (self = [self init]) {
        _date = date;
    }

    return self;
}

- (CalendarHeaderCell *)calendarHeaderCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    CalendarHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CalendarHeaderCellIdentifier forIndexPath:indexPath];
    [cell setupWithWeek:self.weeks[indexPath.row]];
    return cell;
}

- (CalendarDateCell *)calendarDateCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    CalendarDateCell *cell = (CalendarDateCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CalendarDateCellIdentifier forIndexPath:indexPath];
    [cell setText:[self.date dayStringForCellAtIndexPath:indexPath]];

    if (![self.date isEqualToDateForCellAtIndexPath:indexPath]) {
        [cell setColor:[UIColor lightGrayColor]];
        return cell;
    }

    switch ([self.date weekdayTypeForCellAtIndexPath:indexPath]) {
        case NSDateWeekdayTypeSunday:
            [cell setColor:[UIColor redColor]];
            break;
            
        case NSDateWeekdayTypeSaturday:
            [cell setColor:[UIColor blueColor]];
            break;
            
        default:
            [cell setColor:[UIColor blackColor]];
            break;
    }

    return cell;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return CalendarViewDataSourceCellTypeCount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case CalendarViewDataSourceCellTypeHeader:
            return self.weeks.count;
        default:
            return [self.date numberOfDaysInMonth];
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
