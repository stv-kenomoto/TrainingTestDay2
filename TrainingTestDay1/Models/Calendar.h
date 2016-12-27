//
//  Calendar.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/27.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

@interface Calendar : NSObject

UIKIT_EXTERN const NSInteger CalendarDaysPerWeek;

@property (strong, nonatomic) NSDate *date;
@property (assign, nonatomic) BOOL isDifferentMonth;

+ (NSArray<Calendar *> *)calendarWithDate:(NSDate *)date;

- (instancetype)initWithDate:(NSDate *)date isDifferentMonth:(BOOL)isDifferentMonth;

@end
