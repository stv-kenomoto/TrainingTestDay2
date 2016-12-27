//
//  DatabaseManager.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/27.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

#import <FMDB.h>

@interface DatabaseManager : NSObject

+ (FMDatabase *)database;

@end
