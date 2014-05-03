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
#import "MainViewCell.h"
#import "TopScrollView.h"
#import "SearchView.h"
#import "TabbarToolView.h"
#import "MainLittleView.h"
#import "LineViewController.h"
#import "MyDaysViewController.h"
#import "MyNearViewController.h"
#import "GoWhereViewController.h"
#import "TimeClockViewController.h"
#import "SportViewController.h"

@interface MainViewController () <UITableViewDelegate,UITableViewDataSource,TopScrollViewDelegate,MainViewCellDelegate,SearchViewDelegate,MainLittleViewDelegate>
{
    UIButton *_touchBtn;
    UITableView *_tableView;
    
    NSArray *nameArr;
    NSArray *iconArr;
    
    SearchView *_searchView;
    TabbarToolView *_tabbarView;
    TopScrollView *_topScrollView;
    MainLittleView *_littleView;
}

@end

@implementation MainViewController

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
    self.titlelab.text = @"乐 行";
    
    nameArr = @[@"乐行购物",@"乐行餐饮",@"乐行路线",
                @"我的一天",@"我的附近",@"小伙伴去哪",
                @"乐行闹铃",@"运动健身",@"更多服务",];

    iconArr = @[@"mainicon1.png",@"mainicon2.png",@"mainicon3.png",
                @"mainicon4.png",@"mainicon5.png",@"mainicon6.png",
                @"mainicon7.png",@"mainicon8.png",@"mainicon9.png",];
    
    [self leftItem:[UIImage imageNamed:@"menubtn.png"] sel:@selector(menuAction:)];
    [self rightItem:[UIImage imageNamed:@"searchicon.png"] sel:@selector(searchAction:)];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSMutableArray *namearr = [[NSMutableArray alloc] init];
    for (int i = 0; i<5; i++) {
        NSString *name = [NSString stringWithFormat:@"top_main%d.png",i+1];
        [arr addObject:name];
        [namearr addObject:@"test"];
    }
    
    _searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, -40, 320, 40)];
    _searchView.delegate = self;
    [self.view addSubview:_searchView];
    
    _topScrollView = [[TopScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 230)];
    _topScrollView.delegate = self;
    [_topScrollView reloadDataWithPictures:arr infos:nil];
    [self.view addSubview:_topScrollView];
    
    _littleView = [[MainLittleView alloc] initWithFrame:CGRectMake(0, 230, 320, 45)];
    _littleView.backgroundColor = [UIColor whiteColor];
    _littleView.delegate = self;
    [self.view addSubview:_littleView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 230+45, 320, app.window.bounds.size.height-293-40) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    app.tabbar.hidden = YES;
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

#pragma mark - SearchViewDelegate
- (void)SearchViewReturn:(UITextField *)field
{
    [UIView animateWithDuration:0.3f animations:^{
        self.view.bounds = CGRectMake(0, 0, 320, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        [field resignFirstResponder];
    }];
}

#pragma mark - UIButtonAction
- (void)searchAction:(id)sender
{
    [UIView animateWithDuration:0.3f animations:^{
        self.view.bounds = CGRectMake(0, -40, 320, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        [_searchView searchViewBecomeFirstResponder];
    }];
}

- (void)menuAction:(id)sender
{
    MHNavViewController *nav = (MHNavViewController *)self.navigationController;
    [nav.drawer open];
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
    static NSString *string = @"MainViewCell";
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
    app.tabbar.hidden = NO;
    
    if (btn.tag == 0) {
        //购物
        BuyViewController *buyView = [[BuyViewController alloc] init];
        buyView.view.backgroundColor = [UIColor clearColor];
        [self.navigationController pushViewController:buyView animated:YES];
        [buyView setBuyType:1];
    } else if (btn.tag == 1) {
        //餐饮
        BuyViewController *buyView = [[BuyViewController alloc] init];
        buyView.view.backgroundColor = [UIColor clearColor];
        [self.navigationController pushViewController:buyView animated:YES];
        [buyView setBuyType:2];
    } else if (btn.tag == 2) {
        //路线
        LineViewController *lineView = [[LineViewController alloc] init];
        [self.navigationController pushViewController:lineView animated:YES];

    } else if (btn.tag == 3) {
        //我的一天
        MyDaysViewController *dayView = [[MyDaysViewController alloc] init];
        [self.navigationController pushViewController:dayView animated:YES];

    } else if (btn.tag == 4) {
        //我的附件
        MyNearViewController *dayView = [[MyNearViewController alloc] init];
        [self.navigationController pushViewController:dayView animated:YES];

    } else if (btn.tag == 5) {
        //小伙伴去哪
        GoWhereViewController *dayView = [[GoWhereViewController alloc] init];
        [self.navigationController pushViewController:dayView animated:YES];

    } else if (btn.tag == 6) {
        //闹钟
        TimeClockViewController *dayView = [[TimeClockViewController alloc] init];
        [self.navigationController pushViewController:dayView animated:YES];

    } else if (btn.tag == 7) {
        //运动健身
        SportViewController *dayView = [[SportViewController alloc] init];
        [self.navigationController pushViewController:dayView animated:YES];

    } else if (btn.tag == 8) {
        //更多服务
    }
}

#pragma mark - CycleScrollViewDelegate
- (void)topScrollViewAction:(int)index
{
    NSLog(@"now select top index %d",index);
}

#pragma mark - MainLittleViewDelegate
- (void)MainLittleAction:(int)tag
{
    NSLog(@"tag %d",tag);
}

@end

