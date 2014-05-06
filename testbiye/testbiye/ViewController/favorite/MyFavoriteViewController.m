//
//  MyFavoriteViewController.m
//  testbiye
//
//  Created by qupengbin on 14-5-6.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "MyFavoriteViewController.h"
#import "BuyViewCell.h"
#import "MHFileTool.h"

@interface MyFavoriteViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *dataArr;
}

@property(nonatomic,weak) IBOutlet UITableView *tabView;

@end

@implementation MyFavoriteViewController

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
    
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backbtnAction:)];
    self.titlelab.text = @"我 的 收 藏";

    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[MHFileTool getResourcesFile:@"datasource.plist"]];
    dataArr = [dict objectForKey:@"allclass"];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backbtnAction:(id)sender
{
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArr.count;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"BuyViewCell";
    BuyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[BuyViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell reloadData:dataArr index:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
