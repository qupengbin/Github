//
//  HelpView.m
//  testtest
//
//  Created by qupengbin on 14-5-15.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "HelpView.h"
@interface HelpView()
{
    UILabel *_title1;
    UILabel *_title2;
    UILabel *_title3;
    UILabel *_title4;
    UILabel *_title5;

    UIImageView *dian1;
    UIImageView *dian2;
    UIImageView *dian3;
    UIImageView *dian4;
    UIImageView *dian5;

    UIImageView *arrow; //箭头
    
    UIImageView *bgimg;
    
    UIImageView *lineimg;
}

@end
@implementation HelpView

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
    arrow = [[UIImageView alloc] initWithFrame:CGRectMake((320-23)/2, 100, 23, 12)];
    [self addSubview:arrow];
    
    bgimg = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:bgimg];
    
    lineimg = [[UIImageView alloc] initWithFrame:CGRectMake((320-0.5)/2, 0, 0.5, 568)];
    lineimg.backgroundColor = [UIColor grayColor];
    [self addSubview:lineimg];
    
    _title1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 100, 30)];
    _title2 = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 100, 30)];
    _title3 = [[UILabel alloc] initWithFrame:CGRectMake(30, 300, 100, 30)];
    _title4 = [[UILabel alloc] initWithFrame:CGRectMake(200, 400, 100, 30)];
    _title5 = [[UILabel alloc] initWithFrame:CGRectMake(30, 500, 100, 30)];

    _title1.backgroundColor = [UIColor blueColor];
    _title2.backgroundColor = [UIColor blueColor];
    _title3.backgroundColor = [UIColor blueColor];
    _title4.backgroundColor = [UIColor blueColor];
    _title5.backgroundColor = [UIColor blueColor];

    [self addSubview:_title1];
    [self addSubview:_title2];
    [self addSubview:_title3];
    [self addSubview:_title4];
    [self addSubview:_title5];
    
    for (int i = 0; i < 5; i++) {
        UIImageView *dian = [[UIImageView alloc] initWithFrame:CGRectMake((320-10)/2, 80*i+100, 10, 10)];
        dian.backgroundColor = [UIColor lightGrayColor];
        dian.layer.masksToBounds = YES;
        dian.layer.cornerRadius = 5.0f;
        dian.layer.borderWidth = 1.0f;
        dian.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        dian.tag = 100+i;
        [self addSubview:dian];
    }
}

- (void)reloadData:(int)index
{
    bgimg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",index+1]];
    
    switch (index) {
        case 0:
            lineimg.frame = CGRectMake((320-0.5)/2, 100, 0.5, 568-100);

            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;

        default:
            break;
    }
}

- (void)startAnimation
{
    for (UIImageView *vi in self.subviews) {
        if ([vi isKindOfClass:[UIImageView class]]) {
            switch (vi.tag) {
                case 100:
                    
                    break;
                case 101:
                    
                    break;
                case 102:
                    
                    break;
                case 103:
                    
                    break;
                case 104:
                    
                    break;

                default:
                    break;
            }
        }
    }
}

@end
