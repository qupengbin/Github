//
//  TimeClockViewController.m
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "TimeClockViewController.h"

@interface TimeClockViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *oneArr;
    NSArray *twoArr;
}

@property(nonatomic,weak) IBOutlet UIPickerView *onePick;

@end

@implementation TimeClockViewController

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
    
    self.titlelab.text = @"乐 行 闹 钟";

    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];
//    [self rightItem:[UIImage imageNamed:@"timeclockdelete.png"] sel:@selector(timeClockDeleteBtnAction:)];

    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [btn1.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn1 setTitle:@"完成" forState:UIControlStateNormal];
//    [btn1 addTarget:self
//             action:@selector(registAction:)
//   forControlEvents:UIControlEventTouchUpInside];
    btn1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:btn1];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    self.navigationItem.rightBarButtonItem = item;
    

    oneArr = @[@"一号线南延",@"一号线",@"二号线",@"三号线",@"四号线",@"五号线",];
    twoArr = @[@"红山动物园",@"南京站",@"新模范马路",@"玄武门",@"鼓楼站",@"珠江路",@"新街口",@"三山街",@"中华门",];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - <UIPickerViewDelegate,UIPickerViewDataSource>
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    int number = 0;
    if (component == 0) {
        number = oneArr.count;
    } else {
        number = twoArr.count;
    }
    return number;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [oneArr objectAtIndex:row];
    } else {
        return [twoArr objectAtIndex:row];
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view

{
    
    UILabel *myView = nil;
    
    if (component == 0) {
        
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 30)];
        
        myView.textAlignment = NSTextAlignmentCenter;
        
        myView.text = [oneArr objectAtIndex:row];
        
        myView.font = [UIFont systemFontOfSize:18.0f];         //用label来设置字体大小
        
        myView.backgroundColor = [UIColor clearColor];
        
    }else {
        
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 180, 30)];
        
        myView.text = [twoArr objectAtIndex:row];
        
        myView.textAlignment = NSTextAlignmentCenter;
        
        myView.font = [UIFont systemFontOfSize:18.0f];
        
        myView.backgroundColor = [UIColor clearColor];
        
    }
    
    return myView;
    
}

- (CGSize)rowSizeForComponent:(NSInteger)component
{
    return CGSizeMake(160, 20);
}

#pragma mark - BtnAction
- (void)timeClockDeleteBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(deleteTimeClock:)]) {
        [self.delegate deleteTimeClock:self.index];
    }
}

- (void)backBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
