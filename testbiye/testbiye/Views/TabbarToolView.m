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
    
    UIImageView *_bg;
    UIImageView *_icon;
    
    NSTimer *_timer;
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
    
//    NSArray *arr =@[@"购 物",@"餐 饮",@"路 线",
//                    @"一 天",@"附 近",@"去 哪",
//                    @"闹 铃",@"运 动",@"更 多",];
    
    _bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 49)];
    _bg.image = [UIImage imageNamed:@"tabbgimg.png"];
    [self addSubview:_bg];
    _bg.alpha = 0.0f;
    
    _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 49)];
    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.showsVerticalScrollIndicator = NO;
    
    [self addSubview:_scroll];
    
    for (int i = 0; i < 9; i ++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(distance*(i+1)+25*i, 0, 25, 48)];
        NSString *img = [NSString stringWithFormat:@"tabicon%d.png",i+1];
        NSString *img1 = [NSString stringWithFormat:@"tabiconsel%d.png",i+1];
        [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:img1] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [_scroll addSubview:btn];
        
    }
    
    [_scroll setContentSize:CGSizeMake((320/5)*9-25, 49)];
    _scroll.alpha = 0.0f;
    
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

- (void)starttimer
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:5.0f
                                              target:self
                                            selector:@selector(setTabbarToolHidden)
                                            userInfo:nil
                                             repeats:NO];
}

- (void)btnAction:(id)sender
{
    for (UIButton *btn in _scroll.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.selected = NO;
        }
    }
    UIButton *btn = (UIButton *)sender;
    btn.selected = YES;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(TabbarToolSelectIndex:)]) {
        [self.delegate TabbarToolSelectIndex:sender];
    }
}

- (void)setTabbarToolHidden
{
    [UIView animateWithDuration:0.5f animations:^{
        _icon.alpha = 1.0f;
        _btn.alpha = 1.0f;
        _bg.alpha = 0.0f;
        _scroll.alpha = 0.0f;
        _btn.selected = NO;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if (!btn.selected) {
        
        [UIView animateWithDuration:0.5f animations:^{
            _icon.alpha = 0.0f;
            _btn.alpha = 0.0f;
            _bg.alpha = 1.0f;
            _scroll.alpha = 1.0f;
        } completion:^(BOOL finished) {
            
        }];

        [self starttimer];
    }
    btn.selected = !btn.selected;
    
}

@end
