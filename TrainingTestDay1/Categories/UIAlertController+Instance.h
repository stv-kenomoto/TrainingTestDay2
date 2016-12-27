//
//  UIAlertController+Instance.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/27.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

@interface UIAlertController (Instance)

+ (UIAlertController *)alertControllerOfDeleteScheduleWithHandler:(void (^)(UIAlertAction *action))handler;
+ (UIAlertController *)alertControllerOfRequiredEndTime;
+ (UIAlertController *)alertControllerOfRequiredTitle;
+ (UIAlertController *)alertControllerOfRequiredTitleAndEndTime;

@end
