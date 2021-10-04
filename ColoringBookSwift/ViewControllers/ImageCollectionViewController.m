//
//  ImageCollectionViewController.m
//  ColoringBookSwift
//


#import "XLPagerTabStripViewController.h"
#import "ImageCollectionViewController.h"
#import "CategoryCell.h"
#import "ImageCollectionViewCell.h"
#import "Constant.h"

@interface ImageCollectionViewController () <XLPagerTabStripChildItem>
{
    
    NSMutableArray* categoryList;
    NSMutableArray* imageList;
    NSArray *filesList;
}

@end

@implementation ImageCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageCollectionView.delegate=self;
    self.imageCollectionView.dataSource=self;
    
    
    [self loadImages];
}


#pragma mark - XLPagerTabStripViewControllerDelegate

-(NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return FIRST_CATEGORY;
}

-(UIColor *)colorForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return [UIColor whiteColor];
}

-(void)loadImages
{
    NSString *filePath;
    categoryList=[[NSMutableArray alloc] init];
    imageList=[[NSMutableArray alloc] init];
  //  NSString *stringPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:[NSString stringWithFormat:@"/Images/Sample"]];
    
    NSString *stringPath =[ [[NSBundle mainBundle ] bundlePath] stringByAppendingPathComponent:@"/Animal/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    
//    if([fileManager fileExistsAtPath:stringPath]){
//        NSLog(@"exist");
//
//    }
    
    filesList = [fileManager contentsOfDirectoryAtPath:stringPath error:&error];
    //NSLog(@"stringPath: %@", filesList);
    
    for (NSString *pathStr in filesList){
        filePath = [NSString stringWithFormat:@"%@/%@", stringPath, pathStr];
        
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        [imageList addObject:image];
        
        [categoryList addObject:filePath.lastPathComponent];
    }
    [self.imageCollectionView reloadData];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        return imageList.count;
    
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

        ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
        cell.contentImageView.image=[imageList objectAtIndex:indexPath.item];
        return cell;
    
    
  
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = CGRectGetWidth(collectionView.bounds);
        CGFloat cellSapceWidth = 3.0f;
        CGFloat numberOfCellInRow = 2.0f;
        
    CGFloat cellHeight = (width - cellSapceWidth) / numberOfCellInRow ;
    CGFloat cellWidth = self.imageCollectionView.frame.size.width - 4;
    
    return CGSizeMake(cellWidth, cellHeight);
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CanvasViewController *editingViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"CanvasViewController"];
    editingViewController.objectImage=[imageList objectAtIndex:indexPath.item];
    editingViewController.index=indexPath;
    editingViewController.delegate=self;
    //        [self.navigationController pushViewController:editingViewController animated:YES];
    
    [self presentViewController:editingViewController animated:YES completion:nil];

}

-(void)didFinishEditing:(UIImage *)image forSelectedIndex:(NSIndexPath *)indexPath
{
    [imageList replaceObjectAtIndex:indexPath.item withObject:image];
    [self.imageCollectionView reloadData];
}

//- (IBAction)OpenInAppPurchaseStore:(id)sender {
//    IAPController *iapVC = [[IAPController alloc]initWithNibName:@"IAPController" bundle:nil];
//    [self presentViewController: iapVC animated:true completion:nil];
//}
//
//- (IBAction)backButtonAction:(id)sender {
//    [self.navigationController popViewControllerAnimated:YES];
//}

//if needed
//-(void)inAppScreenClosed
//{
//    //refresh data after in app purchase
//
//}

@end
