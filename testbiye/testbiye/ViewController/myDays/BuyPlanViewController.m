//
//  BuyPlanViewController.m
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "BuyPlanViewController.h"
#import "MHFileTool.h"
#import "StatisCell.h"

@interface BuyPlanViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *dayArr;
}

@property(nonatomic,weak) IBOutlet UITableView *tabView;

@end

@implementation BuyPlanViewController

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
    
    self.titlelab.text = @"购 物 计 划";
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];
    [self initdata];
    // Do any additional setup after loading the view from its nib.
}

- (void)initdata
{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[MHFileTool getResourcesFile:@"statis.plist"]];
    dayArr = [dict objectForKey:@"day"];
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
    return dayArr.count;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 175.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"BuyViewCell";
    StatisCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[StatisCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell reloadData:[dayArr objectAtIndex:indexPath.row]
               index:indexPath.row];
    return cell;
}

@end
