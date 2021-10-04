//
//  ColorPickerView.m
//  ColoringBookSwift
//


#import "ColorPickerView.h"

@implementation ColorPickerView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"ColorPickerView" owner:self options:nil];
        self.contentView.frame = self.bounds;
        [self addSubview: self.contentView];
        
        self.firstButton.layer.cornerRadius=self.firstButton.frame.size.width/2;
        self.secondButton.layer.cornerRadius=self.secondButton.frame.size.width/2;
        self.thirdButton.layer.cornerRadius=self.thirdButton.frame.size.width/2;
        self.fourthButton.layer.cornerRadius=self.fourthButton.frame.size.width/2;
        self.fifthButton.layer.cornerRadius=self.fifthButton.frame.size.width/2;
        self.sixthButton.layer.cornerRadius=self.sixthButton.frame.size.width/2;
        self.seventhButton.layer.cornerRadius=self.seventhButton.frame.size.width/2;
        
    }
    
    
    return self;
}

- (IBAction)colorButtonAction:(UIButton*)sender {
    if ([self.delegate respondsToSelector:@selector(didFinishPickingColor:)]) {
        [self.delegate didFinishPickingColor:sender.backgroundColor];
    }
   
}


@end
