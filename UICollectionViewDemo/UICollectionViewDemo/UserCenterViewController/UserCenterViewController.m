//
//  UserCenterViewController.m
//  UICollectionViewDemo
//
//  Created by admin on 16/9/27.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "UserCenterViewController.h"
#import "StretchHeaderCollectionViewFlowLayout.h"
#import "UserOrderCollectionViewCell.h"
#import "UserCenterCollectionReusableView.h"
#import "UserCenterBannerReusableView.h"
#import "UserCenterSingleViewCell.h"
#import "UserCenterOrderViewCell.h"
#import "UserCenterOthersViewCell.h"


@interface UserCenterViewController ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet StretchHeaderCollectionViewFlowLayout *stretchFlowLayout;

@end

@implementation UserCenterViewController

#pragma mark  - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self regesterCells];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.stretchFlowLayout.headerReferenceSize =
    CGSizeMake([UIScreen mainScreen].bounds.size.width, [self getSizeWithCurrentSize:150.0f]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private

- (CGFloat)getSizeWithCurrentSize:(CGFloat)size {
    return [UIScreen mainScreen].bounds.size.width * size / 414.0f;
}

- (void)setupViews {
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init]
                                                  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)regesterCells {
    UINib *userOrderNib = [UINib nibWithNibName:NSStringFromClass([UserOrderCollectionViewCell class])
                                         bundle:nil];
    [self.collectionView registerNib:userOrderNib
          forCellWithReuseIdentifier:NSStringFromClass([UserOrderCollectionViewCell class])];
    
    UINib *userCenterHeadNib = [UINib nibWithNibName:NSStringFromClass([UserCenterCollectionReusableView class])
                                              bundle:nil];
    [self.collectionView registerNib:userCenterHeadNib
          forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                 withReuseIdentifier:NSStringFromClass([UserCenterCollectionReusableView class])];
    
    UINib *bannerNib = [UINib nibWithNibName:NSStringFromClass([UserCenterBannerReusableView class])
                                      bundle:nil];
    [self.collectionView registerNib:bannerNib
          forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                 withReuseIdentifier:NSStringFromClass([UserCenterBannerReusableView class])];
    
    UINib *singleNib = [UINib nibWithNibName:NSStringFromClass([UserCenterSingleViewCell class])
                                      bundle:nil];
    [self.collectionView registerNib:singleNib
          forCellWithReuseIdentifier:NSStringFromClass([UserCenterSingleViewCell class])];
    
    UINib *orderNib = [UINib nibWithNibName:NSStringFromClass([UserCenterOrderViewCell class])
                                     bundle:nil];
    [self.collectionView registerNib:orderNib
          forCellWithReuseIdentifier:NSStringFromClass([UserCenterOrderViewCell class])];
    
    UINib *otherNib = [UINib nibWithNibName:NSStringFromClass([UserCenterOthersViewCell class])
                                     bundle:nil];
    [self.collectionView registerNib:otherNib
          forCellWithReuseIdentifier:NSStringFromClass([UserCenterOthersViewCell class])];
    
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexpath:::%@",indexPath);
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return !section ? 7 : 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.section) {
        if (!indexPath.row) {
            UserCenterOrderViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UserCenterOrderViewCell class]) forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 1) {
            UserCenterOthersViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UserCenterOthersViewCell class]) forIndexPath:indexPath];
            return cell;
        } else {
            UserCenterSingleViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UserCenterSingleViewCell class]) forIndexPath:indexPath];
            return cell;
        }
    }
    UserOrderCollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UserOrderCollectionViewCell class])
                                              forIndexPath:indexPath];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.section) {
        UserCenterCollectionReusableView *reusableView =
        [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                           withReuseIdentifier:NSStringFromClass([UserCenterCollectionReusableView class])
                                                  forIndexPath:indexPath];
        return reusableView;
    }
    UserCenterBannerReusableView *bannerView =
    [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                       withReuseIdentifier:NSStringFromClass([UserCenterBannerReusableView class])
                                              forIndexPath:indexPath];
    return bannerView;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, [self getSizeWithCurrentSize:150.0f]);
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.section) {
        CGFloat height = 0.0f;
        if (!indexPath.row) {
            height = 150.0f;
        } else if (indexPath.row == 1) {
            height = 80.0f;
        } else {
            height = 45.0f;
        }
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, height);
    }
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30.0f) / 2, 100);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return  section == 1 ? 10.0f : 0.0f;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    if (!section) {
        return UIEdgeInsetsMake(0, 0, 10, 0);
    }
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

@end
