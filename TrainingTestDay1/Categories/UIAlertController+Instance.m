//
//  UIAlertController+Instance.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/27.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "NSString+Localizable.h"
#import "UIAlertController+Instance.h"

@implementation UIAlertController (Instance)

+ (UIAlertController *)alertControllerOfDeleteScheduleWithHandler:(void (^)(UIAlertAction *action))handler; {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                   message:NSStringDeleteSchedule.localized
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* okAction = [UIAlertAction actionWithTitle:NSStringOk.localized
                                                            style:UIAlertActionStyleDefault
                                                          handler:handler];

    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:NSStringCancel.localized
                                                            style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction * action) {}];

    [alert addAction:okAction];
    [alert addAction:cancelAction];
    return alert;
}

+ (UIAlertController *)alertControllerOfRequiredEndTime {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                   message:NSStringRequiredEndTime.localized
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* okAction = [UIAlertAction actionWithTitle:NSStringOk.localized
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];

    [alert addAction:okAction];
    return alert;
}

+ (UIAlertController *)alertControllerOfRequiredTitle {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                   message:NSStringRequiredTitle.localized
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* okAction = [UIAlertAction actionWithTitle:NSStringOk.localized
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];

    [alert addAction:okAction];
    return alert;
}

+ (UIAlertController *)alertControllerOfRequiredTitleAndEndTime {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                   message:NSStringRequiredTitleAndEndTime.localized
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* okAction = [UIAlertAction actionWithTitle:NSStringOk.localized
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];

    [alert addAction:okAction];
    return alert;
}

@end
