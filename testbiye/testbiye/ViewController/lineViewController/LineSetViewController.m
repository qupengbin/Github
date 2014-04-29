//
//  LineSetViewController.m
//  testbiye
//
//  Created by qu on 14-4-29.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "LineSetViewController.h"
#import "LineMapViewController.h"

@interface LineSetViewController ()

@end

@implementation LineSetViewController

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
    self.titlelab.text = @"路 线 查 询";
    [self leftItem:[UIImage imageNamed:@"backimg.png"] sel:@selector(backBtnAction:)];

    [self rightItem:[UIImage imageNamed:@"lineclock.png"] sel:@selector(clockBtnAction:)];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - BtnAction
- (void)clockBtnAction:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"闹铃设置"
                          message:@"是否把新街口设为闹钟?"
                          delegate:nil
                          cancelButtonTitle:@"否"
                          otherButtonTitles:@"是", nil];
    [alert show];
}

- (void)backBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)nextBtnAction:(id)sender
{
    LineMapViewController *mapView = [[LineMapViewController alloc] initWithNibName:@"LineMapViewController" bundle:nil];
    [self.navigationController pushViewController:mapView animated:YES];
}

@end
