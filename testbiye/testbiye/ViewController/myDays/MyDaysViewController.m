//
//  MyDaysViewController.m
//  testbiye
//
//  Created by qu on 14-5-1.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "MyDaysViewController.h"
#import "DayPlanViewController.h"
#import "DayAlertViewController.h"
#import "BuyPlanViewController.h"
#import "MainViewCell.h"
#import "YudingViewController.h"
#import "MyIndentViewController.h"

@interface MyDaysViewController ()<UITableViewDelegate,UITableViewDataSource,MainViewCellDelegate>
{
    NSArray *nameArr;
    NSArray *iconArr;
}

@property(nonatomic,weak) IBOutlet UITableView *tabView;

@end

@implementation MyDaysViewController

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
    
    self.titlelab.text = @"我 的 一 天";
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];

    nameArr = @[@"日程安排",@"活动提醒",
                @"购物计划",@"添加"];
    
    iconArr = @[@"mydayicon1.png",@"mydayicon2.png",
                @"mydayicon4.png",@"mydayicon5.png"];

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
    return 2;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130.0f;
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
    [cell reloadData:nameArr icon:iconArr index:indexPath.row type:3];
    return cell;
}

#pragma mark - MainViewCellDelegate
- (void)iconBtnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if (btn.tag == 0) {
        DayPlanViewController *plan = [[DayPlanViewController alloc] init];
        [self.navigationController pushViewController:plan animated:YES];
    } else if (btn.tag == 1) {
        DayAlertViewController *alert = [[DayAlertViewController alloc] init];
        [self.navigationController pushViewController:alert animated:YES];
        
    } else if (btn.tag == 2) {
//        MyIndentViewController *yuding = [[MyIndentViewController alloc] init];
//        yuding.type = 2;
//        [self.navigationController pushViewController:yuding animated:YES];
        
        BuyPlanViewController *buy = [[BuyPlanViewController alloc] init];
        [self.navigationController pushViewController:buy animated:YES];

    } else if (btn.tag == 3) {
//        BuyPlanViewController *buy = [[BuyPlanViewController alloc] init];
//        [self.navigationController pushViewController:buy animated:YES];

    } else if (btn.tag == 4) {
        
    }
    
}

@end
