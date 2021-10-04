//
//  FourthCategoryViewController.h
//  ColoringBookSwift
//
//

#import <UIKit/UIKit.h>
#import "XLPagerTabStripViewController.h"
#import "CanvasViewController.h"
@interface FourthCategoryViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,DrawingViewDelegate,XLPagerTabStripChildItem>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
