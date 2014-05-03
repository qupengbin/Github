//
//  BuyViewController.m
//  testbiye
//
//  Created by qupengbin on 14-4-16.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "BuyViewController.h"
#import "MHFileTool.h"
#import "ClassView.h"
#import "BuyViewCell.h"
#import "StoreViewController.h"

@interface BuyViewController ()<UITableViewDataSource,UITableViewDelegate,ClassViewDelegate>
{
    int buyType;
    NSArray *dataArr;
    UITableView *_tableView;
}

@end

@implementation BuyViewController

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
    
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backbtnAction:)];
    [self rightItem:[UIImage imageNamed:@"sortimg.png"] sel:@selector(sortBtnAction:)];
    
    self.titlelab.text = @"乐 行 购 物";
    
    // Do any additional setup after loading the view.
}

- (void)initview
{
    ClassView *classview = [[ClassView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    classview.backgroundColor = [UIColor clearColor];
    classview.delegate = self;
    [classview setClassType:buyType];
    [self.view addSubview:classview];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 320, self.view.bounds.size.height-40-44-20) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)initdata
{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[MHFileTool getResourcesFile:@"datasource.plist"]];
    dataArr = [[NSArray alloc] init];
    
    switch (self.type) {
        case BuyClassType_alls:
            dataArr = [dict objectForKey:@"allclass"];
            break;
        case BuyClassType_shops:
            dataArr = [dict objectForKey:@"shops"];
            break;
        case BuyClassType_clothing:
            dataArr = [dict objectForKey:@"clothing"];
            break;
        case BuyClassType_supermarket:
            dataArr = [dict objectForKey:@"supermarket"];
            break;
        case BuyClassType_book:
            dataArr = [dict objectForKey:@"allclass"];
            break;
        case BuyClassType_culture:
            dataArr = [dict objectForKey:@"shops"];
            break;
        case BuyClassType_drugstore:
            dataArr = [dict objectForKey:@"clothing"];
            break;
        case BuyClassType_food:
            dataArr = [dict objectForKey:@"supermarket"];
            break;
        case BuyClassType_flower:
            dataArr = [dict objectForKey:@"allclass"];
            break;
        case BuyClassType_furniture:
            dataArr = [dict objectForKey:@"shops"];
            break;
        case BuyClassType_glass:
            dataArr = [dict objectForKey:@"clothing"];
            break;
        case BuyClassType_IT:
            dataArr = [dict objectForKey:@"supermarket"];
            break;
        case BuyClassType_jewel:
            dataArr = [dict objectForKey:@"allclass"];
            break;
        case BuyClassType_makeup:
            dataArr = [dict objectForKey:@"shops"];
            break;
        case BuyClassType_more:
            dataArr = [dict objectForKey:@"clothing"];
            break;

        default:
            break;
    }
}

- (void)setBuyType:(int)type
{
    buyType = type;
    [self initdata];
    [self initview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backbtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sortBtnAction:(id)sender
{
    
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArr.count;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"BuyViewCell";
    BuyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[BuyViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell reloadData:dataArr index:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoreViewController *storeView = [[StoreViewController alloc] init];
    
    NSDictionary *dict = [dataArr objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:storeView animated:YES];
    
    [storeView setNowTypeAndTitle:[dict objectForKey:@"name"]];

}

#pragma mark - ClassViewDelegate
- (void)classViewTapAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    self.type = btn.tag-1000;
    [self initdata];
    [_tableView reloadData];
}

@end
