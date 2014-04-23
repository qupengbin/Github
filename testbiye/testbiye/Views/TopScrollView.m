//
//  TopScrollView.m
//  testbiye
//
//  Created by qupengbin on 14-4-21.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "TopScrollView.h"

@interface TopScrollView(){
    UIScrollView *scrollView;
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
    if (scrollView == nil) {
        scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        scrollView.backgroundColor = [UIColor clearColor];
        scrollView.pagingEnabled = YES;
        [self addSubview:scrollView];
    }
    
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-50, 320, 50)];
    bgImage.backgroundColor = [UIColor grayColor];
    bgImage.alpha = 0.5f;
    [self addSubview:bgImage];
    
    UILabel *price = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 100, 30)];
    price.backgroundColor = [UIColor clearColor];
    price.font = [UIFont systemFontOfSize:20.0f];
    price.textColor = [UIColor whiteColor];
    price.text = @"测试测试";
    [bgImage addSubview:price];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 100, 20)];
    name.backgroundColor = [UIColor clearColor];
    name.font = [UIFont systemFontOfSize:14.0f];
    name.textColor = [UIColor whiteColor];
    name.text = @"测试测试";
    [bgImage addSubview:name];
    
    UIButton *buyBtn = [[UIButton alloc] initWithFrame:bgImage.bounds];
    [bgImage addSubview:buyBtn];
}

- (void)reloadDataWithPictures:(NSArray *)picts infos:(NSDictionary *)infos
{
    float widht = self.bounds.size.width;
    float height = self.bounds.size.height;
    
    for (int i = 0; i < picts.count; i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(widht*i, 0, widht, height)];
        img.image = [UIImage imageNamed:[picts objectAtIndex:i]];
        [scrollView addSubview:img];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(widht*i, 0, widht, height)];
        btn.backgroundColor = [UIColor clearColor];
        btn.tag = i+1000;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:btn];
    }
    scrollView.contentSize = CGSizeMake(self.bounds.size.width*picts.count, self.bounds.size.height);
}

- (void)btnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(topScrollViewAction:)]) {
        [self.delegate topScrollViewAction:btn.tag-1000];
    }
}

@end
