//
//  Week.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/22.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

typedef NS_ENUM(NSInteger, WeekColorType) {
    WeekColorTypeBlack,
    WeekColorTypeBlue,
    WeekColorTypeRed,
};

@interface Week : NSObject

- (instancetype) initWithName:(NSString *)name color:(UIColor *)color;

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) UIColor *color;

@end
