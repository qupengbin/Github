//
//  SetClockViewController.m
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "SetClockViewController.h"
#import "ClockCell.h"
#import "TimeClockViewController.h"

@interface SetClockViewController ()<UITableViewDelegate,UITableViewDataSource,TimeClockDelegate>
{
    BOOL editbool;
    NSMutableArray *timeArr;
    NSMutableArray *addressArr;
}

@property(nonatomic,weak) IBOutlet UITableView *tabView;

@end

@implementation SetClockViewController

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
    
    self.titlelab.text = @"乐 行 闹 钟";
    
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];
    [self rightItem:[UIImage imageNamed:@"timeclockadd.png"] sel:@selector(timeClockAddBtnAction:)];

    NSArray *arr = @[@"15:30",@"19:10",@"20:30"];
    NSArray *arr1 = @[@"新街口站-鼓楼站",@"迈皋桥站-张府园站",@"张府园站-奥体中心站"];
    
    timeArr = [[NSMutableArray alloc] initWithArray:arr];
    addressArr = [[NSMutableArray alloc] initWithArray:arr1];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - BtnAction
- (void)timeClockAddBtnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    editbool = !btn.selected;
    btn.selected = !btn.selected;
    [self.tabView reloadData];
}

- (void)backBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return timeArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"ClockCell";
    ClockCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[ClockCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell reloadData:[timeArr objectAtIndex:indexPath.row]
             address:[addressArr objectAtIndex:indexPath.row]
            editbool:editbool];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TimeClockViewController *clockView = [[TimeClockViewController alloc] init];
    clockView.delegate = self;
    clockView.index = indexPath.row;
    [self.navigationController pushViewController:clockView animated:YES];
}

#pragma mark - TimeClockDelegate
- (void)deleteTimeClock:(int)index
{
    if (timeArr && timeArr.count>0 && index<timeArr.count) {
        [timeArr removeObjectAtIndex:index];
    }
    if (addressArr && addressArr.count>0 && index<addressArr.count) {
        [addressArr removeObjectAtIndex:index];
    }
    [self.tabView reloadData];
}
@end
