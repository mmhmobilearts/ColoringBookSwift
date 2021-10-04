//
//  ThirdCategoryViewController.h
//  ColoringBookSwift
//


#import <UIKit/UIKit.h>
#import "CanvasViewController.h"
@interface ThirdCategoryViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,DrawingViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
