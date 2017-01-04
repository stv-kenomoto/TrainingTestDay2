//
//  CalendarDateCell.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/21.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

#import "Calendar.h"

@interface CalendarDateCell : UICollectionViewCell

UIKIT_EXTERN NSString *const CalendarDateCellIdentifier;
UIKIT_EXTERN const CGFloat CalendarDateCellHeight;

- (void)setupWithCalendar:(Calendar *)calendar;

@end
