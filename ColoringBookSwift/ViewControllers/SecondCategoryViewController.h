//
//  SecondCategoryViewController.h
//  ColoringBookSwift
//


#import <UIKit/UIKit.h>
#import "XLPagerTabStripViewController.h"
#import "CanvasViewController.h"
@interface SecondCategoryViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,DrawingViewDelegate,XLPagerTabStripChildItem>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
