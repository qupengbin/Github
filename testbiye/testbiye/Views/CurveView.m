//
//  CurveView.m
//  testbiye
//
//  Created by qupengbin on 14-5-10.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "CurveView.h"
#import "MHFileTool.h"

@interface CurveView()
{
    UIImageView *_infobg;
    UILabel *_info;
    UIImageView *_image;
    UIScrollView *_scroll;
    
    NSArray *_pointArr;
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
    
    _infobg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 25)];
    _infobg.backgroundColor = [UIColor clearColor];
    [self addSubview:_infobg];
    
    _info = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 25)];
    _info.textAlignment = NSTextAlignmentCenter;
    _info.backgroundColor = [UIColor clearColor];
    _info.textColor = [UIColor blackColor];
    _info.font = [UIFont systemFontOfSize:10.0f];
    [_infobg addSubview:_info];
    
    float distance = 640.0f/30.0f;
    for (int i = 0; i < 30; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*distance, 0, distance, 85)];
        btn.tag = i;
        [btn addTarget:self
                action:@selector(btnAction:)
      forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor clearColor];
        [_scroll addSubview:btn];
    }
}

- (void)btnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    float distance = 640.0f/30.0f;
    int y = [[_pointArr objectAtIndex:btn.tag] intValue];
    _infobg.frame = CGRectMake(distance*btn.tag+10, y, 40, 25);
    _info.text = [NSString stringWithFormat:@"%d",y*10];
}

- (void)setImage:(UIImage *)img type:(int)type
{
    NSArray *arr = [NSArray arrayWithContentsOfFile:[MHFileTool getResourcesFile:@"curvey.plist"]];
    if (type == 1) {
        _pointArr = [arr objectAtIndex:0];
    } else if (type == 2) {
        _pointArr = [arr objectAtIndex:1];
    } else if (type == 3) {
        _pointArr = [arr objectAtIndex:2];
    }
    _image.image = img;
}

@end
