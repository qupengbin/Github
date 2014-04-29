//
//  RegistSureViewController.m
//  testbiye
//
//  Created by qupengbin on 14-4-28.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "RegistSureViewController.h"

@interface RegistSureViewController ()<UITextFieldDelegate>

@property(nonatomic,weak) IBOutlet UITextField *passField;
@property(nonatomic,weak) IBOutlet UITextField *passagaField;

@end

@implementation RegistSureViewController

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
    self.titlelab.text = @"注 册";
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - UIButtonAction
- (void)backBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sureBtnAction:(id)sender
{
    if (self.passField.text.length == 0) {
        [self showAlertView:@"请输入密码"];
        return;
    } else if (self.passagaField.text.length == 0) {
        [self showAlertView:@"请再次输入密码"];
        return;
    }
    
    if (![self.passagaField.text isEqualToString:self.passField.text]) {
        [self showAlertView:@"两次输入密码不相同,请重新输入"];
        return;
    }
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    });
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self sureBtnAction:nil];
    
    return YES;
}

@end
