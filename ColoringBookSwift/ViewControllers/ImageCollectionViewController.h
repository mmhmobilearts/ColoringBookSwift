//
//  ImageCollectionViewController.h
//  ColoringBookSwift
//


#import <UIKit/UIKit.h>
#import "CanvasViewController.h"
#import "XLPagerTabStripViewController.h"
@interface ImageCollectionViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,DrawingViewDelegate,XLPagerTabStripChildItem>
//IAPControllerDelegate
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollectionView;
@end
