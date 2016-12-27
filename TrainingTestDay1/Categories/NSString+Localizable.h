//
//  NSString+Localizable.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/22.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

@interface NSString (Localizable)

UIKIT_EXTERN NSString *const NSStringBack;
UIKIT_EXTERN NSString *const NSStringCalendarTitleFormat;
UIKIT_EXTERN NSString *const NSStringDayFormat;
UIKIT_EXTERN NSString *const NSStringDone;
UIKIT_EXTERN NSString *const NSStringEndTimeFormat;
UIKIT_EXTERN NSString *const NSStringSchedule;
UIKIT_EXTERN NSString *const NSStringScheduleListTitleFormat;
UIKIT_EXTERN NSString *const NSStringScheduleTimeFormat;
UIKIT_EXTERN NSString *const NSStringStartTimeFormat;
UIKIT_EXTERN NSString *const NSStringWeekFormat;

- (NSString *)localized;

@end
