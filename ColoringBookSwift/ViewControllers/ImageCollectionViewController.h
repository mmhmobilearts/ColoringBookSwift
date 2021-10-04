//
//  ImageCollectionViewController.h
//  ColoringBookSwift
//


#import <UIKit/UIKit.h>
#import "CanvasViewController.h"

@interface ImageCollectionViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,DrawingViewDelegate>
//IAPControllerDelegate
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollectionView;
@end
