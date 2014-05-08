//
//  StatisticsViewController.m
//  testbiye
//
//  Created by qupengbin on 14-5-8.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "StatisticsViewController.h"
#import "MHFileTool.h"
#import "StatisCell.h"

@interface StatisticsViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *dayArr;
}
@property(nonatomic,weak) IBOutlet UIButton *daybtn;
@property(nonatomic,weak) IBOutlet UIButton *zhoubtn;
@property(nonatomic,weak) IBOutlet UIButton *mombtn;
@property(nonatomic,weak) IBOutlet UIButton *yearbtn;

@property(nonatomic,weak) IBOutlet UITableView *tabView;

- (IBAction)BtnAction:(id)sender;

@end

@implementation StatisticsViewController

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
    self.titlelab.text = @"我 的 订 单";
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];
    self.daybtn.selected = YES;
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
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)BtnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    self.daybtn.selected = NO;
    self.zhoubtn.selected = NO;
    self.mombtn.selected = NO;
    self.yearbtn.selected = NO;
    switch (btn.tag) {
        case 0:
            self.daybtn.selected = YES;
            break;
        case 1:
            self.zhoubtn.selected = YES;

            break;
        case 2:
            self.mombtn.selected = YES;

            break;
        case 3:
            self.yearbtn.selected = YES;

            break;
 
        default:
            break;
    }
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dayArr.count;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"BuyViewCell";
    StatisCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[StatisCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell reloadData:[dayArr objectAtIndex:indexPath.row]];
    return cell;
}

@end
