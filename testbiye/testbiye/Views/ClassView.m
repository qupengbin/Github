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
        
    }
    return self;
}

- (void)initdata
{
    if (dataArr == nil) {
        dataArr = [[NSMutableArray alloc] init];
    }
    
    [dataArr removeAllObjects];
    
    if (nowType == 1) {
        [dataArr addObjectsFromArray:@[@"全部分类",@"综合商场",@"服饰鞋帽",@"便利超市",@"食品茶酒",@"化妆品",@"家具家居",@"数码家电",@"珠宝饰品",@"书店",@"眼镜店",@"药店",@"鲜花店",@"文化用品",@"更多"]];
    } else if (nowType == 2) {
        [dataArr addObjectsFromArray:@[@"全部分类",@"火锅",@"自助餐",@"西餐",@"日韩料理",@"蛋糕甜点",@"小吃快餐",@"咖啡酒吧",@"其它美食"]];
    }
}

- (void)initview
{
    self.backgroundColor = [UIColor whiteColor];
    
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:_scrollView];
    }
    
    float distance = 320/4;
    for (int i = 0; i < dataArr.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(distance*i, 0, distance, 40)];
        btn.tag = i+BTNTAG;
        btn.backgroundColor = [UIColor clearColor];
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:RGBCOLOR(25.0f, 188.0f, 149.0f) forState:UIControlStateSelected];

        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:[dataArr objectAtIndex:i] forState:UIControlStateNormal];

        [_scrollView addSubview:btn];
        if (i == 0) {
            btn.selected = YES;
        }
    }
    _scrollView.contentSize = CGSizeMake(distance*dataArr.count, 40);

    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 39, 320, 1)];
    [self addSubview:img];
    img.backgroundColor = [UIColor lightGrayColor];
}

- (void)setClassType:(int)type
{
    nowType = type;
    [self initdata];
    [self initview];
}

- (void)btnAction:(id)sender
{
    for (UIButton *btn in _scrollView.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.selected = NO;
        }
    }
    
    UIButton *btn = (UIButton *)sender;
    btn.selected = YES;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(classViewTapAction:)]) {
        [self.delegate classViewTapAction:sender];
    }
}

@end
