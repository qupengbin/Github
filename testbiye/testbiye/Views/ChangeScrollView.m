//
//  ChangeScrollView.m
//  testbiye
//
//  Created by qupengbin on 14-5-6.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "ChangeScrollView.h"

@interface ChangeView()
{
    int _type;
    UIImage *_image;
    UILabel *_momlab;
    UILabel *_titlelab;
    UIImageView *iconimg;
}

- (void)reloadData:(NSString *)title
             index:(int)index
              type:(int)type;

//变小
- (void)refrushSmall;
//平常
- (void)refrushNomal:(int)index;

@end

@implementation ChangeView

- (id)initWithFrame:(CGRect)frame image:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initview:image];
    }
    return self;
}

- (void)initview:(UIImage *)image
{
    _image = image;
    float w = image.size.width-50;
    float h = image.size.height-50;
    
    iconimg = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width-w)/2, (self.frame.size.height-h)/2, w, h)];
    iconimg.backgroundColor = [UIColor clearColor];
    iconimg.image = image;
    [self addSubview:iconimg];
    
    _titlelab = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width-100)/2+2, 65, 100, 40)];
    [self addSubview:_titlelab];
    _titlelab.textColor = [UIColor whiteColor];
    _titlelab.textAlignment = NSTextAlignmentCenter;
    _titlelab.font = [UIFont systemFontOfSize:30.0f];
    
    _momlab = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width-100)/2, 95, 100, 30)];
    [self addSubview:_momlab];
    _momlab.textColor = [UIColor whiteColor];
    _momlab.textAlignment = NSTextAlignmentCenter;
    _momlab.font = [UIFont systemFontOfSize:12.0f];

    
    UIButton *btn = [[UIButton alloc] initWithFrame:self.bounds];
    [btn addTarget:self
            action:@selector(btnAction:)
  forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}

- (void)reloadData:(NSString *)title index:(int)index type:(int)type
{
    self.tag = index;
    _type = type;
    if (type == 1) {
        _titlelab.text = [NSString stringWithFormat:@"%d日",index+1];
        _momlab.text = @"03月";
        
        _titlelab.textColor = [UIColor whiteColor];
        _momlab.textColor = [UIColor whiteColor];
        
        _titlelab.frame = CGRectMake((self.frame.size.width-100)/2+2, 65, 100, 40);
        _momlab.frame = CGRectMake((self.frame.size.width-100)/2, 95, 100, 30);
    } else if (type == 2) {
        _titlelab.text = [NSString stringWithFormat:@"%d",index*100+index*10+10];
        _momlab.text = [NSString stringWithFormat:@"%d",index+1];

        _titlelab.textColor = RGBCOLOR(25.0f, 188.0f, 149.0f);
//        _momlab.textColor = RGBCOLOR(25.0f, 188.0f, 149.0f);

        _titlelab.frame = CGRectMake((self.frame.size.width-100)/2+2, 65, 100, 40);
        _momlab.frame = CGRectMake(18, 96, 30, 30);
    }
}

//变小
- (void)refrushSmall
{
    self.alpha = 0.7f;
    float w = _image.size.width-70;
    float h = _image.size.height-70;

    if (_type == 1) {
        _titlelab.font = [UIFont systemFontOfSize:24.0f];
        _momlab.font = [UIFont systemFontOfSize:8.0f];
        
    } else if (_type == 2) {
        _titlelab.font = [UIFont systemFontOfSize:18.0f];
        _momlab.font = [UIFont systemFontOfSize:7.0f];

        _titlelab.frame = CGRectMake((self.frame.size.width-100)/2+2, 70, 100, 40);
        _momlab.frame = CGRectMake(37, 87, 30, 30);
    }
    iconimg.frame = CGRectMake((self.frame.size.width-w)/2, (self.frame.size.height-h)/2, w, h);
}

//平常
- (void)refrushNomal:(int)index
{
    self.alpha = 1.0f;

    float w = _image.size.width;
    float h = _image.size.height;

    if (_type == 1) {
        _titlelab.font = [UIFont systemFontOfSize:32.0f];
        _momlab.font = [UIFont systemFontOfSize:12.0f];
        _titlelab.frame = CGRectMake((self.frame.size.width-100)/2+2, 60, 100, 40);

    } else if (_type == 2) {
        _titlelab.font = [UIFont systemFontOfSize:32.0f];
        _momlab.font = [UIFont systemFontOfSize:12.0f];
        
        _titlelab.frame = CGRectMake((self.frame.size.width-100)/2+2, 65, 100, 40);
        _momlab.frame = CGRectMake(18, 96, 30, 30);
    }
    iconimg.frame = CGRectMake((self.frame.size.width-w)/2, (self.frame.size.height-h)/2, w, h);
}

- (void)btnAction:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(changeViewBtnAction:)]) {
        [self.delegate changeViewBtnAction:self.tag];
    }
}

@end

@interface ChangeScrollView()<UIScrollViewDelegate,ChangeViewDelegate>
{
    UIScrollView *_scroll;
}

@end

@implementation ChangeScrollView

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
    _scroll = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scroll.backgroundColor = [UIColor clearColor];
    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.showsVerticalScrollIndicator = NO;
    [self addSubview:_scroll];
}

- (void)reloadData:(NSArray *)arr
              icon:(NSString *)icon
              type:(int)type
{
    for (int i = 0; i < arr.count; i++) {
        ChangeView *view = [[ChangeView alloc]
                            initWithFrame:CGRectMake(i*160, 0, 160, self.frame.size.height)
                            image:[UIImage imageNamed:icon]];
        view.backgroundColor = [UIColor clearColor];
        [view reloadData:[arr objectAtIndex:i] index:i type:type];
        view.delegate = self;
        [_scroll addSubview:view];
    }
    _scroll.contentSize = CGSizeMake(160*arr.count, 160);
}

- (void)changeViewToIndex:(int)index LOrR:(BOOL)LOrR
{
    for (UIView *vi in _scroll.subviews) {
        if ([vi isKindOfClass:[ChangeView class]]) {
            ChangeView *change = (ChangeView *)vi;
            [change refrushSmall];
            if (change.tag == index) {
                [change refrushNomal:index];
                if (LOrR) {
                    [_scroll scrollRectToVisible:CGRectMake(change.center.x-160, 0, change.frame.size.width, change.frame.size.height) animated:YES];
                } else {
                    [_scroll scrollRectToVisible:CGRectMake(change.center.x, 0, change.frame.size.width, change.frame.size.height) animated:YES];
                }
            }
        }
    }
}

#pragma mark - ChangeViewDelegate
- (void)changeViewBtnAction:(int)index
{
    for (UIView *vi in _scroll.subviews) {
        if ([vi isKindOfClass:[ChangeView class]]) {
            ChangeView *change = (ChangeView *)vi;
            [change refrushSmall];
            if (change.tag == index) {
                [change refrushNomal:index];
                NSLog(@"change.center.x   %f",change.center.x);
                [_scroll scrollRectToVisible:CGRectMake(change.center.x, 0, change.frame.size.width, change.frame.size.height) animated:YES];
            }
        }
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(changeScrollViewIndex:)]) {
        [self.delegate changeScrollViewIndex:index];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //滑动开始减速
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //手指离开屏幕
}


@end
