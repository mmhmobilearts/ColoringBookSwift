//
//  SecondCategoryViewController.h
//  ColoringBookSwift
//


#import <UIKit/UIKit.h>
#import "CanvasViewController.h"

@interface SecondCategoryViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,DrawingViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
