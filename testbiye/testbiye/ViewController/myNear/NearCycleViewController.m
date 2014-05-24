//
//  NearCycleViewController.m
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "NearCycleViewController.h"
#import "MHFileTool.h"
#import "LifeSayCell.h"
#import "InPutView.h"

@interface NearCycleViewController ()<UITableViewDelegate,UITableViewDataSource,InPutViewDelegate>
{
    NSMutableArray *allArr;
    
    InPutView *_inPut;
}

@property(nonatomic,weak) IBOutlet UITableView *tabView;

@end

@implementation NearCycleViewController

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
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];
    [self rightItem:[UIImage imageNamed:@"timeclockadd.png"] sel:@selector(timeClockAddBtnAction:)];

    self.titlelab.text = @"生 活 圈";

    allArr = [NSMutableArray arrayWithContentsOfFile:[MHFileTool getResourcesFile:@"lifesay.plist"]];

    _inPut = [[InPutView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-40-44-20, 320, 40)];
    _inPut.delegate = self;
    [self.view addSubview:_inPut];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - InPutViewDelegate
- (void)addFunction
{
    [self endInput];
}

- (void)biaoqingFunction
{
    
}

- (void)beginInput
{
    [UIView animateWithDuration:0.3f animations:^{
        _inPut.frame = CGRectMake(0, self.view.bounds.size.height-40-216, 320, 40);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)endInput
{
    [UIView animateWithDuration:0.3f animations:^{
        _inPut.frame = CGRectMake(0, self.view.bounds.size.height-40, 320, 40);
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - BtnAction
- (void)backBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)timeClockAddBtnAction:(id)sender
{
    
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return allArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row%2 == 0) {
        return 250.0f;
    } else {
        return 290.0f;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"LifeSayCell";
    LifeSayCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[LifeSayCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell reloadData:[allArr objectAtIndex:indexPath.row]
               index:indexPath.row];
    return cell;
}

@end
