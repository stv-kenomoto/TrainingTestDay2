//
//  CalendarViewController.m
//  TrainingTestDay1
//
//  Created by Kouki Enomoto on 2016/12/21.
//  Copyright © 2016年 enomt. All rights reserved.
//

#import "CalendarHeaderCell.h"
#import "CalendarDateCell.h"
#import "CalendarViewController.h"
#import "CalendarViewDataSource.h"
#import "NSDate+Calendar.h"
#import "NSString+Localizable.h"
#import "UINavigationController+Navigator.h"

@interface CalendarViewController () <UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) CalendarViewDataSource *calendarViewDataSource;

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDate *date = [NSDate date];
    self.title = [date dateStringWithFormat:NSStringCalendarTitleFormat.localized];

    self.calendarViewDataSource = [[CalendarViewDataSource alloc] initWithDate:date];
    self.collectionView.dataSource = self.calendarViewDataSource;
    self.collectionView.delegate = self;
}

- (IBAction)didTapPrev:(id)sender {
    self.calendarViewDataSource.date = [self.calendarViewDataSource.date monthNextDate];
    self.navigationItem.title = [self.calendarViewDataSource.date dateStringWithFormat:NSStringCalendarTitleFormat.localized];
    [self.collectionView reloadData];
}

- (IBAction)didTapNext:(id)sender {
    self.calendarViewDataSource.date = [self.calendarViewDataSource.date monthPrevDate];
    self.navigationItem.title = [self.calendarViewDataSource.date dateStringWithFormat:NSStringCalendarTitleFormat.localized];
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = collectionView.frame.size.width / NSCalendarDaysPerWeek;
    CGFloat height;
    switch (indexPath.section) {
        case CalendarViewDataSourceCellTypeHeader:
            height = CalendarHeaderCellHeight;
            break;
        default:
            height = CalendarDateCellHeight;
            
            break;
    }
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDate *date = [self.calendarViewDataSource.date dateForCellAtIndexPath:indexPath];
    [self.navigationController navigateToSchedueListWithDate:date];
}

@end
