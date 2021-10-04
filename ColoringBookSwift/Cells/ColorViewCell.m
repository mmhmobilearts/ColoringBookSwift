//
//  ColorViewCell.m
//  ColoringBookSwift
//


#import "ColorViewCell.h"
#import "HexColors.h"


@implementation ColorViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
   
    self.colorPickerView=[[ColorPickerView alloc] initWithFrame:self.bounds];
    [self.contentView addSubview: self.colorPickerView];
    
   
}


-(void)updatePickerColors
{
    self.colorPickerView.firstButton.backgroundColor=[UIColor hx_colorWithHexString:[self.colorsHexCodeArray objectAtIndex:0]];
    self.colorPickerView.secondButton.backgroundColor=[UIColor hx_colorWithHexString:[self.colorsHexCodeArray objectAtIndex:1]];
    self.colorPickerView.thirdButton.backgroundColor=[UIColor hx_colorWithHexString:[self.colorsHexCodeArray objectAtIndex:2]];
    self.colorPickerView.fourthButton.backgroundColor=[UIColor hx_colorWithHexString:[self.colorsHexCodeArray objectAtIndex:3]];
    self.colorPickerView.fifthButton.backgroundColor=[UIColor hx_colorWithHexString:[self.colorsHexCodeArray objectAtIndex:4]];
    self.colorPickerView.sixthButton.backgroundColor=[UIColor hx_colorWithHexString:[self.colorsHexCodeArray objectAtIndex:5]];
    self.colorPickerView.seventhButton.backgroundColor=[UIColor hx_colorWithHexString:[self.colorsHexCodeArray objectAtIndex:6]];
    
}


@end
