//
//  MyIndentViewController.m
//  testbiye
//
//  Created by qupengbin on 14-5-6.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "MyIndentViewController.h"
#import "MapViewController.h"

@interface MyIndentViewController ()<UITextFieldDelegate>

@property(nonatomic,weak) IBOutlet UITextField *timeField;

@end

@implementation MyIndentViewController

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
    self.titlelab.text = @"我 的 订 单";
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];
    [self rightItem:[UIImage imageNamed:@"alertedit.png"] sel:@selector(editBtnAction:)];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - BtnAction
- (void)editBtnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    self.timeField.userInteractionEnabled = !btn.selected;
    btn.selected = !btn.selected;
}

- (IBAction)changeAddress:(id)sender
{
    MapViewController *map = [[MapViewController alloc] init];
    [self.navigationController pushViewController:map animated:YES];
}

- (void)backBtnAction:(id)sender
{
    if (self.type == 1) {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    } else if (self.type == 2)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
