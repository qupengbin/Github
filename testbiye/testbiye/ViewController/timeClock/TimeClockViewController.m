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
    [self rightItem:[UIImage imageNamed:@"timeclockdelete.png"] sel:@selector(timeClockDeleteBtnAction:)];

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
