//
//  DatePickerTextField.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/27.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "DatePickerTextField.h"
#import "NSDate+Calendar.h"
#import "NSString+Localizable.h"

@interface DatePickerTextField () <UITextFieldDelegate>

@end

@implementation DatePickerTextField

- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }

    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.datePickerMode = UIDatePickerModeDate;
    self.minuteInterval = 0;
    self.delegate = self;
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar sizeToFit];
    UIBarButtonItem *toolBarButton = [[UIBarButtonItem alloc] initWithTitle:NSStringDone.localized
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(doneDidTouch)];
    toolbar.items = @[toolBarButton];
    self.inputAccessoryView = toolbar;
}

- (void)doneDidTouch {
    [self resignFirstResponder];
}

- (void)setupText {
    self.text = [self.date dateStringWithFormat:NSStringEndTimeFormat.localized];
}

- (void)datePickerValueChanged:(UIDatePicker *)sender {
    self.date = sender.date;
    [self setupText];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = self.datePickerMode;
    datePicker.minuteInterval = self.minuteInterval;
    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];

    if (self.date != nil) {
        datePicker.date = self.date;
    }

    if (self.minimumDate != nil) {
        datePicker.minimumDate = self.minimumDate;
    }

    if (self.maximumDate != nil) {
        datePicker.maximumDate = self.maximumDate;
    }

    if (self.text.length == 0) {
        [self setupText];
    }

    textField.inputView = datePicker;
    return YES;
}

@end
