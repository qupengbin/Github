//
//  MenuViewController.m
//  testbiye
//
//  Created by qupengbin on 14-4-17.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuCell.h"

@interface MenuViewController ()
{
    NSArray *titleArr;
}
@end

@implementation MenuViewController

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
    
    titleArr = @[@"我的积分",@"我的订单",@"消费统计",@"我的收藏"];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    
    UIImageView *iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 90, 90)];
    iconImg.image = [UIImage imageNamed:@"usericonbg.png"];
    iconImg.backgroundColor = [UIColor clearColor];
    [headerView addSubview:iconImg];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 30, 90, 90)];
    [btn addTarget:self
            action:@selector(btnAction:)
  forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:btn];
    btn.backgroundColor = [UIColor clearColor];
    
    UILabel *titlelab = [[UILabel alloc] initWithFrame:CGRectMake(140, 80, 100, 20)];
    titlelab.backgroundColor = [UIColor clearColor];
    titlelab.font = [UIFont systemFontOfSize:12.0f];
    titlelab.textColor = [UIColor lightGrayColor];
    titlelab.text = @"点击登录或注册";
    [headerView addSubview:titlelab];
    
    UIButton *labBtn = [[UIButton alloc] initWithFrame:CGRectMake(140, 80, 100, 20)];
    [labBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:labBtn];
    
    self.tableView.tableHeaderView = headerView;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
//    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

#pragma mark - BtnAction
- (void)btnAction:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginOrRegistAction)]) {
        [self.delegate loginOrRegistAction];
    }
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleArr.count;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"MenuViewCell";
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[MenuCell alloc] initWithStyle:UITableViewCellStyleDefault
                               reuseIdentifier:string];
    }
    NSString *str = [NSString stringWithFormat:@"menuicon%d",indexPath.row+1];
    [cell reloadData:str title:[titleArr objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableviewSelect:)]) {
        [self.delegate tableviewSelect:indexPath.row];
    }
}

@end
