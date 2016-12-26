//
//  Week.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/22.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "Week.h"

@implementation Week

- (instancetype) initWithName:(NSString *)name color:(UIColor *)color {
    if (self = [self init]) {
        _name = name;
        _color = color;
    }

    return self;
}

@end
