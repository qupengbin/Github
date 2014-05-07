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
    UIImage *_image;
    UIImageView *iconimg;
}

- (void)reloadData:(NSString *)title index:(int)index;

//变小
- (void)refrushSmall;
//平常
- (void)refrushNomal;

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
    
    UIButton *btn = [[UIButton alloc] initWithFrame:self.bounds];
    [btn addTarget:self
            action:@selector(btnAction:)
  forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}

- (void)reloadData:(NSString *)title index:(int)index
{
    self.tag = index;
}

//变小
- (void)refrushSmall
{
    float w = _image.size.width-50;
    float h = _image.size.height-50;
    iconimg.frame = CGRectMake((self.frame.size.width-w)/2, (self.frame.size.height-h)/2, w, h);
}

//平常
- (void)refrushNomal
{
    float w = _image.size.width;
    float h = _image.size.height;
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

- (void)reloadData:(NSArray *)arr icon:(NSString *)icon
{
    for (int i = 0; i < arr.count; i++) {
        ChangeView *view = [[ChangeView alloc] initWithFrame:CGRectMake(i*160, 0, 160, self.frame.size.height) image:[UIImage imageNamed:icon]];
        view.backgroundColor = [UIColor clearColor];
        [view reloadData:@"a" index:i];
        view.delegate = self;
        [_scroll addSubview:view];
    }
    _scroll.contentSize = CGSizeMake(160*arr.count, 160);
}

- (void)changeViewToIndex:(int)index
{
    for (UIView *vi in _scroll.subviews) {
        if ([vi isKindOfClass:[ChangeView class]]) {
            ChangeView *change = (ChangeView *)vi;
            [change refrushSmall];
            if (change.tag == index) {
                [change refrushNomal];
                NSLog(@"change.center.x   %f",change.center.x);
                [_scroll scrollRectToVisible:CGRectMake(change.center.x, 0, change.frame.size.width, change.frame.size.height) animated:YES];
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
                [change refrushNomal];
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
