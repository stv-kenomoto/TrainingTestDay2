//
//  NSString+Localizable.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/22.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "NSString+Localizable.h"

NSString *const NSStringCalendarTitleFormat = @"calendarTitleFormat";

@implementation NSString (Localizable)

- (NSString *)localized {
    return NSLocalizedString(self, self);
}

@end
