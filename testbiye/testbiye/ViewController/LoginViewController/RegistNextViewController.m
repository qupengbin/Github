//
//  RegistNextViewController.m
//  testbiye
//
//  Created by qupengbin on 14-4-28.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "RegistNextViewController.h"
#import "RegistSureViewController.h"

@interface RegistNextViewController ()<UITextFieldDelegate>

@property(nonatomic,weak) IBOutlet UILabel *numberlab;

@end

@implementation RegistNextViewController

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

- (void)setNumber:(NSString *)str
{
    self.numberlab.text = str;
}

#pragma mark - UIButtonAction
- (void)backBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)commitBtnAction:(id)sender
{
    RegistSureViewController *sureView = [[RegistSureViewController alloc] initWithNibName:@"RegistSureViewController" bundle:nil];
    [self.navigationController pushViewController:sureView animated:YES];
}

@end
