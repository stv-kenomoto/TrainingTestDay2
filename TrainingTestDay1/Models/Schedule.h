//
//  Schedule.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/26.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

@interface Schedule : NSObject

UIKIT_EXTERN const NSInteger ScheduleHalfOfHourTimeInterval;

@property (strong, nonatomic) NSDate *date;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *place;
@property (copy, nonatomic) NSString *detail;

- (instancetype)initWithDate:(NSDate *)date title:(NSString *)title place:(NSString *)place detail:(NSString *)detail;

@end
