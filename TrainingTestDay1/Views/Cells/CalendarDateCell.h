//
//  CalendarDateCell.h
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/21.
//  Copyright © 2016年 enomt. All rights reserved.
//

@import UIKit;

@interface CalendarDateCell : UICollectionViewCell

UIKIT_EXTERN NSString *const CalendarDateCellIdentifier;
UIKIT_EXTERN const CGFloat CalendarDateCellHeight;

- (void)setText:(NSString *)text;

- (void)setColor:(UIColor *)color;

@end
