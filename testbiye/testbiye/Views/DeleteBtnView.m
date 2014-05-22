//
//  DeleteBtnView.m
//  testbiye
//
//  Created by qupengbin on 14-5-22.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "DeleteBtnView.h"

@interface DeleteBtnView()
{
    UIButton *_btn;
    UIButton *_delBtn;
}

@end

@implementation DeleteBtnView

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
    _btn = [[UIButton alloc] initWithFrame:self.bounds];
    [self addSubview:_btn];
    
    _delBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    _delBtn.backgroundColor = [UIColor redColor];
    [_delBtn addTarget:self
                action:@selector(deleteBtnAction:)
      forControlEvents:UIControlEventTouchUpInside];
    _delBtn.hidden = YES;
    [self addSubview:_delBtn];
    
    UILongPressGestureRecognizer *longpress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureAction:)];
    [self addGestureRecognizer:longpress];
}

- (void)reloadData:(NSString *)image index:(int)index
{
    [_btn setImage:[UIImage imageNamed:image]
          forState:UIControlStateNormal];
    _btn.tag = index;
}

- (void)delBtnAddTarget:(id)target
                 action:(SEL)action
       forControlEvents:(UIControlEvents)controlEvents
{
    [_btn addTarget:target
             action:action
   forControlEvents:controlEvents];
}

#pragma mark - Animation

- (void)whileAnimation1
{
    [UIView animateWithDuration:0.1f animations:^{
        _btn.transform=CGAffineTransformMakeRotation(M_PI/-20);
    } completion:^(BOOL finished) {
        //这是会不停循环的animation
        [self whileAnimation2];
    }];
}

- (void)whileAnimation2
{
    [UIView animateWithDuration:0.1f animations:^{
        _btn.transform=CGAffineTransformMakeRotation(M_PI/20);
    } completion:^(BOOL finished) {
        //这是会不停循环的animation
        [self whileAnimation1];
    }];
}

- (void)startAnimation
{
    [self whileAnimation1];
}

#pragma mark - Action
- (void)longPressGestureAction:(id)sender
{
    _delBtn.hidden = NO;
    [self startAnimation];
}

- (void)btnAction:(id)sender
{
    
}

- (void)deleteBtnAction:(id)sender
{
    [self removeFromSuperview];
}

@end
