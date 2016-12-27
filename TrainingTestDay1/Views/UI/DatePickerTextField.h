//
//  DatePickerTextField.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/27.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

@interface DatePickerTextField : UITextField

@property (assign, nonatomic) UIDatePickerMode datePickerMode;
@property (assign, nonatomic) NSInteger minuteInterval;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSDate *minimumDate;
@property (strong, nonatomic) NSDate *maximumDate;

@end
