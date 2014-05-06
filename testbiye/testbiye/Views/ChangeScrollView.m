//
//  ChangeScrollView.m
//  testbiye
//
//  Created by qupengbin on 14-5-6.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "ChangeScrollView.h"

@interface ChangeScrollView()<UIScrollViewDelegate>
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
             image:(UIImage *)image
{
    float w = image.size.width;
    float h = image.size.height;
    
    for (int i = 0; i < arr.count; i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
        [_scroll addSubview:img];
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
