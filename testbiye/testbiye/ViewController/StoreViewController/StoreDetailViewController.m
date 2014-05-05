//
//  StoreDetailViewController.m
//  testbiye
//
//  Created by qupengbin on 14-5-5.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "StoreDetailViewController.h"
#import "MainViewCell.h"
#import "MHFileTool.h"

@interface StoreDetailViewController ()<MainViewCellDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *nameArr;
    NSMutableArray *iconArr;
}

@property(nonatomic,weak) IBOutlet UITableView *tabView;

@end

@implementation StoreDetailViewController

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
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];

    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[MHFileTool getResourcesFile:@"buydata.plist"]];
    NSArray *arr = [dict objectForKey:@"dataone"];
    
    nameArr = [[NSMutableArray alloc] init];
    iconArr = [[NSMutableArray alloc] init];

    for (int i = 0; i < arr.count; i++) {
        NSDictionary *dic = [arr objectAtIndex:i];
        [nameArr addObject:[dic objectForKey:@"name"]];
        [iconArr addObject:[dic objectForKey:@"icon"]];
    }
    
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
    return 4;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"myDaysCell";
    MainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[MainViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    [cell reloadData:nameArr icon:iconArr index:indexPath.row];
    return cell;
}

@end
