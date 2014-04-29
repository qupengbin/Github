//
//  LineMapViewController.m
//  testbiye
//
//  Created by qu on 14-4-29.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "LineMapViewController.h"

@interface LineMapViewController ()<UIScrollViewDelegate>

@property(nonatomic,weak) IBOutlet UIScrollView *scroll;

@end

@implementation LineMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initializations
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titlelab.text = @"路 线 查 询";
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

@end
