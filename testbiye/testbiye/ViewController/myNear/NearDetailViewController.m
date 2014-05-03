//
//  NearDetailViewController.m
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "NearDetailViewController.h"
#import "NearDetailCell.h"

@interface NearDetailViewController () <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *priceArr;
    NSArray *nameArr;
    NSArray *iconArr;
}

@property(nonatomic,weak) IBOutlet UITableView *tabView;

@end

@implementation NearDetailViewController

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
    
    switch (self.type) {
        case detailViewType_today:
            self.titlelab.text = @"今 日 推 荐";
            iconArr = @[@"neartoday1.png",@"neartoday2.png",@"neartoday3.png",
@"neartoday4.png",@"neartoday5.png",@"neartoday6.png",@"neartoday7.png",@"neartoday8.png"];
            
            nameArr = @[@"鞋子",@"包包",@"化妆品",@"手表",@"杯具",@"衣架子",@"盘子架",@"叉子",];
            priceArr = @[@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",];

            break;
        case detailViewType_hotsell:
            self.titlelab.text = @"超 值 热 购";
            iconArr = @[@"nearsell1.png",@"nearsell2.png",@"nearsell3.png",
@"nearsell4.png",@"nearsell5.png",@"nearsell6.png",@"nearsell7.png",@"nearsell8.png"];
            nameArr = @[@"鞋子",@"包包",@"化妆品",@"手表",@"杯具",@"衣架子",@"盘子架",@"叉子",];
            priceArr = @[@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",];

            break;
        case detailViewType_hot:
            self.titlelab.text = @"最 旺 人 气";
            iconArr = @[@"nearhot1.png",@"nearhot2.png",@"nearhot3.png",
@"nearhot4.png",@"nearhot5.png",@"nearhot6.png",@"nearhot7.png"];
            nameArr = @[@"鞋子",@"包包",@"化妆品",@"手表",@"杯具",@"衣架子",@"盘子架",@"叉子",];
            priceArr = @[@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",];

            break;
        case detailViewType_miaosha:
            self.titlelab.text = @"活 动 秒 杀";
            iconArr = @[@"nextmiao1.png",@"nextmiao2.png",@"nextmiao3.png",
@"nextmiao4.png",@"nextmiao5.png",@"nextmiao6.png",@"nextmiao7.png"];
            nameArr = @[@"鞋子",@"包包",@"化妆品",@"手表",@"杯具",@"衣架子",@"盘子架",@"叉子",];
            priceArr = @[@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",@"今日一折",];

            break;
        case detailViewType_shenhuo:
            self.titlelab.text = @"生 活 圈";
            break;

        default:
            break;
    }
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

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return iconArr.count;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 151.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"NearDetail";
    NearDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[NearDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell reloadData:iconArr
               title:nameArr
               price:priceArr
               index:indexPath.row];
    return cell;
}

@end
