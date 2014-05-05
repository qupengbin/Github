//
//  TabbarToolView.m
//  testbiye
//
//  Created by qupengbin on 14-4-22.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "TabbarToolView.h"

@interface TabbarToolView()
{
    UIScrollView *_scroll;
    
    UIButton *_btn;
    
    UIImageView *_icon;
}

@end

@implementation TabbarToolView

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
    float distance = (320-25*5)/6;
    
    NSArray *arr =@[@"购 物",@"餐 饮",@"路 线",
                    @"一 天",@"附 近",@"去 哪",
                    @"闹 铃",@"运 动",@"更 多",];
    
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 49)];
    bg.image = [UIImage imageNamed:@"tabbgimg.png"];
    [self addSubview:bg];
    
    _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 49)];
    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.showsVerticalScrollIndicator = NO;
    
    [self addSubview:_scroll];
    
    for (int i = 0; i < 9; i ++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(distance*(i+1)+25*i, 8, 25, 22)];
        NSString *img = [NSString stringWithFormat:@"tabicon%d.png",i+1];
        [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [_scroll addSubview:btn];
        
        UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(distance*(i+1)+25*i, 27, 25, 22)];
        [_scroll addSubview:name];
        name.backgroundColor = [UIColor clearColor];
        name.textColor = [UIColor lightGrayColor];
        name.font = [UIFont systemFontOfSize:10.0];
        name.text = [arr objectAtIndex:i];
    }
    
    [_scroll setContentSize:CGSizeMake((320/5)*9-25, 49)];
    _scroll.hidden = YES;
    
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 49)];
    [_btn addTarget:self
             action:@selector(showAction:)
   forControlEvents:UIControlEventTouchUpInside];
    _btn.backgroundColor = [UIColor clearColor];
    [self addSubview:_btn];
    
    _icon = [[UIImageView alloc] initWithFrame:CGRectMake((320-37)/2, (49-7)/2, 37, 7)];
    _icon.image = [UIImage imageNamed:@"tabbarshowicon.png"];
    [self addSubview:_icon];
}

/*e
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)btnAction:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(TabbarToolSelectIndex:)]) {
        [self.delegate TabbarToolSelectIndex:sender];
    }
}

- (void)showAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if (btn.selected) {
        _icon.hidden = btn.selected;
        _btn.hidden = btn.selected;
    }
    btn.selected = !btn.selected;
    
}

@end
