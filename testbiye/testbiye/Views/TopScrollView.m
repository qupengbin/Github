//
//  TopScrollView.m
//  testbiye
//
//  Created by qupengbin on 14-4-21.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "TopScrollView.h"

@interface TopScrollView()<UIScrollViewDelegate>{
    UIScrollView *_scrollView;
    NSTimer *_timer;
    int index;
    int count;
}

@end

@implementation TopScrollView

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
    index = 0;
    
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
    }
    
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-50, 320, 50)];
    bgImage.backgroundColor = [UIColor grayColor];
    bgImage.alpha = 0.5f;
    [self addSubview:bgImage];
    
    UILabel *price = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 100, 30)];
    price.backgroundColor = [UIColor clearColor];
    price.font = [UIFont systemFontOfSize:20.0f];
    price.textColor = [UIColor whiteColor];
    price.text = @"今日五折";
    [bgImage addSubview:price];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(20, 25, 100, 20)];
    name.backgroundColor = [UIColor clearColor];
    name.font = [UIFont systemFontOfSize:14.0f];
    name.textColor = [UIColor whiteColor];
    name.text = @"草莓奶油泡芙";
    [bgImage addSubview:name];
    
    UILabel *buy = [[UILabel alloc] initWithFrame:CGRectMake(220, 25, 100, 20)];
    buy.backgroundColor = [UIColor clearColor];
    buy.font = [UIFont systemFontOfSize:14.0f];
    buy.textColor = [UIColor whiteColor];
    buy.text = @"立即购买";
    [bgImage addSubview:buy];

    UIImageView *buyicon = [[UIImageView alloc] initWithFrame:CGRectMake(290, 25, 19, 19)];
    buyicon.image = [UIImage imageNamed:@"buyicon.png"];
    [bgImage addSubview:buyicon];
    
}

- (void)reloadDataWithPictures:(NSArray *)picts infos:(NSDictionary *)infos
{
    float widht = self.bounds.size.width;
    float height = self.bounds.size.height;
    
    for (int i = 0; i < picts.count; i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(widht*i, 0, widht, height)];
        img.image = [UIImage imageNamed:[picts objectAtIndex:i]];
        [_scrollView addSubview:img];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(widht*i, 0, widht, height)];
        btn.backgroundColor = [UIColor clearColor];
        btn.tag = i+1000;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:btn];
    }
    
    count = picts.count;
    
    _scrollView.contentSize = CGSizeMake(self.bounds.size.width*picts.count, self.bounds.size.height);
    
    [self startTimer];
}


- (void)startTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(scrollSelf) userInfo:nil repeats:YES];
}

- (void)scrollSelf
{
    if (index<count) {
        index = index+1;
    } else {
        index = 0;
    }
    [_scrollView scrollRectToVisible:CGRectMake(320*(index), 0, self.bounds.size.width, self.bounds.size.height) animated:YES];
}

- (void)btnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(topScrollViewAction:)]) {
        [self.delegate topScrollViewAction:btn.tag-1000];
    }
}

#pragma mark - UIScrollView
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int x = scrollView.contentOffset.x/320;
    index = x;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
}

@end
