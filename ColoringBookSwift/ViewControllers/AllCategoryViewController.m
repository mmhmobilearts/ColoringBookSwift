//
//  AllCategoryViewController.m
//  ColoringBookSwift
//

#import "AllCategoryViewController.h"
#import "Cell.h"
#import "Constant.h"
#import "CanvasViewController.h"

@interface AllCategoryViewController () {
    NSMutableArray *imageListForAnime, *imageListForAnimal, *imageListForBarbie, *imageListForMandala, *imageListForSanta;
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *animeCollectionViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *animalCollectionVIewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *barbieCollectionVIewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mandalaCollectionVIewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *santaCollectionVIewHeight;

@end

@implementation AllCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self loadImagesForAnime];
    [self loadImagesForAnimal];
    [self loadImagesForSanta];
    [self loadImagesForBarbie];
    [self loadImagesForMandala];
    [self loadImagesForSanta];
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        self.animeCollectionViewHeight.constant = 250;
        self.animalCollectionVIewHeight.constant = 250;
        self.barbieCollectionVIewHeight.constant = 250;
        self.mandalaCollectionVIewHeight.constant = 250;
        self.santaCollectionVIewHeight.constant = 250;
        
    }
}

-(void)setup {
    UINib *nib = [UINib nibWithNibName:@"Cell" bundle:nil];
    [self.animalCollectionView registerNib:nib forCellWithReuseIdentifier:@"Cell"];
    [self.animeCollectionView registerNib:nib forCellWithReuseIdentifier:@"Cell"];
    [self.barbieCollectionView registerNib:nib forCellWithReuseIdentifier:@"Cell"];
    [self.mandalaCollectionVIew registerNib:nib forCellWithReuseIdentifier:@"Cell"];
    [self.santaCollectionView registerNib:nib forCellWithReuseIdentifier:@"Cell"];

}

-(void)loadImagesForAnime
{
    NSString *filePath;
    imageListForAnime=[[NSMutableArray alloc] init];
    
    NSString *stringPath =[ [[NSBundle mainBundle ] bundlePath] stringByAppendingPathComponent:@"/Anime/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    
    NSArray *filesList = [fileManager contentsOfDirectoryAtPath:stringPath error:&error];
    
    for (NSString *pathStr in filesList){
        filePath = [NSString stringWithFormat:@"%@/Anime_%@", stringPath, pathStr];
        
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        [imageListForAnime addObject:image];
        
    }
    [self.animeCollectionView reloadData];
    
}

-(void)loadImagesForAnimal
{
    NSString *filePath;
    imageListForAnimal=[[NSMutableArray alloc] init];
    
    NSString *stringPath =[ [[NSBundle mainBundle ] bundlePath] stringByAppendingPathComponent:@"/Animal/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    
    NSArray *filesList = [fileManager contentsOfDirectoryAtPath:stringPath error:&error];
    
    for (NSString *pathStr in filesList){
        filePath = [NSString stringWithFormat:@"%@/Animal_%@", stringPath, pathStr];
        
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        [imageListForAnimal addObject:image];
        
    }
    [self.animalCollectionView reloadData];
    
}

-(void)loadImagesForBarbie
{
    NSString *filePath;
    imageListForBarbie=[[NSMutableArray alloc] init];
    
    NSString *stringPath =[ [[NSBundle mainBundle ] bundlePath] stringByAppendingPathComponent:@"/Barbie Doll/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    
    NSArray *filesList = [fileManager contentsOfDirectoryAtPath:stringPath error:&error];
    
    for (NSString *pathStr in filesList){
        filePath = [NSString stringWithFormat:@"%@/Barbie_Doll_%@", stringPath, pathStr];
        
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        [imageListForBarbie addObject:image];
        
    }
    [self.barbieCollectionView reloadData];
    
}

-(void)loadImagesForMandala
{
    NSString *filePath;
    imageListForMandala=[[NSMutableArray alloc] init];
    
    NSString *stringPath =[ [[NSBundle mainBundle ] bundlePath] stringByAppendingPathComponent:@"/Mandala/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    
    NSArray *filesList = [fileManager contentsOfDirectoryAtPath:stringPath error:&error];
    
    for (NSString *pathStr in filesList){
        filePath = [NSString stringWithFormat:@"%@/Mandala_%@", stringPath, pathStr];
        
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        [imageListForMandala addObject:image];
        
    }
    [self.mandalaCollectionVIew reloadData];
    
}

-(void)loadImagesForSanta
{
    NSString *filePath;
    imageListForSanta=[[NSMutableArray alloc] init];
    
    NSString *stringPath =[ [[NSBundle mainBundle ] bundlePath] stringByAppendingPathComponent:@"/Santa Clous/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    
    NSArray *filesList = [fileManager contentsOfDirectoryAtPath:stringPath error:&error];
    
    for (NSString *pathStr in filesList){
        filePath = [NSString stringWithFormat:@"%@/Santa_Clous_%@", stringPath, pathStr];
        
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        [imageListForSanta addObject:image];
        
    }
    [self.santaCollectionView reloadData];
    
}

- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark: - UICollectionView Delegate & DataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView == self.animeCollectionView) {
        return imageListForAnime.count;
    }else if (collectionView == self.animalCollectionView) {
        return imageListForAnimal.count;
    }else if (collectionView == self.barbieCollectionView) {
        return imageListForBarbie.count;
    }else if (collectionView == self.mandalaCollectionVIew) {
        return imageListForMandala.count;
    }else {
        return imageListForSanta.count;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    if (collectionView == self.animeCollectionView) {
        cell.CellImageView.image = [imageListForAnime objectAtIndex:indexPath.item];
    }else if (collectionView == self.animalCollectionView) {
        cell.CellImageView.image = [imageListForAnimal objectAtIndex:indexPath.item];
    }else if (collectionView == self.barbieCollectionView) {
        cell.CellImageView.image = [imageListForBarbie objectAtIndex:indexPath.item];
    }else if (collectionView == self.mandalaCollectionVIew) {
        cell.CellImageView.image = [imageListForMandala objectAtIndex:indexPath.item];
    }else if (collectionView == self.santaCollectionView) {
        cell.CellImageView.image = [imageListForSanta objectAtIndex:indexPath.item];
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellWidth = collectionView.frame.size.height - 4;
    
    return CGSizeMake(cellWidth, cellWidth);
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (collectionView == self.animalCollectionView) {
        [self goTOCanvasViewController:[imageListForAnimal objectAtIndex:indexPath.item] selectedIndex:indexPath andType:@"Animal"];
    }else if (collectionView == self.animeCollectionView) {
        [self goTOCanvasViewController:[imageListForAnime objectAtIndex:indexPath.item] selectedIndex:indexPath andType:@"Anime"];
    }else if (collectionView == self.barbieCollectionView) {
        [self goTOCanvasViewController:[imageListForBarbie objectAtIndex:indexPath.item] selectedIndex:indexPath andType:@"Barbie"];
    }else if (collectionView == self.mandalaCollectionVIew) {
        [self goTOCanvasViewController:[imageListForMandala objectAtIndex:indexPath.item] selectedIndex:indexPath andType:@"Mandala"];
    }else if (collectionView == self.santaCollectionView) {
        [self goTOCanvasViewController:[imageListForSanta objectAtIndex:indexPath.item] selectedIndex:indexPath andType:@"Santa"];
    }

}

-(void)goTOCanvasViewController:(UIImage *)image selectedIndex:(NSIndexPath *)indexPath andType:(NSString *)type{
    CanvasViewController *editingViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"CanvasViewController"];
    editingViewController.objectImage=image;
    editingViewController.index=indexPath;
    editingViewController.pigmentType = type;
    editingViewController.delegate=self;
    //    [self.navigationController pushViewController:editingViewController animated:YES];
    [self presentViewController:editingViewController animated:YES completion:nil];
}
@end
