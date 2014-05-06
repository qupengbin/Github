//
//  DayPlanViewController.m
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "DayPlanViewController.h"
#import "DaysScrollView.h"

@interface DayPlanViewController () <UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    DaysScrollView *_daysScroll;
}

@property(nonatomic,weak) IBOutlet UIScrollView *scroView;
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
    self.titlelab.text = @"日 程 安 排";
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];

    _daysScroll = [[DaysScrollView alloc] initWithFrame:CGRectMake(0, 568-44-20-70-10, 320, 70)];
    [self.view addSubview:_daysScroll];
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
    return 2;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *string = @"myDaysCell";
//    MainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
//    if (cell == nil) {
//        cell = [[MainViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.delegate = self;
//    }
//    [cell reloadData:nameArr icon:iconArr index:indexPath.row];
//    return cell;
    return nil;
}

@end
