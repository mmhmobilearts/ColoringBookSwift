//
//  CategoryCell.h
//  ColoringBookSwift
//


#import <UIKit/UIKit.h>

@interface CategoryCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *categoryImageView;
@property (weak, nonatomic) IBOutlet UILabel *categoryName;
@end
