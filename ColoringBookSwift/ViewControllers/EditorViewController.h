//
//  EditorViewController.h
//  ColoringBookSwift
//


#import <UIKit/UIKit.h>
@interface EditorViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
@property (weak, nonatomic) IBOutlet UICollectionView *menuCollectionView;
@end
