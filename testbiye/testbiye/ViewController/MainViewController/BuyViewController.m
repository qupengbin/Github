//
//  BuyViewController.m
//  testbiye
//
//  Created by qupengbin on 14-4-16.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "BuyViewController.h"
#import "MHFileTool.h"
#import "ClassView.h"

@interface BuyViewController ()<UITableViewDataSource,UITableViewDelegate,ClassViewDelegate>
{
    NSArray *dataArr;
    UITableView *_tableView;
}

@end

@implementation BuyViewController

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
    
    ClassView *classview = [[ClassView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    classview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:classview];
    
    [self initdata];
    
    // Do any additional setup after loading the view.
}

- (void)initdata
{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[MHFileTool getResourcesFile:@"datasource.plist"]];
    NSLog(@"data dict  %@",dict);
    dataArr = [[NSArray alloc] init];
    
    switch (self.type) {
        case BuyClassType_alls:
            dataArr = [dict objectForKey:@"allclass"];
            break;
        case BuyClassType_shops:
            dataArr = [dict objectForKey:@"shops"];
            break;
        case BuyClassType_clothing:
            dataArr = [dict objectForKey:@"clothing"];
            break;
        case BuyClassType_supermarket:
            dataArr = [dict objectForKey:@"supermarket"];
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArr.count;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"MenuViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.textLabel.font = [UIFont systemFontOfSize:16.0f];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    cell.textLabel.text = [dataArr objectAtIndex:indexPath.row];
    NSString *str = [NSString stringWithFormat:@"menuicon%d",indexPath.row+1];
    cell.imageView.image = [UIImage imageNamed:str];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - ClassViewDelegate
- (void)classViewTapAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 1000:
            self.type = BuyClassType_alls;
            break;
        case 1001:
            self.type = BuyClassType_shops;
            break;
        case 1002:
            self.type = BuyClassType_clothing;
            break;
        case 1003:
            self.type = BuyClassType_supermarket;
            break;
 
        default:
            break;
    }
    [self initdata];
    [_tableView reloadData];
}

@end
