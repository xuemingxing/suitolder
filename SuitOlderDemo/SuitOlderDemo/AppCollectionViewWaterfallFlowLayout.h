

#import <UIKit/UIKit.h>

@class AppCollectionViewWaterfallFlowLayout;
@protocol AppCollectionViewWaterfallFlowLayoutDataSource;


#pragma mark -

@interface AppCollectionViewWaterfallFlowLayout : UICollectionViewLayout

@property (nonatomic, weak) id<AppCollectionViewWaterfallFlowLayoutDataSource> dataSource;

@property (nonatomic, assign) CGFloat minimumLineSpacing; // default 0.0
@property (nonatomic, assign) CGFloat minimumInteritemSpacing; // default 0.0
@property (nonatomic, assign) IBInspectable BOOL sectionHeadersPinToVisibleBounds; // default NO
//@property (nonatomic, assign) IBInspectable BOOL sectionFootersPinToVisibleBounds;

@end


#pragma mark -

@protocol AppCollectionViewWaterfallFlowLayoutDataSource<NSObject>

@required
/// Return per section's column number(must be greater than 0).
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(AppCollectionViewWaterfallFlowLayout*)layout numberOfColumnInSection:(NSInteger)section;
/// Return per item's height
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(AppCollectionViewWaterfallFlowLayout*)layout itemWidth:(CGFloat)width
 heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional
/// Column spacing between columns
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(AppCollectionViewWaterfallFlowLayout*)layout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
/// The spacing between rows and rows
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(AppCollectionViewWaterfallFlowLayout*)layout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
///
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(AppCollectionViewWaterfallFlowLayout*)layout insetForSectionAtIndex:(NSInteger)section;
/// Return per section header view height.
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(AppCollectionViewWaterfallFlowLayout*)layout referenceHeightForHeaderInSection:(NSInteger)section;
/// Return per section footer view height.
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(AppCollectionViewWaterfallFlowLayout*)layout referenceHeightForFooterInSection:(NSInteger)section;

@end
