//
//  DayAlertViewController.m
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "DayAlertViewController.h"
#import "AlertViewCell.h"

@interface DayAlertViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL edit;
    NSMutableArray *timeArr;
    NSMutableArray *titleArr;
}

@property(nonatomic,weak) IBOutlet UITableView *tabView;

@end

@implementation DayAlertViewController

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
    
    edit = NO;
    
    self.titlelab.text = @"活 动 提 醒";
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];
    [self rightItem:[UIImage imageNamed:@"alertedit.png"] sel:@selector(editBtnAction:)];

    NSArray *time = @[@"08:10",@"09:30",@"10:30",
                @"12:30",@"15:30",@"16:30",
                @"20:40",@"11:24",@"22:39",
                @"12:40"];
    NSArray *title = @[@"地铁站充值公交卡",@"吃午饭,然后午休",@"去图书馆",
                 @"看新视野大学英语",@"去健身房锻炼身体",@"吃晚饭",
                 @"玩游戏",@"购物",@"睡觉",
                 @"逛街"];

    timeArr = [[NSMutableArray alloc] init];
    [timeArr addObjectsFromArray:time];
    
    titleArr = [[NSMutableArray alloc] init];
    [titleArr addObjectsFromArray:title];

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

- (void)editBtnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
    edit = btn.selected;
    [self.tabView reloadData];
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return timeArr.count;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"alertViewCell";
    AlertViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[AlertViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell reloadData:[timeArr objectAtIndex:indexPath.row]
               title:[titleArr objectAtIndex:indexPath.row]
               index:indexPath.row];
    [cell switchOnorOff:edit];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [timeArr removeObjectAtIndex:indexPath.row];
        [titleArr removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
@end
