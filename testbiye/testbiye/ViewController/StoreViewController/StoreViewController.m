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
#import "MyFavoriteViewController.h"
#import "SearchView.h"

@interface StoreViewController ()<TopScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,SearchViewDelegate>
{
    int nowType;
    BOOL showsearch;
    
    UIButton *_touchBtn;
    UITableView *_tableView;
    TopScrollView *_topScrollView;
    SearchView *_searchView;

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
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [btn setImage:[UIImage imageNamed:@"favoriteicon.png"]
         forState:UIControlStateNormal];
    [btn addTarget:self
            action:@selector(favoriteBtnAction:)
  forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [btn1 setImage:[UIImage imageNamed:@"searchicon.png"]
         forState:UIControlStateNormal];
    [btn1 addTarget:self
             action:@selector(searchBtnAction:)
   forControlEvents:UIControlEventTouchUpInside];
    btn1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:btn1];

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];

    self.navigationItem.rightBarButtonItems = @[item1,item];
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSMutableArray *infos = [[NSMutableArray alloc] init];
    for (int i = 0; i<5; i++) {
        NSString *name = [NSString stringWithFormat:@"top_main%d.png",i+1];
        [arr addObject:name];
        NSString *price = nil;
        NSString *title = nil;
        switch (i) {
            case 0:
                price = @"今日五折";
                title = @"草莓奶油泡芙";
                break;
            case 1:
                price = @"今日九折";
                title = @"五彩茶杯";
                break;
            case 2:
                price = @"今日四折";
                title = @"派克钢笔";
                break;
            case 3:
                price = @"今日七五折";
                title = @"餐具";
                break;
            case 4:
                price = @"今日八折";
                title = @"葱花鸡蛋";
                break;
                
            default:
                break;
        }
        NSDictionary *dict = @{@"price":price,@"title":title};
        [infos addObject:dict];
    }

    _searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, -40, 320, 40)];
    _searchView.delegate = self;
    [self.view addSubview:_searchView];
    

    _topScrollView = [[TopScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 230)];
    _topScrollView.delegate = self;
    [_topScrollView reloadDataWithPictures:arr infos:infos];
    [self.view addSubview:_topScrollView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 230, 320, self.view.bounds.size.height-230-44-20) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
        
    nowType = 1;
    
    _touchBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 568-44-20-40-216)];
    [self.view addSubview:_touchBtn];
    _touchBtn.backgroundColor = [UIColor clearColor];
    [_touchBtn addTarget:self action:@selector(touchBtnAction) forControlEvents:UIControlEventTouchUpInside];
    _touchBtn.alpha = 0.3f;
    _touchBtn.hidden = YES;

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
#pragma mark - SearchViewDelegate
- (void)SearchViewReturn:(UITextField *)field
{
    [UIView animateWithDuration:0.3f animations:^{
        self.view.bounds = CGRectMake(0, 0, 320, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        [field resignFirstResponder];
    }];
}

#pragma mark - ButtonAction
- (void)touchBtnAction
{
    [self searchBtnAction:nil];
    _touchBtn.hidden = YES;
}

- (void)searchBtnAction:(id)sender
{
    if (!showsearch) {
        [UIView animateWithDuration:0.3f animations:^{
            self.view.bounds = CGRectMake(0, -40, 320, self.view.bounds.size.height);
        } completion:^(BOOL finished) {
            [_searchView searchViewBecomeFirstResponder];
            _touchBtn.hidden = NO;
        }];
    } else {
        [UIView animateWithDuration:0.3f animations:^{
            self.view.bounds = CGRectMake(0, 0, 320, self.view.bounds.size.height);
        } completion:^(BOOL finished) {
            [_searchView searchViewResignFirstResponder];
            _touchBtn.hidden = YES;
        }];
    }
    showsearch = !showsearch;
}

- (void)favoriteBtnAction:(id)sender
{
    MyFavoriteViewController *favorite = [[MyFavoriteViewController alloc] init];
    favorite.type = 2;
    [self.navigationController pushViewController:favorite animated:YES];
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
