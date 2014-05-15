//
//  HelpInView.m
//  testtest
//
//  Created by qupengbin on 14-5-15.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "HelpInView.h"
#import "HelpView.h"

@interface HelpInView()<UIScrollViewDelegate>
{
    UIScrollView *_scroll;
}

@end

@implementation HelpInView

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
    _scroll.delegate = self;
    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.showsVerticalScrollIndicator = NO;
    [self addSubview:_scroll];

    for (int i = 0 ; i < 4; i ++) {
        HelpView *help = [[HelpView alloc] initWithFrame:CGRectMake(0, 568*i, 320, 568)];
        [help reloadData:i];
        [_scroll addSubview:help];
    }
    [_scroll setContentSize:CGSizeMake(320, 568*4)];
    _scroll.pagingEnabled = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    float offset = scrollView.contentOffset.y / _scroll.frame.size.height;
//    NSInteger page = (int)(offset);
//    
//    self.alpha = ((_scroll.frame.size.height*3)-_scroll.contentOffset.y)/_scroll.frame.size.height;
}

@end
