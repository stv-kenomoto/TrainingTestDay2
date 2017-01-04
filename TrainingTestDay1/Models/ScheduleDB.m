//
//  ScheduleDB.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/27.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "DatabaseManager.h"
#import "NSDate+Calendar.h"
#import "ScheduleDB.h"

static NSString *const TableName = @"schedule";

static NSString *const KeyNameID = @"id";

static NSString *const KeyNameTitle = @"title";

static NSString *const KeyNamePlace = @"place";

static NSString *const KeyNameDate = @"date";

static NSString *const KeyNameDetail = @"detail";

static const NSInteger ScheduleCount = 48;

@implementation ScheduleDB

+ (NSArray<Schedule *> *)schedulesWithDate:(NSDate *)date {
    NSMutableArray<NSDate *> *dates = [@[] mutableCopy];
    for (NSInteger i = 0; i < ScheduleCount; i++) {
        NSDate *nextDate = [date dateByAddingTimeInterval:ScheduleHalfOfHourTimeInterval * i];
        [dates addObject:nextDate];
    }

    NSMutableString *sql = [NSMutableString stringWithFormat:@"SELECT %@, %@, %@, %@ FROM %@ WHERE %@ IN (",
                     KeyNameTitle,
                     KeyNamePlace,
                     KeyNameDate,
                     KeyNameDetail,
                     TableName,
                     KeyNameDate];

    for (NSDate *date in dates) {
        [sql appendString:@"?"];
        if (date != dates.lastObject) {
            [sql appendString:@","];
        }
    }

    [sql appendString:@");"];

    FMDatabase *db = [DatabaseManager database];
    [db open];
    FMResultSet *result = [db executeQuery:sql withArgumentsInArray:dates];
    NSMutableArray<Schedule *> *schedulesFromDB = [@[] mutableCopy];
    while ([result next]) {
        NSString *title = [result stringForColumn:KeyNameTitle];
        NSString *place = [result stringForColumn:KeyNamePlace];
        NSDate *date = [result dateForColumn:KeyNameDate];
        NSString *detail = [result stringForColumn:KeyNameDetail];
        [schedulesFromDB addObject:[[Schedule alloc] initWithDate:date title:title place:place detail:detail]];
    }

    NSMutableArray<Schedule *> *schedules = [@[] mutableCopy];
    for (NSDate *date in dates) {
        if (schedulesFromDB.firstObject != nil && [date compare:schedulesFromDB.firstObject.date] == NSOrderedSame) {
            [schedules addObject:schedulesFromDB.firstObject];
            if (1 < schedulesFromDB.count) {
                [schedulesFromDB removeObject:schedulesFromDB.firstObject];
            }
        } else {
            [schedules addObject:[[Schedule alloc] initWithDate:date title:@"" place:@"" detail:@""]];
        }
    }

    [db close];
    return schedules;
}

+ (BOOL)updateWithMinimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate title:(NSString *)title place:(NSString *)place detail:(NSString *)detail {
    NSString *sql = [NSString stringWithFormat:@"REPLACE INTO %@ (%@, %@, %@, %@) VALUES (?, ?, ?, ?)",
                     TableName,
                     KeyNameTitle,
                     KeyNamePlace,
                     KeyNameDate,
                     KeyNameDetail];

    NSMutableArray<Schedule *> *schedules = [@[] mutableCopy];
    NSInteger count = 0;
    while (YES) {
        NSDate *date = [minimumDate dateByAddingTimeInterval:ScheduleHalfOfHourTimeInterval * count];
        if ([date compare:maximumDate] != NSOrderedAscending) {
            break;
        }

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

+ (BOOL)deleteWithDate:(NSDate *)date {
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@ = ?",
                     TableName,
                     KeyNameDate];

    FMDatabase *db = [DatabaseManager database];
    [db open];
    [db beginTransaction];
    BOOL isSucceeded = YES;
    if (![db executeUpdate:sql, date]) {
        isSucceeded = NO;
    }

    if (isSucceeded) {
        [db commit];
    } else {
        [db rollback];
    }

    [db close];
    return isSucceeded;
}

+ (BOOL)isScheduleWithDate:(NSDate *)date {
    NSString *sql = [NSString stringWithFormat:@"SELECT %@ FROM %@ WHERE  %@ >= ? AND %@ < ?;",
                     KeyNameDate,
                     TableName,
                     KeyNameDate,
                     KeyNameDate];

    FMDatabase *db = [DatabaseManager database];
    [db open];
    FMResultSet *result = [db executeQuery:sql, date, [date dateByAddingTimeInterval:60 * 60 * 24]];
    [result next];
    BOOL isSchedule = 0 < result.columnCount;
    [db close];
    return isSchedule;
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
