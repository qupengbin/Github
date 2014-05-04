//
//  ShareViewController.m
//  testbiye
//
//  Created by qu on 14-5-4.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancleBtnAction:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(shareCancleAction)]) {
        [self.delegate shareCancleAction];
    }
}

@end
