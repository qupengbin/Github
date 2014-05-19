//
//  GoWhereViewController.m
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "GoWhereViewController.h"
#import "NearDetailCell.h"
#import "SearchView.h"

@interface GoWhereViewController ()<UITableViewDataSource,UITableViewDelegate,SearchViewDelegate>
{
    BOOL showsearch;
    
    SearchView *_searchView;

    UIButton *_touchBtn;
    
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
    [self rightItem:[UIImage imageNamed:@"searchicon.png"] sel:@selector(searchAction:)];

    _searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, -40, 320, 40)];
    _searchView.delegate = self;
    _searchView.hidden = YES;
    [self.view addSubview:_searchView];

    _touchBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 568-44-20-40-216)];
    [self.view addSubview:_touchBtn];
    _touchBtn.backgroundColor = [UIColor clearColor];
    [_touchBtn addTarget:self action:@selector(touchBtnAction) forControlEvents:UIControlEventTouchUpInside];
    _touchBtn.alpha = 0.3f;
    _touchBtn.hidden = YES;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - BtnAction
- (void)touchBtnAction
{
    [self searchAction:nil];
    _touchBtn.hidden = YES;
}

- (void)backBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchAction:(id)sender
{
    if (!showsearch) {
        [UIView animateWithDuration:0.3f animations:^{
            _searchView.hidden = NO;
            self.view.bounds = CGRectMake(0, -40, 320, self.view.bounds.size.height);
        } completion:^(BOOL finished) {
            [_searchView searchViewBecomeFirstResponder];
            _touchBtn.hidden = NO;
        }];
    } else {
        [UIView animateWithDuration:0.3f animations:^{
            self.view.bounds = CGRectMake(0, 0, 320, self.view.bounds.size.height);
        } completion:^(BOOL finished) {
            _searchView.hidden = YES;
            [_searchView searchViewResignFirstResponder];
            _touchBtn.hidden = YES;
        }];
    }
    showsearch = !showsearch;
}

#pragma mark - SearchViewDelegate
- (void)SearchViewReturn:(UITextField *)field
{
    [UIView animateWithDuration:0.3f animations:^{
        self.view.bounds = CGRectMake(0, 0, 320, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        [field resignFirstResponder];
    }];
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
               index:indexPath.row
                type:2];
    return cell;
}


@end
