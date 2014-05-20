//
//  MapViewController.m
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "MapViewController.h"
#import "MMSpinImageView.h"

@interface MapViewController () <UIScrollViewDelegate,MMSpinImageViewDelegate>
{
    UIImageView *_mapImg;
}

//@property(nonatomic,weak) IBOutlet UIScrollView *scroll;
@property (nonatomic, strong) MMSpinImageView *imageView;

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];
    
    self.titlelab.text = @"乐 行 地 图";

    /*
    self.scroll.minimumZoomScale = 1.0f;
    self.scroll.maximumZoomScale = 50.0f;

    UIImage *image = [UIImage imageNamed:@"comm_default.jpg"];
    float scale = image.size.width/image.size.height;
    float h = 320/scale;
    _mapImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, (504-h)/2, 320, h)];
    _mapImg.image = image;
    [self.scroll addSubview:_mapImg];
     */
    
    self.imageView = [[MMSpinImageView alloc] initWithFrame:CGRectMake(0, 100, 320, 320)];
    self.imageView.delegate = self;
    [self.view addSubview:self.imageView];
    
    [self actionFile];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)actionFile
{
    [self.imageView loadDataFromZip:[[NSBundle mainBundle].resourcePath stringByAppendingString:@"/car.zip"]];
}

#pragma mark - BtnAction
- (void)backBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UIScrollView delegate methods
- (float)getZoomScale:(UIScrollView *)scrollView
{
    float imageWidth = _mapImg.frame.size.width;
    float scrollWidth = scrollView.contentSize.width;
    return scrollWidth/imageWidth;
}

//实现图片的缩放
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _mapImg;
}

//实现图片在缩放过程中居中
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?(scrollView.bounds.size.width - scrollView.contentSize.width)/2 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?(scrollView.bounds.size.height - scrollView.contentSize.height)/2 : 0.0;
    _mapImg.center = CGPointMake(scrollView.contentSize.width/2 + offsetX,scrollView.contentSize.height/2 + offsetY);
}

@end
