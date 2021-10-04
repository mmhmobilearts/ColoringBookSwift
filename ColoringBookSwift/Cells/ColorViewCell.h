//
//  ColorViewCell.h
//  ColoringBookSwift
//


#import <UIKit/UIKit.h>
#import "ColorPickerView.h"

@interface ColorViewCell : UICollectionViewCell

@property (strong, nonatomic) ColorPickerView *colorPickerView;
@property (strong, nonatomic) NSArray *colorsHexCodeArray;

-(void)updatePickerColors;

@end
