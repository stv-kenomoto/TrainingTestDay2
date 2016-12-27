//
//  ScheduleCell.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/26.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

#import "Schedule.h"

@interface ScheduleCell : UITableViewCell

UIKIT_EXTERN NSString *const ScheduleCellIdentifier;

- (void)setupWithSchedule:(Schedule *)schedule;

@end
