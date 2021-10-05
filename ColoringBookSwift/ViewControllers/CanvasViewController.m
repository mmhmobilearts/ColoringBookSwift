//
//  CanvasViewController.m
//  ColoringBookSwift
//

//

#import "CanvasViewController.h"
#import "ColorViewCell.h"
#import "UIImage+FloodFill.h"
#import "HexColors.h"
#import "ColorCell.h"
#import "Constant.h"
#import "Stack.h"
#import "KSQueue.h"

@interface CanvasViewController ()
{
    NSArray *colorArray;
    UIImage *undoImage;
    UIImage *redoImage;
    Stack *undoStack;
    KSQueue *redoQueue;
    
}
@property int tolorance;
@property (strong, nonatomic)  UIColor *newcolor;
@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    
    undoStack = [[Stack alloc] init];
    redoQueue = [[KSQueue alloc] init];
    //NSLog(@"self.image %@",self.objectImage);
    //self.objectImage=[UIImage imageNamed:@"Blank_Map-Africa.png"];
    
    self.targetImageView.image=self.objectImage;
    
    self.tolorance=100;
    
    self.targetImageView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
    [self.targetImageView addGestureRecognizer:tapGesture];
 
    
    float minZoom = MIN(self.canvasScrollView.bounds.size.width / self.targetImageView.image.size.width, self.canvasScrollView.bounds.size.height / self.targetImageView.image.size.height);

    self.canvasScrollView.maximumZoomScale = 4.0;
    self.canvasScrollView.minimumZoomScale = minZoom;
    self.canvasScrollView.zoomScale = minZoom;
    
    self.canvasScrollView.contentSize = self.targetImageView.frame.size;
    self.canvasScrollView.delegate = self;
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UINib *nib = [UINib nibWithNibName:@"ColorCell" bundle:bundle];
    [self.colorPickerCollectionView registerNib:nib forCellWithReuseIdentifier:@"ColorCell"];
    
    // By turning off clipping, you'll see the prior and next items.
//    self.colorPickerCollectionView.clipsToBounds = YES;
    

    
    
    
    
    colorArray= [NSArray arrayWithObjects: @"641E16",@"78281F",@"512E5F",@"4A235A",@"154360",@"1B4F72",@"145A32",@"7D6608",@"784212",@"6E2C00",@"7B7D7D",@"A569BD",@"1B2631",@"58D68D",@"f9ebea",@"f2d7d5",@"e6b0aa",@"d98880",@"cd6155",@"c0392b",@"a93226",@"922b21",@"7b241c",@"641e16",@"fdedec",@"fadbd8",@"f5b7b1",@"f1948a",@"ec7063",@"e74c3c",@"cb4335",@"b03a2e",@"943126",@"78281f",@"f5eef8",@"ebdef0",@"d7bde2",@"c39bd3",@"af7ac5",@"9b59b6",@"884ea0",@"76448a",@"633974",@"512e5f",@"f4ecf7",@"e8daef",@"d2b4de",@"bb8fce",@"a569bd",@"8e44ad",@"7d3c98",@"6c3483",@"5b2c6f",@"4a235a",@"eaf2f8",@"d4e6f1",@"a9cce3",@"7fb3d5",@"5499c7",@"2980b9",@"2471a3",@"1f618d",@"1a5276",@"154360",@"ebf5fb",@"d6eaf8",@"aed6f1",@"85c1e9",@"5dade2",@"3498db",@"2e86c1",@"2874a6",@"21618c",@"1b4f72",@"e8f8f5",@"d1f2eb",@"a3e4d7",@"76d7c4",@"48c9b0",@"1abc9c",@"17a589",@"148f77",@"117864",@"0e6251",@"e8f6f3",@"d0ece7",@"a2d9ce",@"73c6b6",@"45b39d",@"16a085",@"138d75",@"117a65",@"0e6655",@"0b5345",@"e9f7ef",@"d4efdf",@"a9dfbf",@"7dcea0",@"52be80",@"27ae60",@"229954",@"1e8449",@"196f3d",@"145a32",@"eafaf1",@"d5f5e3",@"abebc6",@"82e0aa",@"58d68d",@"2ecc71",@"28b463",@"239b56",@"1d8348",@"186a3b",@"fef9e7",@"fcf3cf",@"f9e79f",@"f7dc6f",@"f4d03f",@"f1c40f",@"d4ac0d",@"b7950b",@"9a7d0a",@"7d6608",@"fef5e7",@"fdebd0",@"fad7a0",@"f8c471",@"f5b041",@"f39c12",@"d68910",@"b9770e",@"9c640c",@"7e5109",@"fdf2e9",@"fae5d3",@"f5cba7",@"f0b27a",@"eb984e",@"e67e22",@"ca6f1e",@"af601a",@"935116",@"784212",@"fbeee6",@"f6ddcc",@"edbb99",@"e59866",@"dc7633",@"d35400",@"ba4a00",@"a04000",@"873600",@"6e2c00",@"fdfefe",@"fbfcfc",@"f7f9f9",@"f4f6f7",@"f0f3f4",@"ecf0f1",@"d0d3d4",@"b3b6b7",@"979a9a",@"7b7d7d",@"f8f9f9",@"f2f3f4",@"e5e7e9",@"d7dbdd",@"cacfd2",@"bdc3c7",@"a6acaf",@"909497",@"797d7f",@"626567",@"f4f6f6",@"eaeded",@"d5dbdb",@"bfc9ca",@"aab7b8",@"95a5a6",@"839192",@"717d7e",@"5f6a6a",@"4d5656",@"f2f4f4",@"e5e8e8",@"ccd1d1",@"b2babb",@"99a3a4",@"7f8c8d",@"707b7c",@"616a6b",@"515a5a",@"424949",@"ebedef",@"d6dbdf",@"aeb6bf",@"85929e",@"5d6d7e",@"34495e",@"2e4053",@"283747",@"212f3c",@"1b2631",@"eaecee",@"d5d8dc",@"abb2b9",@"808b96",@"566573",@"2c3e50", nil];
    self.newcolor=[UIColor hx_colorWithHexString:colorArray[0]];
}

//Hide Status Bar
-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (IBAction)undoButtonPressed:(id)sender {
    undoImage = [undoStack popObject];
    if (undoImage) {
        [self.targetImageView setImage:undoImage];
    }
}
- (IBAction)redoButtonPressed:(id)sender {
    redoImage = [redoQueue dequeue];
    if (redoImage) {
        [self.targetImageView setImage:redoImage];
    }
}

- (void) imageTapped: (UITapGestureRecognizer *)recognizer
{
    
    CGPoint tpoint = [recognizer locationInView: self.targetImageView];
    NSLog(@"tpoint %f %f",tpoint.x,tpoint.y);
    
    
    UIImage *image1 = [self.targetImageView.image floodFillFromPoint:tpoint withColor:self.newcolor andTolerance:self.tolorance];
    [undoStack pushObject:self.targetImageView.image];
    
    dispatch_async(dispatch_get_main_queue(), ^(void)
                   {
                       if(image1){
                           [self.targetImageView setImage:image1];
                           [redoQueue enqueue:self.targetImageView.image];
                       }
                   });
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.targetImageView;
}



-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return colorArray.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ColorCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ColorCell" forIndexPath:indexPath];
    cell.layer.cornerRadius = cell.frame.size.width/2;
    cell.backgroundColor = [UIColor hx_colorWithHexString:colorArray[indexPath.row]];
    
    if (cell.selected) {
        cell.selectedImageView.hidden = NO;
    }else{
        cell.selectedImageView.hidden = YES;
    }
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.newcolor=[UIColor hx_colorWithHexString:colorArray[indexPath.row]];
}


-(void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ColorCell *datasetCell =(ColorCell *) [collectionView cellForItemAtIndexPath:indexPath];
    datasetCell.selectedImageView.hidden = YES;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = collectionView.frame.size.height;
    
    CGFloat cellHeight = (height)/2 -10;
    return CGSizeMake(cellHeight, cellHeight);
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)
collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{

    CGFloat height = collectionView.frame.size.height;
    CGFloat cellHeight = (height)/2 -10;

    NSLog(@"Cell Height: %f",cellHeight);
    return cellHeight/2 + 10;
}
- (IBAction)nextPalleteAction:(id)sender {
    
    CGSize cellSize = CGSizeMake(self.colorPickerCollectionView.frame.size.width, self.colorPickerCollectionView.frame.size.height);
    
    CGPoint contentOffset= self.colorPickerCollectionView.contentOffset;
    [self.colorPickerCollectionView scrollRectToVisible:CGRectMake(contentOffset.x+cellSize.width, contentOffset.y, cellSize.width, cellSize.height) animated:YES];

}

- (IBAction)previousPelleteAction:(id)sender {
    CGSize cellSize = CGSizeMake(self.colorPickerCollectionView.frame.size.width, self.colorPickerCollectionView.frame.size.height);
    
    CGPoint contentOffset= self.colorPickerCollectionView.contentOffset;
    [self.colorPickerCollectionView scrollRectToVisible:CGRectMake(contentOffset.x-cellSize.width, contentOffset.y, cellSize.width, cellSize.height) animated:YES];

}

-(void)didFinishPickingColor:(UIColor *)color
{
    self.newcolor=color;
}
- (IBAction)doneButtonAction:(id)sender {
  NSMutableArray *activityItems= [NSMutableArray arrayWithObjects:self.targetImageView.image, nil];
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        // handle completion here
        
        if ([self.delegate respondsToSelector:@selector(didFinishEditing:forSelectedIndex:)]) {
//            [self.delegate didFinishEditing:self.targetImageView.image forSelectedIndex:self.index];
//            self.targetImageView.image=nil;
        }
        
        
        
        

    }];
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewController.popoverPresentationController.sourceView = self.view;// so that iPads won't crash

    [self presentViewController:activityViewController animated:YES completion:nil];
    [activityViewController setCompletionHandler:^(NSString *act, BOOL done) {
        NSString *serviceMsg = nil;
        if (done){
             NSLog(@"Photo saved");//on deleting or saving draft it is returning true
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Save"
                                                              message:@"Success"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            [message show];
        } else{
           NSLog(@"Photo save cancel");
        }
        
        
        
    }];
//    [self dismissViewControllerAnimated:YES completion:nil];
    [CATransaction commit];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
