//
//  MainViewController.m
//  ColoringBookSwift
//


#import "MainViewController.h"
#import "ImageCollectionViewController.h"
#import "SecondCategoryViewController.h"
#import "ThirdCategoryViewController.h"
#import "FourthCategoryViewController.h"
#import "FifthCategoryViewController.h"
#import "Constant.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonBarView.shouldCellsFillAvailableWidth = YES;
    self.isProgressiveIndicator = YES;
    // Do any additional setup after loading the view.
    self.buttonBarView.labelFont = [UIFont boldSystemFontOfSize:16];
    self.buttonBarView.selectedBarHeight = 2.0;
    //Category Name color
    self.buttonBarView.selectedBar.backgroundColor = [UIColor colorWithRed:37/255 green:111/255 blue:206/255 alpha:1.0];
    //Category Name color
    self.buttonBarView.backgroundColor = [UIColor colorWithRed:7/255.0 green:185/255.0 blue:155/255.0 alpha:1.0];
    self.changeCurrentIndexProgressiveBlock = ^void(XLButtonBarViewCell *oldCell, XLButtonBarViewCell *newCell, CGFloat progressPercentage, BOOL changeCurrentIndex, BOOL animated){
        if (changeCurrentIndex) {
            [oldCell.label setTextColor:[UIColor colorWithWhite:1 alpha:0.6]];
            [newCell.label setTextColor:[UIColor whiteColor]];

            if (animated) {
                [UIView animateWithDuration:0.1
                                 animations:^(){
                                     newCell.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                     oldCell.transform = CGAffineTransformMakeScale(0.8, 0.8);
                                 }
                                 completion:nil];
            }
            else{
                newCell.transform = CGAffineTransformMakeScale(1.0, 1.0);
                oldCell.transform = CGAffineTransformMakeScale(0.8, 0.8);
            }
        }
    };
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}
#pragma mark - XLPagerTabStripViewControllerDataSource

-(NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    ImageCollectionViewController *first=[self.storyboard instantiateViewControllerWithIdentifier:@"ImageCollectionViewController"];
    
    SecondCategoryViewController *second=[self.storyboard instantiateViewControllerWithIdentifier:@"SecondCategoryViewController"];
    
    ThirdCategoryViewController *third=[self.storyboard instantiateViewControllerWithIdentifier:@"ThirdCategoryViewController"];
    
    FourthCategoryViewController *fourth=[self.storyboard instantiateViewControllerWithIdentifier:@"FourthCategoryViewController"];
    
    FifthCategoryViewController *fifth=[self.storyboard instantiateViewControllerWithIdentifier:@"FifthCategoryViewController"];
    
    
    return @[first, second, third, fourth, fifth];
    
}

//IBActions
- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
