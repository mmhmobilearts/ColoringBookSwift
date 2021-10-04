//
//  AllCategoryViewController.h
//  ColoringBookSwift
//


#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface AllCategoryViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>


@property (weak, nonatomic) IBOutlet UICollectionView *animalCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *animeCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *barbieCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *mandalaCollectionVIew;
@property (weak, nonatomic) IBOutlet UICollectionView *santaCollectionView;

@end

NS_ASSUME_NONNULL_END
