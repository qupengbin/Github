//
//  MoreViewController.m
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "MoreViewController.h"
#import "MainViewCell.h"
#import "PrintViewController.h"
#import "MapViewController.h"
#import "HistoryViewController.h"
#import "WeatherViewController.h"
#import "ShareViewController.h"

@interface MoreViewController ()<MainViewCellDelegate,UITableViewDelegate,UITableViewDataSource,ShareViewDelegate>
{
    NSArray *nameArr;
    NSArray *iconArr;
    
    ShareViewController *shareView;
}

@property(nonatomic,weak) IBOutlet UITableView *tabView;

@end

@implementation MoreViewController

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
    self.titlelab.text = @"更 多 服 务";
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];
    
    nameArr = @[@"快照打印",@"公共厕所",@"IC充值点",
                @"浏览历史",@"今日天气",@"分享给好友",
                @"人工服务"];
    
    iconArr = @[@"moreicon1.png",@"moreicon2.png",@"moreicon3.png",
                @"moreicon5.png",@"moreicon5.png",@"moreicon6.png",
                @"moreicon7.png"];
    

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

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"myDaysCell";
    MainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[MainViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    [cell reloadData:nameArr icon:iconArr index:indexPath.row];
    return cell;
}

#pragma mark - MainViewCellDelegate
- (void)iconBtnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;    
     if (btn.tag == 0) {
         PrintViewController *print = [[PrintViewController alloc] init];
         [self.navigationController pushViewController:print animated:YES];
     } else if (btn.tag == 1) {
         MapViewController *map =[[MapViewController alloc] init];
         [self.navigationController pushViewController:map animated:YES];
     } else if (btn.tag == 2) {
         MapViewController *map =[[MapViewController alloc] init];
         [self.navigationController pushViewController:map animated:YES];
     } else if (btn.tag == 3) {
         HistoryViewController *map =[[HistoryViewController alloc] init];
         [self.navigationController pushViewController:map animated:YES];
     } else if (btn.tag == 4) {
         WeatherViewController *map =[[WeatherViewController alloc] init];
         [self.navigationController pushViewController:map animated:YES];
     } else if (btn.tag == 5) {
         if (shareView == nil) {
             shareView = [[ShareViewController alloc] init];
             shareView.delegate = self;
         }
         [self.view addSubview:shareView.view];

     } else if (btn.tag == 6) {
         MapViewController *map =[[MapViewController alloc] init];
         [self.navigationController pushViewController:map animated:YES];
     }
}

- (void)shareCancleAction
{
    if (shareView) {
        [shareView.view removeFromSuperview];
        shareView = nil;
    }
}

@end
