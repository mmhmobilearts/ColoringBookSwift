//
//  FourthCategoryViewController.h
//  ColoringBookSwift
//
//

#import <UIKit/UIKit.h>
#import "CanvasViewController.h"

@interface FourthCategoryViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,DrawingViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
