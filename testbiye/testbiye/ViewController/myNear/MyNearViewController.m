//
//  MyNearViewController.m
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "MyNearViewController.h"
#import "MainViewCell.h"
#import "NearDetailViewController.h"
#import "NearCycleViewController.h"
#import "AppDelegate.h"

@interface MyNearViewController ()<MainViewCellDelegate>
{
    NSArray *nameArr;
    NSArray *iconArr;
}

@property(nonatomic,weak) IBOutlet UITableView *tabView;

@end

@implementation MyNearViewController

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
    
    self.titlelab.text = @"我 的 附 近";
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];
    
    nameArr = @[@"今日推荐",@"超值热购",@"最旺人气",
                @"活动秒杀",@"生活圈"];
    
    iconArr = @[@"nearicon1.png",@"nearicon2.png",@"nearicon3.png",
                @"nearicon4.png",@"nearicon5.png"];

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
    
    if (btn.tag == 4) {
        app.tabbar.hidden = YES;
        NearCycleViewController *cycle = [[NearCycleViewController alloc] init];
        [self.navigationController pushViewController:cycle animated:YES];
        return;
    }
    NearDetailViewController *detail = [[NearDetailViewController alloc] init];
    detail.type = btn.tag;
    [self.navigationController pushViewController:detail animated:YES];
    /*
    if (btn.tag == 0) {
        DayPlanViewController *plan = [[DayPlanViewController alloc] init];
        [self.navigationController pushViewController:plan animated:YES];
    } else if (btn.tag == 1) {
        DayAlertViewController *alert = [[DayAlertViewController alloc] init];
        [self.navigationController pushViewController:alert animated:YES];
        
    } else if (btn.tag == 2) {
        BuyPlanViewController *buy = [[BuyPlanViewController alloc] init];
        [self.navigationController pushViewController:buy animated:YES];
    } else if (btn.tag == 3) {
        
    } else if (btn.tag == 4) {
        
    }
    */
}
@end
