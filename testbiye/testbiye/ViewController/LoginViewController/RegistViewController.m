//
//  RegistViewController.m
//  testbiye
//
//  Created by qupengbin on 14-4-27.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "RegistViewController.h"
#import "RegistNextViewController.h"

@interface RegistViewController ()<UITextFieldDelegate>

@property(nonatomic,weak) IBOutlet UITextField *numberField;

@end

@implementation RegistViewController

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

#pragma mark - BtnAction
- (void)backBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)registAction:(id)sender
{
    RegistNextViewController *nextView = [[RegistNextViewController alloc] initWithNibName:@"RegistNextViewController" bundle:nil];
    [self.navigationController pushViewController:nextView animated:YES];
    NSLog(@"self.numberField.text %@",self.numberField.text);
    NSString *str = [NSString stringWithFormat:@"验证码短信已发送到%@",self.numberField.text];
    [nextView setNumber:str];
}

@end
