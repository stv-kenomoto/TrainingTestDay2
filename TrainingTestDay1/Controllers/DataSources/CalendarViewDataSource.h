//
//  CalendarViewDataSource.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/21.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

#import "Calendar.h"

typedef NS_ENUM(NSInteger, CalendarViewDataSourceCellType) {
    CalendarViewDataSourceCellTypeHeader,
    CalendarViewDataSourceCellTypeDate,
    // Counter
    CalendarViewDataSourceCellTypeCount
};

@interface CalendarViewDataSource : NSObject <UICollectionViewDataSource>

@property (strong, nonatomic) NSArray<Calendar *> *calendars;

- (instancetype) initWithCalendars:(NSArray<Calendar *> *) calendars;

@end
