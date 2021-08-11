//
//  TwoViewController.m
//  TwoViewController
//
//  Created by mac  on 2021/8/6.
//

#import "TwoViewController.h"
#import "AppConfiguration.h"
#import "InnerViewController.h"
#import "AppCollectionViewWaterfallFlowLayout.h"
#import "UIViewController+SwitchAppMode.h"


@interface CustomCollectionViewCell : UICollectionViewCell

@property( nonatomic, strong) UIView *tipView;

@property( nonatomic, strong) UILabel *tipLabel;

- (void)bindIndexPath:(NSIndexPath *)indexPath;

@end

@implementation CustomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.tipView];
        self.tipView.frame = [AppConfiguration sharedConfiguration].appOldMode ? CGRectMake(20, 10, 50, 50) : CGRectMake(20, 10, 20, 20);
        self.tipView.backgroundColor = [self randomColor];
        
        [self.contentView addSubview:self.tipLabel];
        self.tipLabel.frame = [AppConfiguration sharedConfiguration].appOldMode ? CGRectMake(10, 70, 100, 50) : CGRectMake(10, 30, 80, 50);
    }
    return self;
}

- (void)bindIndexPath:(NSIndexPath *)indexPath
{
    self.tipLabel.text = [NSString stringWithFormat:@"section:%ld\nrow:%ld", indexPath.section, indexPath.item];
}

- (UIColor *)randomColor
{
    CGFloat red = arc4random_uniform(256)/ 255.0;
    CGFloat green = arc4random_uniform(256)/ 255.0;
    CGFloat blue = arc4random_uniform(256)/ 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    return color;
}

- (UILabel *)tipLabel
{
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.font = [AppConfiguration sharedConfiguration].appOldMode ? [UIFont boldSystemFontOfSize:18] : [UIFont systemFontOfSize:14];
        _tipLabel.numberOfLines = 2;
    }
    return _tipLabel;
}

- (UIView *)tipView
{
    if (!_tipView) {
        _tipView = [[UIView alloc] init];
        _tipView.layer.cornerRadius = 10;
        _tipView.layer.masksToBounds = YES;
    }
    return _tipView;
}

@end



@interface TwoViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, AppCollectionViewWaterfallFlowLayoutDataSource>
@property(nonatomic, strong) UICollectionView *collectionView;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionView];
    self.collectionView.frame = CGRectMake(0, 0, 375, 667);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCollectionViewCell" forIndexPath:indexPath];
    [cell bindIndexPath:indexPath];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(AppCollectionViewWaterfallFlowLayout *)layout numberOfColumnInSection:(NSInteger)section {
    return section + 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(AppCollectionViewWaterfallFlowLayout *)layout itemWidth:(CGFloat)width heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    return arc4random_uniform(200) + ([AppConfiguration sharedConfiguration].appOldMode ? 160 : 80);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(AppCollectionViewWaterfallFlowLayout *)layout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        AppCollectionViewWaterfallFlowLayout *flowLayout = [[AppCollectionViewWaterfallFlowLayout alloc] init];
        flowLayout.dataSource = self;
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"CustomCollectionViewCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (BOOL)checkSwitchAppMode
{
    return NO;
}

@end
