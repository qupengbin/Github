//
//  MyIntegralViewController.m
//  testbiye
//
//  Created by qupengbin on 14-5-6.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "MyIntegralViewController.h"
#import "DaysScrollView.h"
#import "ChangeScrollView.h"
#import "MHFileTool.h"

@interface MyIntegralViewController ()<DaysScrollViewDelegate,ChangeScrollViewDelegate>
{
    NSArray *allData;
    DaysScrollView *_daysScroll;
    ChangeScrollView *_changeScroll;
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
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[MHFileTool getResourcesFile:@"datasource.plist"]];
    allData = [dict objectForKey:@"dayplan"];

    _daysScroll = [[DaysScrollView alloc] initWithFrame:CGRectMake(0, 568-44-20-70-10, 320, 70)];
    _daysScroll.delegate = self;
    [self.view addSubview:_daysScroll];
    
    _changeScroll = [[ChangeScrollView alloc] initWithFrame:CGRectMake(0, 245 , 320, 177)];
    _changeScroll.delegate = self;
    [_changeScroll reloadData:allData icon:@"myintegralicon.png" type:2];
    [self.view addSubview:_changeScroll];
    
    [self daysScrollViewSelectIndex:1];
    [self changeScrollViewIndex:1];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DaysScrollViewDelegate
- (void)daysScrollViewSelectIndex:(int)index
{
    [_changeScroll changeViewToIndex:index];
}

#pragma mark - ChangeScrollViewDelegate
- (void)changeScrollViewIndex:(int)index
{
    [_daysScroll changeDaysToIndex:index];
}

#pragma mark - BtnAction
- (void)backBtnAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
