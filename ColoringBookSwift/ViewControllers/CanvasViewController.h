//
//  CanvasViewController.h
//  ColoringBookSwift
//


#import <UIKit/UIKit.h>
#import "ColorPickerView.h"

@protocol DrawingViewDelegate;

@interface CanvasViewController : UIViewController<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,ColorPickerViewDelegate>

@property (nonatomic, assign) id delegate;
@property (weak, nonatomic) UIImage *objectImage;
@property (weak, nonatomic) NSIndexPath *index;
@property (weak, nonatomic) NSString *pigmentType;

@property (weak, nonatomic) IBOutlet UIScrollView *canvasScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *targetImageView;
@property (weak, nonatomic) IBOutlet UICollectionView *colorPickerCollectionView;


@end

@protocol DrawingViewDelegate
- (void)didFinishEditing:(UIImage *)image forSelectedIndex:(NSIndexPath*)indexPath;

@end
