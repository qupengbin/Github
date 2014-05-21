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
    
    UILabel *_title;
    UILabel *_price;
    
    NSArray *allData;
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
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.backgroundColor = RGBCOLOR(242, 242, 242);
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
    }
    
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-50, 320, 50)];
    bgImage.backgroundColor = [UIColor grayColor];
    bgImage.alpha = 0.5f;
    [self addSubview:bgImage];
    
    _price = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 100, 30)];
    _price.backgroundColor = [UIColor clearColor];
    _price.font = [UIFont systemFontOfSize:20.0f];
    _price.textColor = [UIColor whiteColor];
    _price.text = @"今日五折";
    [bgImage addSubview:_price];
    
    _title = [[UILabel alloc] initWithFrame:CGRectMake(20, 25, 100, 20)];
    _title.backgroundColor = [UIColor clearColor];
    _title.font = [UIFont systemFontOfSize:14.0f];
    _title.textColor = [UIColor whiteColor];
    _title.text = @"草莓奶油泡芙";
    [bgImage addSubview:_title];
    
    UILabel *buy = [[UILabel alloc] initWithFrame:CGRectMake(220, 25, 100, 20)];
    buy.backgroundColor = [UIColor clearColor];
    buy.font = [UIFont systemFontOfSize:14.0f];
    buy.textColor = [UIColor whiteColor];
    buy.text = @"立即购买";
    [bgImage addSubview:buy];

    UIImageView *buyicon = [[UIImageView alloc] initWithFrame:CGRectMake(290, 25, 19, 19)];
    buyicon.image = [UIImage imageNamed:@"buyicon.png"];
    [bgImage addSubview:buyicon];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipe];
}

- (void)reloadDataWithPictures:(NSArray *)picts infos:(NSArray *)infos
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
    
    allData = infos;
    
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
    if (index<allData.count) {
        NSDictionary *dict = [allData objectAtIndex:index];
        _price.text = [dict objectForKey:@"price"];
        _title.text = [dict objectForKey:@"title"];
    }
}

- (void)btnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(topScrollViewAction:)]) {
        [self.delegate topScrollViewAction:btn.tag-1000];
    }
}
#pragma mark - UISwipeGesture
- (void)swipeAction:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(swipeUpAction:)]) {
        [self.delegate swipeUpAction:sender];
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
    if (index<allData.count) {
        NSDictionary *dict = [allData objectAtIndex:index];
        _price.text = [dict objectForKey:@"price"];
        _title.text = [dict objectForKey:@"title"];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
}

@end
