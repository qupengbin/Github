//
//  InPutView.m
//  testbiye
//
//  Created by qupengbin on 14-5-24.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "InPutView.h"

@interface InPutView()<UITextFieldDelegate>
{
    UITextField *searchField;
}

@end

@implementation InPutView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initview];
    }
    return self;
}

- (void)initview
{
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    bg.image = [UIImage imageNamed:@"inputviewbg.png"];
    [self addSubview:bg];
    
    UIImageView *bound = [[UIImageView alloc] initWithFrame:CGRectMake((320-242)/2, (40-26)/2, 242, 26)];
    bound.image = [UIImage imageNamed:@"inputviewbound.png"];
    [self addSubview:bound];

    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(8, (40-23)/2, 23, 23)];
    [btn1 setImage:[UIImage imageNamed:@"inputviewbiao.png"]
          forState:UIControlStateNormal];
    [self addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(320-8-23, (40-23)/2, 23, 23)];
    [btn2 setImage:[UIImage imageNamed:@"inputviewadd.png"]
          forState:UIControlStateNormal];
    [self addSubview:btn2];
    
    btn1.tag = 100;
    btn2.tag = 200;
    [btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    searchField = [[UITextField alloc] initWithFrame:CGRectMake((320-222)/2, (40-26)/2, 222, 26)];
    searchField.borderStyle = UITextBorderStyleNone;
    searchField.backgroundColor = [UIColor clearColor];
    searchField.font = [UIFont systemFontOfSize:14.0f];
    [self addSubview:searchField];
    searchField.delegate = self;
    searchField.placeholder = @"说点什么";
}

- (void)btnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if (btn.tag == 100) {
        //biaoqing
        if (self.delegate && [self.delegate respondsToSelector:@selector(biaoqingFunction)]) {
            [self.delegate biaoqingFunction];
        }

    } else if (btn.tag == 200) {
        //add
        [searchField resignFirstResponder];
        if (self.delegate && [self.delegate respondsToSelector:@selector(addFunction)]) {
            [self.delegate addFunction];
        }
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(beginInput)]) {
        [self.delegate beginInput];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (self.delegate && [self.delegate respondsToSelector:@selector(endInput)]) {
        [self.delegate endInput];
    }
    return YES;
}

@end
