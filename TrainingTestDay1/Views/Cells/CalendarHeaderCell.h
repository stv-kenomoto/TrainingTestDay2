//
//  CalendarHeaderCell.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/21.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

#import "Calendar.h"

@interface CalendarHeaderCell : UICollectionViewCell

UIKIT_EXTERN NSString *const CalendarHeaderCellIdentifier;
UIKIT_EXTERN const CGFloat CalendarHeaderCellHeight;

- (void)setupWithCalendar:(Calendar *)calendar;

@end
