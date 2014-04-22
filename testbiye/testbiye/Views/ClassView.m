//
//  ClassView.m
//  testbiye
//
//  Created by qupengbin on 14-4-22.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "ClassView.h"

#define BTNTAG 1000

@implementation ClassView

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
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
        [self addSubview:_scrollView];
    }
    
    float distance = 320/4;
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(distance*i, 0, distance, 30)];
        btn.tag = i+BTNTAG;
        btn.backgroundColor = [UIColor clearColor];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        switch (i) {
            case 0:
                [btn setTitle:@"全部分类" forState:UIControlStateNormal];
                break;
            case 1:
                [btn setTitle:@"综合商场" forState:UIControlStateNormal];
                break;
            case 2:
                [btn setTitle:@"服饰鞋帽" forState:UIControlStateNormal];
                break;
            case 3:
                [btn setTitle:@"便利超市" forState:UIControlStateNormal];
                break;

            default:
                break;
        }
        [_scrollView addSubview:btn];
    }
}

- (void)btnAction:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(classViewTapAction:)]) {
        [self.delegate classViewTapAction:sender];
    }
}

@end
