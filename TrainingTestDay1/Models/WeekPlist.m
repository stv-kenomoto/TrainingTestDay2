//
//  WeekPlist.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/22.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "WeekPlist.h"

static NSString *const WeekPlistName = @"Week";
static NSString *const WeekPlistType = @"plist";
static NSString *const WeekPlistRootKey = @"Week";
static NSString *const WeekPlistNameKey = @"Name";
static NSString *const WeekPlistColorKey = @"Color";

@implementation WeekPlist

+ (NSArray<Week *> *)weeks {
    NSString *path = [[NSBundle mainBundle] pathForResource:WeekPlistName ofType:WeekPlistType];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray<NSDictionary *> *roots = dictionary[WeekPlistRootKey];
    NSMutableArray<Week *> *weeks = [@[] mutableCopy];

    for (NSDictionary * root in roots) {
        NSString *nameValue = root[WeekPlistNameKey];
        NSInteger colorValue = [root[WeekPlistColorKey] integerValue];

        UIColor *color;
        switch (colorValue) {
            case WeekColorTypeBlue:
                color = [UIColor blueColor];
                break;

            case WeekColorTypeRed:
                color = [UIColor redColor];
                break;

            default:
                color = [UIColor blackColor];
                break;
        }

        [weeks addObject:[[Week alloc] initWithName:nameValue color:color]];
    }

    return weeks;
}

@end
