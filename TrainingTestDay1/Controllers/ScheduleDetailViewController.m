//
//  ScheduleDetailViewController.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/26.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "DatePickerTextField.h"
#import "NSDate+Calendar.h"
#import "NSString+Localizable.h"
#import "ScheduleDetailViewController.h"

static const NSInteger EndTimeMinuteInterval = 30;

@interface ScheduleDetailViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *placeTextField;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet DatePickerTextField *endTimeTextField;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property (weak, nonatomic) IBOutlet UILabel *detailPlaceHolderLabel;

@end

@implementation ScheduleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringSchedule.localized;
    self.titleTextField.delegate = self;
    self.placeTextField.delegate = self;
    self.endTimeTextField.datePickerMode = UIDatePickerModeDateAndTime;
    self.endTimeTextField.date = self.minimumSchedule.date;
    self.endTimeTextField.minuteInterval = EndTimeMinuteInterval;
    self.endTimeTextField.minimumDate = [self.minimumSchedule.date dateByAddingTimeInterval:HalfOfHourTimeInterval];
    self.endTimeTextField.maximumDate = self.maximumSchedule.date;
    self.startTimeLabel.text = [self.minimumSchedule.date dateStringWithFormat:NSStringStartTimeFormat.localized];
    self.detailTextView.delegate = self;
}

- (void)hideKeyboardOfTitleTextField {
    if ([self.titleTextField isFirstResponder]) {
        [self.titleTextField resignFirstResponder];
    }
}

- (void)hideKeyboardOfPlaceTextField {
    if ([self.placeTextField isFirstResponder]) {
        [self.placeTextField resignFirstResponder];
    }
}

- (void)hideDetailPlaceHolderLabel {
    if (!self.detailPlaceHolderLabel.isHidden) {
        [self.detailPlaceHolderLabel setHidden:YES];
    }
}

- (void)showDetailPlaceHolderLabel {
    if (self.detailPlaceHolderLabel.isHidden) {
        [self.detailPlaceHolderLabel setHidden:NO];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self hideKeyboardOfTitleTextField];
    [self hideKeyboardOfPlaceTextField];
    return NO;
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    if (self.detailTextView.text.length == 0) {
        [self showDetailPlaceHolderLabel];
    } else {
        [self hideDetailPlaceHolderLabel];
    }
}

@end
