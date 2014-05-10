//
//  CurveView.m
//  testbiye
//
//  Created by qupengbin on 14-5-10.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "CurveView.h"

@interface CurveView()
{
    UIImageView *_image;
    UIScrollView *_scroll;
}

@end

@implementation CurveView

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
    _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 85)];
    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.showsVerticalScrollIndicator = NO;
    [self addSubview:_scroll];
    
    _image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 640, 85)];
    [_scroll addSubview:_image];
    _scroll.contentSize = CGSizeMake(640, 85);
}

- (void)setImage:(UIImage *)img
{
    _image.image = img;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
