//
//  DayPlanViewController.m
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "DayPlanViewController.h"
#import "DaysScrollView.h"
#import "ChangeScrollView.h"
#import "MHFileTool.h"
#import "DayPlanCell.h"

@interface DayPlanViewController () <UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,DaysScrollViewDelegate,ChangeScrollViewDelegate>
{
    int _nowindex;
    NSArray *allData;
    NSArray *indexData;
    DaysScrollView *_daysScroll;
    ChangeScrollView *_changeScroll;
}

@property(nonatomic,weak) IBOutlet UITableView *tabView;

@end

@implementation DayPlanViewController

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
    _nowindex = 0;
    
    self.titlelab.text = @"日 程 安 排";
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];
    [self rightItem:[UIImage imageNamed:@"alertedit.png"] sel:nil];
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[MHFileTool getResourcesFile:@"datasource.plist"]];
    allData = [dict objectForKey:@"dayplan"];
    indexData = [allData objectAtIndex:0];
    
    _daysScroll = [[DaysScrollView alloc] initWithFrame:CGRectMake(0, 568-44-20-70-10, 320, 70)];
    _daysScroll.delegate = self;
    [self.view addSubview:_daysScroll];
    
    _changeScroll = [[ChangeScrollView alloc] initWithFrame:CGRectMake(0, 35 , 320, 177)];
    _changeScroll.delegate = self;
    [_changeScroll reloadData:allData icon:@"dayplanicon.png" type:1];
    [self.view addSubview:_changeScroll];
    
    [self daysScrollViewSelectIndex:1];
    [self changeScrollViewIndex:1];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DaysScrollViewDelegate
- (void)daysScrollViewSelectIndex:(int)index
{
    if (index<_nowindex) {
        //说明是往前
        [_changeScroll changeViewToIndex:index LOrR:YES];
        indexData = [allData objectAtIndex:index];
        [self.tabView reloadData];
        _nowindex = index;
        return;
    }
    _nowindex = index;
    [_changeScroll changeViewToIndex:index LOrR:NO];
    indexData = [allData objectAtIndex:index];
    [self.tabView reloadData];
}

#pragma mark - ChangeScrollViewDelegate
- (void)changeScrollViewIndex:(int)index
{
    [_daysScroll changeDaysToIndex:index];
    indexData = [allData objectAtIndex:index];
    [self.tabView reloadData];
}

#pragma mark - BtnAction
- (void)backBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return indexData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"myDayPlanCell";
    DayPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[DayPlanCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell reloadData:[indexData objectAtIndex:indexPath.row]];
    return cell;
}

@end
