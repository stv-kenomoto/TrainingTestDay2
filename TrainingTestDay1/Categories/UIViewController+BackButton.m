//
//  UIViewController+BackButton.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/26.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "NSString+Localizable.h"
#import "UIViewController+BackButton.h"

@implementation UIViewController (BackButton)

- (void)setupBackButton {
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] init];
    backBarButtonItem.title = NSStringBack.localized;
    self.navigationItem.backBarButtonItem = backBarButtonItem;
}

@end
