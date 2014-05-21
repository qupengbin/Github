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
    int _nowpage;
    UIScrollView *_scroll;
    NSMutableArray *pagesView;
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
    self.backgroundColor = [UIColor whiteColor];
    
    _scroll = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scroll.delegate = self;
    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.showsVerticalScrollIndicator = NO;
    [self addSubview:_scroll];

    if (pagesView == nil) {
        pagesView = [[NSMutableArray alloc] init];
    }
    
    for (int i = 0 ; i < 5; i ++) {
        HelpView *help = [[HelpView alloc] initWithFrame:CGRectMake(0, 568*i, 320, 568)];
        [help reloadData:i];
        [_scroll addSubview:help];
        [pagesView addObject:help];
    }
    [_scroll setContentSize:CGSizeMake(320, 568*6)];
    _scroll.pagingEnabled = YES;
    
    _nowpage = 0;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float offset = scrollView.contentOffset.y / _scroll.frame.size.height;
    NSInteger page = (int)(offset);
    
    if (page<pagesView.count-1) {
        HelpView *help1 = (HelpView *)[pagesView objectAtIndex:page+1];
        [help1 changeframePrcent:offset-page];
        [help1 changeViewImage:page+1];
    }
    if (page<pagesView.count-1) {
        HelpView *help = (HelpView *)[pagesView objectAtIndex:page];
        [help changeframeLastPrcent:offset-page];
    }
    
    self.alpha = ((_scroll.frame.size.height*5)-_scroll.contentOffset.y)/_scroll.frame.size.height;
}


@end
