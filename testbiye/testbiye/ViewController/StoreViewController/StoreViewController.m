//
//  StoreViewController.m
//  testbiye
//
//  Created by qupengbin on 14-4-26.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "StoreViewController.h"
#import "TopScrollView.h"
#import "MHFileTool.h"
#import "StoreDetailViewController.h"
#import "StoreCell.h"
#import "SortView.h"

@interface StoreViewController ()<TopScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    int nowType;
    
    UITableView *_tableView;
    TopScrollView *_topScrollView;
    
    NSArray *dataArr;
    NSMutableArray *iconArr;
    NSMutableArray *nameArr;
}
@end

@implementation StoreViewController

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
    
    self.titlelab.text = @"苏 果 便 利";
    
    dataArr = [[NSArray alloc] init];
    
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSMutableArray *namearr = [[NSMutableArray alloc] init];
    for (int i = 0; i<5; i++) {
        NSString *name = [NSString stringWithFormat:@"top_main%d.png",i+1];
        [arr addObject:name];
        [namearr addObject:@"test"];
    }
    
    _topScrollView = [[TopScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 230)];
    _topScrollView.delegate = self;
    [_topScrollView reloadDataWithPictures:arr infos:nil];
    [self.view addSubview:_topScrollView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 230, 320, self.view.bounds.size.height-230-44-20) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
        
    nowType = 1;
    
    [self initdata];

	// Do any additional setup after loading the view.
}

- (void)initdata
{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[MHFileTool getResourcesFile:@"storedata.plist"]];
    dataArr = [dict objectForKey:@"allclass"];
    
    if (iconArr == nil) {
        iconArr = [[NSMutableArray alloc] init];
    }
    if (nameArr == nil) {
        nameArr = [[NSMutableArray alloc] init];
    }

    for (int i = 0; i < dataArr.count; i++) {
        NSDictionary *dic = [dataArr objectAtIndex:i];
        [iconArr addObject:[dic objectForKey:@"icon"]];
        [nameArr addObject:[dic objectForKey:@"name"]];
    }
    
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setNowTypeAndTitle:(NSString *)title
{
    self.titlelab.text = title;
}

#pragma mark - TopScrollViewDelegate
- (void)topScrollViewAction:(int)index
{
    StoreDetailViewController *detail = [[StoreDetailViewController alloc] init];
    detail.type = index+1;
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return nameArr.count;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 49.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"BuyViewCell";
    StoreCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[StoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell reloadData:[iconArr objectAtIndex:indexPath.row] name:[nameArr objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoreDetailViewController *detail = [[StoreDetailViewController alloc] init];
    detail.type = indexPath.row+1;
    [self.navigationController pushViewController:detail animated:YES];
}

@end
