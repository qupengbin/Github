//
//  GoWhereViewController.m
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "GoWhereViewController.h"
#import "NearDetailCell.h"

@interface GoWhereViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *priceArr;
    NSArray *nameArr;
    NSArray *iconArr;
}

@property(nonatomic,weak) IBOutlet UITableView *tabView;

@end

@implementation GoWhereViewController

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
    
    self.titlelab.text = @"小 伙 伴 去 哪";
    iconArr = @[@"gowhere1.png",@"gowhere2.png",@"gowhere3.png",
    @"gowhere4.png",@"gowhere5.png",@"gowhere6.png",@"gowhere7.png"];
    
    nameArr = @[@"中山陵",@"紫金山",@"瞻园",@"园林",@"玄武湖",@"莫愁湖",@"南京大屠杀纪念馆"];
    priceArr = @[@"免费",@"免费",@"免费",@"免费",@"免费",@"免费",@"免费"];

    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];

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
    return iconArr.count;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 151.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"GoWhere";
    NearDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[NearDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell reloadData:iconArr
               title:nameArr
               price:priceArr
               index:indexPath.row];
    return cell;
}


@end
