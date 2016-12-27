//
//  ScheduleDB.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/27.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "DatabaseManager.h"
#import "Schedule.h"
#import "ScheduleDB.h"

static NSString *const TableName = @"schedule";

static NSString *const KeyNameID = @"id";

static NSString *const KeyNameTitle = @"title";

static NSString *const KeyNamePlace = @"place";

static NSString *const KeyNameDate = @"date";

static NSString *const KeyNameDetail = @"detail";

@implementation ScheduleDB

+ (BOOL)insertWithMinimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate title:(NSString *)title place:(NSString *)place detail:(NSString *)detail {
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@) VALUES (?, ?, ?, ?)",
                     TableName,
                     KeyNameTitle,
                     KeyNamePlace,
                     KeyNameDate,
                     KeyNameDetail];

    NSMutableArray<Schedule *> *schedules = [@[] mutableCopy];
    NSInteger count = 1;
    while (YES) {
        NSDate *date = [minimumDate dateByAddingTimeInterval:HalfOfHourTimeInterval * count];
        if ([date compare:maximumDate] == NSOrderedDescending) {
            break;
        }

        NSLog(@"%@", date);
        [schedules addObject:[[Schedule alloc] initWithDate:date title:title place:place detail:detail]];
        count++;
    }

    FMDatabase *db = [DatabaseManager database];
    [db open];
    [db beginTransaction];

    BOOL isSucceeded = YES;
    for (Schedule *schedule in schedules) {
        if (![db executeUpdate:sql, schedule.title, schedule.place, schedule.date, schedule.detail]) {
            isSucceeded = NO;
            break;
        }
    }

    if (isSucceeded) {
        [db commit];
    } else {
        [db rollback];
    }

    [db close];
    return isSucceeded;
}

+ (void)create {
    NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ DATETIME UNIQUE, %@ TEXT);",
                     TableName,
                     KeyNameID,
                     KeyNameTitle,
                     KeyNamePlace,
                     KeyNameDate,
                     KeyNameDetail];

    FMDatabase *db = [DatabaseManager database];
    [db open];
    [db executeUpdate:sql];
    [db close];
}

@end
