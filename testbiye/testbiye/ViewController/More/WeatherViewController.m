//
//  WeatherViewController.m
//  testbiye
//
//  Created by qu on 14-5-4.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "WeatherViewController.h"
#import "MHFileTool.h"

@protocol WeatherViewDelegate <NSObject>
@optional

- (void)selectWeatherIndex:(NSInteger)index;

@end

@interface WeatherView()
{
    UILabel *daylab;
    UIImageView *iconimg;
    UILabel *minlab;
    
    UIImageView *line1;
    UIImageView *line2;
    
    UIButton *btn;
}

@property(nonatomic,assign) id<WeatherViewDelegate> delegate;

- (void)reloadViewData:(NSDictionary *)dict index:(int)index;

@end

@implementation WeatherView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initview];
    }
    return self;
}

- (void)initview
{
    float w = self.frame.size.width;
    float h = self.frame.size.height;
    
    daylab = [[UILabel alloc] initWithFrame:CGRectMake((w-30)/2, 5, 30, 20)];
    daylab.textColor = [UIColor whiteColor];
    daylab.backgroundColor = [UIColor clearColor];
    daylab.font = [UIFont systemFontOfSize:10.0f];
    daylab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:daylab];
    
    line1 =[[UIImageView alloc] initWithFrame:CGRectMake((w-30)/2, 5+20, 30, 0.5f)];
    line1.backgroundColor = [UIColor whiteColor];
    [self addSubview:line1];
    
    iconimg = [[UIImageView alloc] initWithFrame:CGRectMake((w-30)/2, 25, 30, 30)];
    [self addSubview:iconimg];
    
    minlab = [[UILabel alloc] initWithFrame:CGRectMake((w-30)/2, 25+30, 30, 20)];
    minlab.textColor = [UIColor whiteColor];
    minlab.backgroundColor = [UIColor clearColor];
    minlab.font = [UIFont systemFontOfSize:12.0f];
    minlab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:minlab];
    
    line2 =[[UIImageView alloc] initWithFrame:CGRectMake(w-0.5, 0, 0.5, h)];
    line2.backgroundColor = [UIColor whiteColor];
    [self addSubview:line2];
    
    btn = [[UIButton alloc] initWithFrame:self.bounds];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}

- (void)reloadViewData:(NSDictionary *)dict index:(int)index
{
    daylab.text = [dict objectForKey:@"day"];
    iconimg.image = [UIImage imageNamed:[dict objectForKey:@"icon"]];
    minlab.text = [dict objectForKey:@"min"];
    btn.tag = index;
}

- (void)btnAction:(id)sender
{
    UIButton *_btn = (UIButton *)sender;
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectWeatherIndex:)]) {
        [self.delegate selectWeatherIndex:_btn.tag];
    }
}

@end

@interface WeatherViewController ()<UIScrollViewDelegate,WeatherViewDelegate>
{
    NSArray *dataArr;
}

@property(nonatomic,weak) IBOutlet UILabel *daylab; //星期
@property(nonatomic,weak) IBOutlet UILabel *momlab; //日月
@property(nonatomic,weak) IBOutlet UILabel *temperature; //温度
@property(nonatomic,weak) IBOutlet UILabel *air; //空气指数
@property(nonatomic,weak) IBOutlet UILabel *shidu; //湿度
@property(nonatomic,weak) IBOutlet UILabel *ziwai; //紫外线

@property(nonatomic,weak) IBOutlet UIImageView *icon; //图片

@property(nonatomic,weak) IBOutlet UIScrollView *scroll;

@end

@implementation WeatherViewController

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
    
    self.titlelab.text = @"今 日 天 气";
    
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];

    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[MHFileTool getResourcesFile:@"datasource.plist"]];
    dataArr = [dict objectForKey:@"weather"];

    float distance = 320/5;
    
    for (int i = 0; i < dataArr.count; i++) {
        WeatherView *view = [[WeatherView alloc] initWithFrame:CGRectMake(distance*i, 0, distance, 79)];
        view.delegate = self;
        [self.scroll addSubview:view];
        [view reloadViewData:[dataArr objectAtIndex:i] index:i];
    }
    self.scroll.contentSize = CGSizeMake(distance*dataArr.count, 79);
    
    [self showIconAnimation];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showIconAnimation
{
    self.icon.frame = CGRectMake(151, 91, 19, 17);
    
    [UIView animateWithDuration:0.8f animations:^{
        
        self.icon.frame = CGRectMake(123, 61, 74, 67);
        
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - BtnAction
- (void)backBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - WeatherViewDelegate
- (void)selectWeatherIndex:(NSInteger)index
{
    NSDictionary *dict = [dataArr objectAtIndex:index];
    
    self.daylab.text = [dict objectForKey:@"day"];
    self.momlab.text = [dict objectForKey:@"mom"];
    self.temperature.text = [dict objectForKey:@"max"];
    self.air.text = [dict objectForKey:@"air"];
    self.shidu.text = [dict objectForKey:@"shidu"];
    self.ziwai.text = [dict objectForKey:@"ziwai"];
    self.icon.image = [UIImage imageNamed:[dict objectForKey:@"icon"]];
    
    [self showIconAnimation];
}
@end
