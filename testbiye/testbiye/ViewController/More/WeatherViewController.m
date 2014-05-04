//
//  WeatherViewController.m
//  testbiye
//
//  Created by qu on 14-5-4.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "WeatherViewController.h"

@interface WeatherViewController ()<UIScrollViewDelegate>

@property(nonatomic,weak) IBOutlet UILabel *daylab; //星期
@property(nonatomic,weak) IBOutlet UILabel *momlab; //日月
@property(nonatomic,weak) IBOutlet UILabel *temperature; //温度

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

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - BtnAction
- (void)backBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
