//
//  EditorViewController.m
//  ColoringBookSwift
//


#import "EditorViewController.h"
#import "MenuViewCell.h"

@interface EditorViewController ()
{
    NSMutableArray *menuList;
    
}

@end

@implementation EditorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     menuList=[[NSMutableArray alloc] initWithObjects:@"Camera",@"Drawing",@"Color",@"Brush",@"Sticker", nil];
    
    self.menuCollectionView.delegate=self;
    self.menuCollectionView.dataSource=self;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return menuList.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    MenuViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MenuCell" forIndexPath:indexPath];
    cell.menuName.text=[menuList objectAtIndex:indexPath.item];
    cell.menuIcon.image=[UIImage imageNamed:[menuList objectAtIndex:indexPath.item]];
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = CGRectGetHeight(collectionView.bounds);
    
    CGFloat cellSapceWidth = 3.0f;
//    CGFloat numberOfCellInRow = 3.0f;
//
//    CGFloat cellWidth = (width - cellSapceWidth) / numberOfCellInRow ;
    
    return CGSizeMake(height-cellSapceWidth, height-cellSapceWidth);
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.item == 0)
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
    else if(indexPath.item == 1)
    {
        
        
    }
//    else
//    {
//        CanvasViewController *editingViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"CanvasViewController"];
//        editingViewController.objectImage=[imageList objectAtIndex:indexPath.item];
//        editingViewController.index=indexPath;
//        editingViewController.delegate=self;
//        [self.navigationController pushViewController:editingViewController animated:YES];
//
//    }
}
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    [picker dismissViewControllerAnimated:YES completion:^{
        self.contentImageView.image = image;
    }];
    
}

- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)storeButtonAction:(id)sender {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
