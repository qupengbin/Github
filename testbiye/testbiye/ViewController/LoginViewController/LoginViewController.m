//
//  LoginViewController.m
//  testbiye
//
//  Created by qupengbin on 14-4-27.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property(nonatomic,weak) IBOutlet UIButton *selBtn;

@end

@implementation LoginViewController

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
    self.titlelab.text = @"登 录";
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(registAction:)] ;
    self.navigationItem.rightBarButtonItem = rightItem;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButtonAction
- (void)backBtnAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)registAction:(id)sender
{
    RegistViewController *regist = [[RegistViewController alloc] initWithNibName:@"RegistViewController" bundle:nil];
    [self.navigationController pushViewController:regist animated:YES];
}

- (IBAction)selectBtnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
}

- (void)showAlertView:(NSString *)str
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:str
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark - UITextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    switch (textField.tag) {
        case 100:
            if (textField.text.length==0) {
                [self showAlertView:@"请输入用户名"];
                return YES;
            }
            break;
        case 200:
            if (textField.text.length==0) {
                [self showAlertView:@"请输入密码"];
                return YES;
            }
            break;
 
        default:
            break;
    }
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self backBtnAction:nil];
    });
    return YES;
}

@end
