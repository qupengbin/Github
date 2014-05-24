//
//  MenuView.m
//  testbiye
//
//  Created by qupengbin on 14-5-20.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "MenuView.h"
#import "MenuCell.h"

@interface MenuView ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *titleArr;
    UITableView *tabView;
}
@end

@implementation MenuView

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
    self.backgroundColor = [UIColor whiteColor];
    
    titleArr = @[@"我的积分",@"我的订单",@"消费统计",@"我的收藏"];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    
    UIImageView *iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, 90, 90)];
    iconImg.image = [UIImage imageNamed:@"usericonbg.png"];
    iconImg.backgroundColor = [UIColor clearColor];
    [headerView addSubview:iconImg];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 90, 90)];
    [btn addTarget:self
            action:@selector(btnAction:)
  forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:btn];
    btn.backgroundColor = [UIColor clearColor];
    
    UILabel *titlelab = [[UILabel alloc] initWithFrame:CGRectMake(110, 65, 100, 20)];
    titlelab.backgroundColor = [UIColor clearColor];
    titlelab.font = [UIFont systemFontOfSize:15.0f];
    titlelab.textColor = RGBCOLOR(25.0f, 188.0f, 149.0f);
    titlelab.text = @"登录或注册";
    [headerView addSubview:titlelab];
    
    UIButton *labBtn = [[UIButton alloc] initWithFrame:CGRectMake(120, 80, 100, 20)];
    [labBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:labBtn];
    
    tabView = [[UITableView alloc] initWithFrame:self.bounds
                                           style:UITableViewStylePlain];
    tabView.delegate = self;
    tabView.dataSource = self;
    tabView.backgroundColor = [UIColor clearColor];
    tabView.tableHeaderView = headerView;
    tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:tabView];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width-0.5f, 0, 0.5f, self.bounds.size.height)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
    
    UISwipeGestureRecognizer *swipeR =[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftAction:)];
    swipeR.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:swipeR];
}

- (void)swipeLeftAction:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(swipLeftActionDel)]) {
        [self.delegate swipLeftActionDel];
    }
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
