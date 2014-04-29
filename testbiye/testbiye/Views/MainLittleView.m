//
//  MainLittleView.m
//  testbiye
//
//  Created by qu on 14-4-29.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "MainLittleView.h"

@implementation MainLittleView

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
    UIImageView *icon1 = [[UIImageView alloc] initWithFrame:CGRectMake(25, (40-18)/2, 18, 18)];
    UIImageView *icon2 = [[UIImageView alloc] initWithFrame:CGRectMake(135, (40-18)/2, 18, 18)];
    UIImageView *icon3 = [[UIImageView alloc] initWithFrame:CGRectMake(238, (40-18)/2, 18, 18)];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, (40-20)/2, 50, 20)];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(160, (40-20)/2, 50, 20)];
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(260, (40-20)/2, 50, 20)];
    
    label1.backgroundColor = [UIColor clearColor];
    label2.backgroundColor = [UIColor clearColor];
    label3.backgroundColor = [UIColor clearColor];
    label1.font = [UIFont systemFontOfSize:12.0f];
    label2.font = [UIFont systemFontOfSize:12.0f];
    label3.font = [UIFont systemFontOfSize:12.0f];
    label1.textColor = [UIColor lightGrayColor];
    label2.textColor = [UIColor lightGrayColor];
    label3.textColor = [UIColor lightGrayColor];

    label1.text = @"天 气";
    label2.text = @"活 动";
    label3.text = @"购物车";

    icon1.image = [UIImage imageNamed:@"weather.png"];
    icon2.image = [UIImage imageNamed:@"timeicon.png"];
    icon3.image = [UIImage imageNamed:@"shopcaricon.png"];

    [self addSubview:icon1];
    [self addSubview:icon2];
    [self addSubview:icon3];
    [self addSubview:label1];
    [self addSubview:label2];
    [self addSubview:label3];

    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-6, 320, 1)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
    
    UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake((320/3)-1, (40-20)/2, 1, 20)];
    line1.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line1];
    
    
    float distance = (320/3);
    
    UIImageView *line2 = [[UIImageView alloc] initWithFrame:CGRectMake((320/3)*2-1, (40-20)/2, 1, 20)];
    line2.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line2];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, distance, 45)];
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(distance, 0, distance, 45)];
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(distance*2, 0, distance, 45)];
    btn1.tag = 100;
    btn2.tag = 200;
    btn3.tag = 300;
    
    [btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:btn1];
    [self addSubview:btn2];
    [self addSubview:btn3];
}

- (void)btnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if (self.delegate && [self.delegate respondsToSelector:@selector(MainLittleAction:)]) {
        [self.delegate MainLittleAction:btn.tag];
    }
}

@end
