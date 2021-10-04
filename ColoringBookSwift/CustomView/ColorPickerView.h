//
//  ColorPickerView.h
//  ColoringBookSwift
//


#import <UIKit/UIKit.h>

@protocol ColorPickerViewDelegate;

@interface ColorPickerView : UIView


@property (nonatomic, assign) id delegate;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;
@property (weak, nonatomic) IBOutlet UIButton *thirdButton;
@property (weak, nonatomic) IBOutlet UIButton *fourthButton;
@property (weak, nonatomic) IBOutlet UIButton *fifthButton;
@property (weak, nonatomic) IBOutlet UIButton *sixthButton;
@property (weak, nonatomic) IBOutlet UIButton *seventhButton;



@end

@protocol ColorPickerViewDelegate
- (void)didFinishPickingColor:(UIColor *)color;
@end
