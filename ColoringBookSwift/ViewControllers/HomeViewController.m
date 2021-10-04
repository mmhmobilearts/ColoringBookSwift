//
//  HomeViewController.m
//  ColoringBookSwift
//


#import "HomeViewController.h"
#import "AllCategoryViewController.h"
#import "Constant.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *pigmentButton;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupButton];
}


-(void)setupButton{
    self.pigmentButton.layer.cornerRadius = 8;
    
    [self.pigmentButton.layer setShadowOffset:CGSizeMake(5, 5)];
    [self.pigmentButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.pigmentButton.layer setShadowOpacity:0.5];
}

- (IBAction)pigmentButtonPressed:(id)sender
{
    AllCategoryViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"AllCategoryViewController"];
    
   [self.navigationController presentViewController:controller animated:YES completion:nil];
}

@end
