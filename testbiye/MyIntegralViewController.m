//
//  MyIntegralViewController.m
//  testbiye
//
//  Created by qupengbin on 14-5-6.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "MyIntegralViewController.h"
#import "DaysScrollView.h"

@interface MyIntegralViewController ()
{
    DaysScrollView *_daysScroll;
}

@end

@implementation MyIntegralViewController

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
    self.titlelab.text = @"我 的 积 分";
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];
    
    _daysScroll = [[DaysScrollView alloc] initWithFrame:CGRectMake(0, 568-44-20-70-10, 320, 70)];
    [self.view addSubview:_daysScroll];

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
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
