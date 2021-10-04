//
//  FivthCategoryViewController.m
//  ColoringBookSwift
//

#import "XLPagerTabStripViewController.h"
#import "FifthCategoryViewController.h"
#import "Cell.h"
#import "Constant.h"

@interface FifthCategoryViewController () <XLPagerTabStripChildItem>
{
    NSMutableArray* imageList;
    NSArray *filesList;
}

@end

@implementation FifthCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
    [self loadImages];
}

-(void)setup {
    UINib *nib = [UINib nibWithNibName:@"Cell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"Cell"];
}


#pragma mark - XLPagerTabStripViewControllerDelegate

-(NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return FIFTH_CATEGORY;
}

-(UIColor *)colorForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return [UIColor whiteColor];
}

-(void)loadImages
{
    NSString *filePath;
    imageList=[[NSMutableArray alloc] init];
    
    NSString *stringPath =[ [[NSBundle mainBundle ] bundlePath] stringByAppendingPathComponent:@"/Santa Clous/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    
    filesList = [fileManager contentsOfDirectoryAtPath:stringPath error:&error];
    
    for (NSString *pathStr in filesList){
        filePath = [NSString stringWithFormat:@"%@/%@", stringPath, pathStr];
        
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        [imageList addObject:image];
        
    }
    [self.collectionView reloadData];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return imageList.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.CellImageView.image = [imageList objectAtIndex:indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = CGRectGetWidth(collectionView.bounds);
    
    CGFloat cellSapceWidth = 3.0f;
    CGFloat numberOfCellInRow = 2.0f;
    
    CGFloat cellHeight = (width - cellSapceWidth) / numberOfCellInRow ;
    CGFloat cellWidth = self.collectionView.frame.size.width - 4;
    
    return CGSizeMake(cellWidth, cellHeight);
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CanvasViewController *editingViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"CanvasViewController"];
    editingViewController.objectImage=[imageList objectAtIndex:indexPath.item];
    editingViewController.index=indexPath;
    editingViewController.delegate=self;
    //    [self.navigationController pushViewController:editingViewController animated:YES];
    [self presentViewController:editingViewController animated:YES completion:nil];
}

-(void)didFinishEditing:(UIImage *)image forSelectedIndex:(NSIndexPath *)indexPath
{
    [imageList replaceObjectAtIndex:indexPath.item withObject:image];
    [self.collectionView reloadData];
}
@end
