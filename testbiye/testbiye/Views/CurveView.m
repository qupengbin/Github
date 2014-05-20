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
    
    UIImageView *_dian;

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
    self.backgroundColor = [UIColor clearColor];
    
    _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 85)];
    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.showsVerticalScrollIndicator = NO;
    _scroll.backgroundColor = [UIColor clearColor];
    [self addSubview:_scroll];
    
    _image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 640, 85)];
    [_scroll addSubview:_image];
    _scroll.contentSize = CGSizeMake(640, 85);
    
    _infobg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 36, 18)];
    _infobg.image = [UIImage imageNamed:@"curveinfobg.png"];
    _infobg.backgroundColor = [UIColor clearColor];
    _infobg.hidden = YES;
    [_scroll addSubview:_infobg];
    
    _info = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 38, 12)];
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
    
    _dian = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
    _dian.image = [UIImage imageNamed:@"curvedianimg.png"];
    _dian.hidden = YES;
//    [_scroll addSubview:_dian];
}

- (void)btnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    float distance = 640.0f/30.0f;
    int y = [[_pointArr objectAtIndex:btn.tag] intValue];
    _infobg.frame = CGRectMake(distance*btn.tag+10-18, y-18, 36, 18);
    _dian.frame = CGRectMake(distance*btn.tag+10-1, y-1, 8, 8);
    _infobg.hidden = NO;
    _dian.hidden = NO;
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
    _infobg.hidden = YES;
    _dian.hidden = YES;

}

@end
