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
#import "ScheduleDB.h"
#import "ScheduleDetailViewController.h"
#import "UIAlertController+Instance.h"

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
    self.endTimeTextField.date = [self.minimumSchedule.date dateByAddingTimeInterval:HalfOfHourTimeInterval];
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

- (IBAction)saveButtonDidTouch:(UIBarButtonItem *)sender {
    if (self.titleTextField.text.length == 0 && self.endTimeTextField.text.length == 0) {
        UIAlertController *alertController = [UIAlertController alertControllerOfRequiredTitleAndEndTime];
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }

    if (self.titleTextField.text.length == 0) {
        UIAlertController *alertController = [UIAlertController alertControllerOfRequiredTitle];
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }

    if (self.endTimeTextField.text.length == 0) {
        UIAlertController *alertController = [UIAlertController alertControllerOfRequiredEndTime];
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }

    BOOL result = [ScheduleDB insertWithMinimumDate:self.minimumSchedule.date
                          maximumDate:self.endTimeTextField.date
                                title:self.titleTextField.text
                                place:self.placeTextField.text
                               detail:self.detailTextView.text];

    if (result) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerOfFailedSaving];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (IBAction)removeButtonTouch:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerOfDeleteScheduleWithHandler:^(UIAlertAction *action) {
        NSLog(@"Remove");
    }];
    [self presentViewController:alertController animated:YES completion:nil];
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
