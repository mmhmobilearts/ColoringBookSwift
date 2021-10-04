//
//  FivthCategoryViewController.h
//  ColoringBookSwift
//


#import <UIKit/UIKit.h>
#import "CanvasViewController.h"

@interface FifthCategoryViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,DrawingViewDelegate,XLPagerTabStripChildItem>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
