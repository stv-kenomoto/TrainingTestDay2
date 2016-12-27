//
//  DatabaseManager.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on on 2016/12/27.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "DatabaseManager.h"

static NSString *const DatabaseName = @"calendar.db";

@implementation DatabaseManager

+ (FMDatabase *)database {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [path objectAtIndex:0];
    return [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:DatabaseName]];
}

@end
