//
//  BuyCarViewController.m
//  testbiye
//
//  Created by qupengbin on 14-5-5.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "BuyCarViewController.h"
#import "BuyCarCell.h"
#import "MHFileTool.h"
#import "MyIndentViewController.h"

//购物车
@interface BuyCarView()
{
    UIButton *payonln;
    UIButton *paycash;
    
    UIButton *commitbtn;
    
    UILabel *pricelab;
}

@end

@implementation BuyCarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initview];
    }
    return self;
}

- (void)initview
{
    payonln = [[UIButton alloc] initWithFrame:CGRectMake(20, 28, 11, 11)];
    [payonln setImage:[UIImage imageNamed:@"buycarpay1.png"] forState:UIControlStateNormal];
    [payonln setImage:[UIImage imageNamed:@"buycarpay2.png"] forState:UIControlStateSelected];
    [self addSubview:payonln];
    
    
    UILabel *online = [[UILabel alloc] initWithFrame:CGRectMake(35, 18, 70, 30)];
    online.text = @"在线支付";
    [self addSubview:online];
    
    paycash = [[UIButton alloc] initWithFrame:CGRectMake(35+70, 28, 11, 11)];
    [paycash setImage:[UIImage imageNamed:@"buycarpay1.png"] forState:UIControlStateNormal];
    [paycash setImage:[UIImage imageNamed:@"buycarpay2.png"] forState:UIControlStateSelected];
    [self addSubview:paycash];
    
    payonln.tag = 100;
    paycash.tag = 200;
    
    [payonln addTarget:self action:@selector(payBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [paycash addTarget:self action:@selector(payBtnAction:) forControlEvents:UIControlEventTouchUpInside];

    UILabel *cash = [[UILabel alloc] initWithFrame:CGRectMake(32+70+20, 18, 70, 30)];
    cash.text = @"现金支付";
    [self addSubview:cash];
    
    online.textColor = [UIColor lightGrayColor];
    online.font = [UIFont systemFontOfSize:14.0f];
    
    cash.textColor = [UIColor lightGrayColor];
    cash.font = [UIFont systemFontOfSize:14.0f];
    
    pricelab = [[UILabel alloc] initWithFrame:CGRectMake(32+70+20+100, 18, 150, 30)];
    pricelab.textColor = [UIColor grayColor];
    pricelab.font = [UIFont systemFontOfSize:20.0f];
    pricelab.text = @"共计:29元";
    [self addSubview:pricelab];
    
    UIButton *commit = [[UIButton alloc] initWithFrame:CGRectMake((320-263)/2, 70, 263, 35)];
    [commit setBackgroundImage:[UIImage imageNamed:@"loginbtn.png"] forState:UIControlStateNormal];
    [commit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [commit setTitle:@"提 交 订 单" forState:UIControlStateNormal];
    [commit addTarget:self action:@selector(commitAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:commit];
}

- (void)payBtnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;

    if (btn.tag == 100) {
        paycash.selected = NO;
    } else if (btn.tag == 200) {
        payonln.selected = NO;
    }
}

- (void)commitAction:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(buyCarCommitAction:)]) {
        [self.delegate buyCarCommitAction:sender];
    }
}

@end

@interface BuyCarViewController ()<BuyCarCellDelegate,UITableViewDelegate,UITableViewDataSource,BuyCarViewDelegate>
{
    NSMutableArray *dataArr;
    
    BuyCarView *footView;
}

@property(nonatomic,weak) IBOutlet UITableView *tabView;

@end

@implementation BuyCarViewController

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
    
    self.titlelab.text = @"购 物 车";
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];

    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[MHFileTool getResourcesFile:@"datasource.plist"]];
    dataArr = [[NSMutableArray alloc] initWithArray:[dict objectForKey:@"buycar"]];
    
    
    footView = [[BuyCarView alloc] initWithFrame:CGRectMake(0, 0, 320, 120)];
    footView.delegate = self;
    self.tabView.tableFooterView = footView;
    
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

#pragma mark
- (void)buyCarCommitAction:(id)sender
{
    MyIndentViewController *indent = [[MyIndentViewController alloc] init];
    indent.type = 2;
    [self.navigationController pushViewController:indent animated:YES];
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
    static NSString *string = @"BuyCarCell";
    BuyCarCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[BuyCarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    [cell reloadData:dataArr index:indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [dataArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}

@end
