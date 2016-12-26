//
//  CalendarViewDataSource.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/21.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

typedef NS_ENUM(NSInteger, CalendarViewDataSourceCellType) {
    CalendarViewDataSourceCellTypeHeader,
    CalendarViewDataSourceCellTypeDate,
    // Counter
    CalendarViewDataSourceCellTypeCount
};

@interface CalendarViewDataSource : NSObject <UICollectionViewDataSource>

@property (strong, nonatomic) NSDate *date;

- (instancetype) initWithDate:(NSDate *)date;

@end
