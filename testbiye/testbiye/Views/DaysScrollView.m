//
//  DaysScrollView.m
//  testbiye
//
//  Created by qupengbin on 14-5-6.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "DaysScrollView.h"

@interface DayButton()
{
    UILabel *_day;  //天
    UILabel *_xin;  //星期
    UIButton *_btn;
    UIImageView *_selimg;
    UIImageView *_bgimg;
}

- (void)reloadData:(NSString *)day
               xin:(NSString *)xin
             index:(int)index;

@end

@implementation DayButton

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
    float distance = 320/7;
    
    _day = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, distance, 20)];
    _day.backgroundColor = [UIColor clearColor];
    _day.textColor = [UIColor lightGrayColor];
    _day.font = [UIFont systemFontOfSize:10.0f];
    [self addSubview:_day];
    
    _xin = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, distance, 20)];
    _xin.backgroundColor = [UIColor clearColor];
    _xin.textColor = [UIColor lightGrayColor];
    _xin.font = [UIFont systemFontOfSize:10.0f];
    [self addSubview:_xin];

    _day.textAlignment = NSTextAlignmentCenter;
    _xin.textAlignment = NSTextAlignmentCenter;

    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-10, distance, 0.5f)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
    
    _bgimg = [[UIImageView alloc] initWithFrame:CGRectMake((distance-6)/2, self.frame.size.height-10-3+0.5, 6, 6)];
    _bgimg.backgroundColor = [UIColor lightGrayColor];
    _bgimg.layer.masksToBounds = YES;
    _bgimg.layer.cornerRadius = 3.0f;
    _bgimg.layer.borderWidth = 1.0f;
    _bgimg.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    [self addSubview:_bgimg];

    _selimg = [[UIImageView alloc] initWithFrame:CGRectMake((distance-18)/2, self.frame.size.height-10-9, 18, 18)];
    _selimg.backgroundColor = [UIColor clearColor];
    _selimg.hidden = YES;
    _selimg.image = [UIImage imageNamed:@"dayselected.png"];
    [self addSubview:_selimg];

    _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, distance, self.frame.size.height)];
    _btn.backgroundColor = [UIColor clearColor];
    [_btn addTarget:self
             action:@selector(btnAction:)
   forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_btn];
}

- (void)reloadData:(NSString *)day
               xin:(NSString *)xin
             index:(int)index
{
    _day.text = day;
    _xin.text = xin;
    _btn.tag = index;
    self.tag = index;
}

- (void)hiddenSelected
{
    _selimg.hidden = YES;
    _bgimg.hidden = NO;
    _day.textColor = [UIColor lightGrayColor];
    _xin.textColor = [UIColor lightGrayColor];
}

- (void)btnAction:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(dayBtnAction:)]) {
        [self.delegate dayBtnAction:sender];
    }
    _selimg.hidden = NO;
    _bgimg.hidden = YES;
    
    _day.textColor = RGBCOLOR(25.0f, 188.0f, 149.0f);
    _xin.textColor = RGBCOLOR(25.0f, 188.0f, 149.0f);
}

@end


@interface DaysScrollView()<DayButtonDelegate>
{
    UIScrollView *_scroll;
}

@end

@implementation DaysScrollView

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
    float distance = 320/7;
    
    _scroll = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scroll.backgroundColor = [UIColor clearColor];
    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.showsVerticalScrollIndicator = NO;
    [self addSubview:_scroll];
    
    for (int i = 0; i < 30; i ++) {
        DayButton *btn = [[DayButton alloc] initWithFrame:CGRectMake(distance*i, 0, distance, 70)];
        btn.delegate = self;
        NSString *str = nil;
        switch (i%7) {
            case 0:
                str  =@"M";
                break;
            case 1:
                str  =@"T";
                break;
            case 2:
                str  =@"W";
                break;
            case 3:
                str  =@"T";
                break;
            case 4:
                str  =@"F";
                break;
            case 5:
                str  =@"S";
                break;
            case 6:
                str  =@"S";
                break;

            default:
                break;
        }
        
        [btn reloadData:[NSString stringWithFormat:@"%d",i+1]
                    xin:str
                  index:i];
        [_scroll addSubview:btn];
    }
    _scroll.contentSize = CGSizeMake(distance*30, 70);
}

- (void)dayBtnAction:(id)sender
{
    for (UIView *vi in _scroll.subviews) {
        if ([vi isKindOfClass:[DayButton class]]) {
            DayButton *btn = (DayButton *)vi;
            [btn hiddenSelected];
        }
    }
    UIButton *btn = (UIButton *)sender;
    NSLog(@"now select index %d",btn.tag);
}

@end
