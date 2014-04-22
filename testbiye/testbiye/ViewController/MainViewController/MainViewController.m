//
//  MainViewController.m
//  testbiye
//
//  Created by qupengbin on 14-4-16.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "MainViewController.h"
#import "BuyViewController.h"
#import "AppDelegate.h"
#import "MenuViewController.h"
#import "CycleScrollView.h"
#import "MainViewCell.h"

@interface MainViewController () <UITableViewDelegate,UITableViewDataSource,CycleScrollViewDelegate,MainViewCellDelegate>
{
    UIButton *_touchBtn;
    UITableView *_tableView;
    
    NSArray *nameArr;
    
    CycleScrollView *_topScrollView;
}

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"MainView";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    nameArr = @[@"乐行购物",@"乐行餐饮",@"乐行路线",
                @"我的一天",@"我的附近",@"小伙伴去哪",
                @"乐行闹铃",@"运动健身",@"更多服务",];
    
    [self leftItem:[UIImage imageNamed:@"default_avatar.png"] sel:@selector(menuAction:)];
    [self rightItem:[UIImage imageNamed:@"default_avatar.png"] sel:@selector(searchAction:)];
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((320-100)/2, (self.view.bounds.size.height-100)/2, 100, 100)];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSMutableArray *namearr = [[NSMutableArray alloc] init];
    for (int i = 0; i<3; i++) {
        [arr addObject:@"comm_default.png"];
        [namearr addObject:@"test"];
    }
    
    _topScrollView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 120) cycleDirection:CycleDirectionLandscape pictures:arr titles:namearr];
    _topScrollView.delegate = self;
    [self.view addSubview:_topScrollView];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, 320, self.view.bounds.size.height-120) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UIButtonAction
- (void)searchAction:(id)sender
{
    
}

- (void)menuAction:(id)sender
{
    MHNavViewController *nav = (MHNavViewController *)self.navigationController;
    [nav.drawer open];
}

- (void)buttonAction:(id)sender
{
    BuyViewController *buy = [[BuyViewController alloc] init];
    [self.navigationController pushViewController:buy animated:YES];
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"MainViewCell";
    MainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[MainViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.delegate = self;
    }
    [cell reloadData:nameArr index:indexPath.row];
    return cell;
}
#pragma mark - MainViewCellDelegate
- (void)iconBtnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if (btn.tag == 0) {
        //购物
        BuyViewController *buyView = [[BuyViewController alloc] init];
        buyView.view.backgroundColor = [UIColor clearColor];
        [self.navigationController pushViewController:buyView animated:YES];
    } else if (btn.tag == 1) {
        //餐饮
    } else if (btn.tag == 2) {
        //路线
    } else if (btn.tag == 3) {
        //我的一天
    } else if (btn.tag == 4) {
        //我的附件
    } else if (btn.tag == 5) {
        //小伙伴去哪
    } else if (btn.tag == 6) {
        //闹钟
    } else if (btn.tag == 7) {
        //运动健身
    } else if (btn.tag == 8) {
        //更多服务
    }
}

#pragma mark - CycleScrollViewDelegate
- (void)cycleScrollViewDelegate:(CycleScrollView *)cycleScrollView didSelectImageView:(int)index
{
    NSLog(@"now select top index %d",index);
}
@end

