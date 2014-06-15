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
#import "OBShapedButton.h"
#import "CurveView.h"

@interface StatisticsViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    Statis_type _type;
    
    NSArray *dayArr;
    
    CurveView *_curveView;
}
@property(nonatomic,weak) IBOutlet UIButton *daybtn;
@property(nonatomic,weak) IBOutlet UIButton *zhoubtn;
@property(nonatomic,weak) IBOutlet UIButton *mombtn;
@property(nonatomic,weak) IBOutlet UIButton *yearbtn;
@property(nonatomic,weak) IBOutlet UIView *toolView;
@property(nonatomic,weak) IBOutlet UIView *tabtoolView;

@property(nonatomic,weak) IBOutlet OBShapedButton *foodbtn;     //餐饮
@property(nonatomic,weak) IBOutlet OBShapedButton *trafficbtn;  //交通
@property(nonatomic,weak) IBOutlet OBShapedButton *cosmeticbtn; //化妆品
@property(nonatomic,weak) IBOutlet OBShapedButton *travelbtn;   //旅游

@property(nonatomic,weak) IBOutlet UILabel *momlab;     //时间
@property(nonatomic,weak) IBOutlet UILabel *yearlab;    //时间
@property(nonatomic,weak) IBOutlet UILabel *alllab;     //总支出
@property(nonatomic,weak) IBOutlet UILabel *percentlab; //百分比
@property(nonatomic,weak) IBOutlet UILabel *namelab;    //name
@property(nonatomic,weak) IBOutlet UILabel *pricelab;   //价格
@property(nonatomic,weak) IBOutlet UILabel *mytitle;

@property(nonatomic,weak) IBOutlet UIImageView *bg;
@property(nonatomic,weak) IBOutlet UIImageView *icon;
@property(nonatomic,weak) IBOutlet UIImageView *iconbg;

@property(nonatomic,weak) IBOutlet UITableView *tabView;

- (IBAction)BtnAction:(id)sender;

@end

@implementation StatisticsViewController


- (void)hiddenLabel
{
    self.momlab.hidden = YES;
    self.yearlab.hidden = YES;
    self.alllab.hidden = YES;
    self.percentlab.hidden = YES;
    self.namelab.hidden = YES;
    self.pricelab.hidden = YES;
    self.bg.hidden = YES;
    self.icon.hidden = YES;
    self.iconbg.hidden = YES;
    self.mytitle.hidden = YES;
    _curveView.hidden = YES;
}

- (void)showLabel
{
    self.momlab.hidden = NO;
    self.yearlab.hidden = NO;
    self.alllab.hidden = NO;
    self.percentlab.hidden = NO;
    self.namelab.hidden = NO;
    self.pricelab.hidden = NO;
    self.bg.hidden = NO;
    self.icon.hidden = NO;
    self.iconbg.hidden = NO;
    self.mytitle.hidden = NO;
    _curveView.hidden = NO;
}

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
    self.titlelab.text = @"消 费 统 计";
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];
    self.daybtn.selected = YES;
    
    _curveView = [[CurveView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-100-44-20, 320, 100)];
    [self.view addSubview:_curveView];
    
    [self.view addSubview:self.toolView];

    self.tabView.tableHeaderView = self.tabtoolView;

    _type = Statis_type_day;
    [self refushView];
    
    [self initdata];
    // Do any additional setup after loading the view from its nib.
}

- (void)initdata
{
    if (_type == Statis_type_day) {
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[MHFileTool getResourcesFile:@"statis.plist"]];
        dayArr = [dict objectForKey:@"day"];
    }
}

- (void)refushView
{
    if (_type == Statis_type_day) {
        [self hiddenLabel];
        self.tabView.hidden = NO;
        self.foodbtn.hidden = YES;
        self.trafficbtn.hidden = YES;
        self.cosmeticbtn.hidden = YES;
        self.travelbtn.hidden = YES;
        self.toolView.hidden = YES;
        
//        self.toolView.frame = CGRectMake(0, 0, 320, 74);
    } else if (_type == Statis_type_zhou) {
        [self showLabel];
        self.tabView.hidden = YES;
        self.foodbtn.hidden = NO;
        self.trafficbtn.hidden = NO;
        self.cosmeticbtn.hidden = NO;
        self.travelbtn.hidden = YES;
        self.toolView.hidden = NO;

        [self.foodbtn setImage:[UIImage imageNamed:@"statiszhoug.png"]
                      forState:UIControlStateNormal];
        [self.trafficbtn setImage:[UIImage imageNamed:@"statiszhoub.png"]
                      forState:UIControlStateNormal];
        [self.cosmeticbtn setImage:[UIImage imageNamed:@"statiszhouy.png"]
                      forState:UIControlStateNormal];
        [_curveView setImage:[UIImage imageNamed:@"statiscurvezhou.png"] type:1];
        
    } else if (_type == Statis_type_mom) {
        [self showLabel];
        self.tabView.hidden = YES;
        self.foodbtn.hidden = NO;
        self.trafficbtn.hidden = NO;
        self.cosmeticbtn.hidden = NO;
        self.travelbtn.hidden = YES;
        self.toolView.hidden = NO;

        [self.foodbtn setImage:[UIImage imageNamed:@"statismomg.png"]
                      forState:UIControlStateNormal];
        [self.trafficbtn setImage:[UIImage imageNamed:@"statismomb.png"]
                         forState:UIControlStateNormal];
        [self.cosmeticbtn setImage:[UIImage imageNamed:@"statismomy.png"]
                          forState:UIControlStateNormal];
        [_curveView setImage:[UIImage imageNamed:@"statiscurvemom.png"] type:2];

//        [self.view addSubview:self.toolView];
    } else if (_type == Statis_type_year) {
        [self showLabel];
        self.tabView.hidden = YES;
        self.foodbtn.hidden = NO;
        self.trafficbtn.hidden = NO;
        self.cosmeticbtn.hidden = NO;
        self.travelbtn.hidden = NO;
        self.toolView.hidden = NO;

        [self.foodbtn setImage:[UIImage imageNamed:@"statisyearg.png"]
                      forState:UIControlStateNormal];
        [self.trafficbtn setImage:[UIImage imageNamed:@"statisyearb.png"]
                         forState:UIControlStateNormal];
        [self.cosmeticbtn setImage:[UIImage imageNamed:@"statisyeary.png"]
                          forState:UIControlStateNormal];
        [self.travelbtn setImage:[UIImage imageNamed:@"statisyearo.png"]
                          forState:UIControlStateNormal];
        [_curveView setImage:[UIImage imageNamed:@"statiscurveyear.png"] type:3];

//        [self.view addSubview:self.toolView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - BtnAction
- (void)backBtnAction:(id)sender
{
//    [self dismissViewControllerAnimated:YES completion:^{
//        
//    }];
    [self.navigationController popViewControllerAnimated:YES];
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
            _type = Statis_type_day;
            break;
        case 1:
            self.zhoubtn.selected = YES;
            _type = Statis_type_zhou;
            break;
        case 2:
            self.mombtn.selected = YES;
            _type = Statis_type_mom;
            break;
        case 3:
            self.yearbtn.selected = YES;
            _type = Statis_type_year;
            break;
 
        default:
            break;
    }
    [self refushView];
}

- (IBAction)statisBtnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 0:
            //food
            self.iconbg.image = [UIImage imageNamed:@"statisicong.png"];
            self.icon.image = [UIImage imageNamed:@"statisfood.png"];
            self.namelab.text = @"餐饮";
            break;
        case 1:
            //traffic
            self.iconbg.image = [UIImage imageNamed:@"statisiconb.png"];
            self.icon.image = [UIImage imageNamed:@"statistraffic.png"];
            self.namelab.text = @"交通";
            break;
        case 2:
            //cosmetic
            self.iconbg.image = [UIImage imageNamed:@"statisicony.png"];
            self.icon.image = [UIImage imageNamed:@"statistcos.png"];
            self.namelab.text = @"化妆品";
            break;
        case 3:
            //travel
            self.iconbg.image = [UIImage imageNamed:@"statisicono.png"];
            self.icon.image = [UIImage imageNamed:@"statistravel.png"];
            self.namelab.text = @"旅游";
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
    return 195.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"BuyViewCell";
    StatisCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[StatisCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell reloadData:[dayArr objectAtIndex:indexPath.row]
               index:indexPath.row
                type:1];
    return cell;
}

@end
