//
//  HelpView.m
//  testtest
//
//  Created by qupengbin on 14-5-15.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "HelpView.h"
#import "MHFileTool.h"

#define title_W 120
#define title_H 50

#define jianH 70
#define arrowH 450

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
    
    UIImageView *iconimg;
    
    UIImageView *littleicon;
    
    UIImageView *lineimg;
    
    UIImageView *kuang;
    
    NSArray *alldata;
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
    
    alldata = [NSArray arrayWithContentsOfFile:[MHFileTool getResourcesFile:@"default.plist"]];

    arrow = [[UIImageView alloc] initWithFrame:CGRectMake((320-23)/2, 100+arrowH, 23, 12)];
    arrow.image = [UIImage imageNamed:@"arrowicon1.png"];
    [self addSubview:arrow];
    
    lineimg = [[UIImageView alloc] initWithFrame:CGRectMake((320-0.5)/2, 0, 0.5, 568)];
    lineimg.backgroundColor = [UIColor grayColor];
    [self addSubview:lineimg];
    
    dian1 = [[UIImageView alloc] initWithFrame:CGRectMake((320-8)/2, 50*0+260-jianH, 8, 8)];
    dian1.image = [UIImage imageNamed:@"defaultdian.png"];
    [self addSubview:dian1];
    
    dian2 = [[UIImageView alloc] initWithFrame:CGRectMake((320-8)/2, 50*1+260-jianH, 8, 8)];
    dian2.image = [UIImage imageNamed:@"defaultdian.png"];
    [self addSubview:dian2];
    
    dian3 = [[UIImageView alloc] initWithFrame:CGRectMake((320-8)/2, 50*2+260-jianH, 8, 8)];
    dian3.image = [UIImage imageNamed:@"defaultdian.png"];
    [self addSubview:dian3];
    
    dian4 = [[UIImageView alloc] initWithFrame:CGRectMake((320-8)/2, 50*3+260-jianH, 8, 8)];
    dian4.image = [UIImage imageNamed:@"defaultdian.png"];
    [self addSubview:dian4];
    
    dian5 = [[UIImageView alloc] initWithFrame:CGRectMake((320-8)/2, 50*4+260-jianH, 8, 8)];
    dian5.image = [UIImage imageNamed:@"defaultdian.png"];
    [self addSubview:dian5];

    kuang = [[UIImageView alloc] initWithFrame:CGRectMake((320-160)/2-33, 100-jianH, 160, 123)];
    kuang.image = [UIImage imageNamed:@"defaultbg1.png"];
    [self addSubview:kuang];
    
    iconimg = [[UIImageView alloc] initWithFrame:CGRectMake((320-57)/2, 145-jianH, 57, 57)];
    iconimg.image = [UIImage imageNamed:@"defaulticon1.png"];
    [self addSubview:iconimg];

    _title1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 250-jianH, title_W, title_H)];
    _title2 = [[UILabel alloc] initWithFrame:CGRectMake(180, 300-jianH, title_W, title_H)];
    _title3 = [[UILabel alloc] initWithFrame:CGRectMake(30, 350-jianH, title_W, title_H)];
    _title4 = [[UILabel alloc] initWithFrame:CGRectMake(180, 400-jianH, title_W, title_H)];
    _title5 = [[UILabel alloc] initWithFrame:CGRectMake(30, 450-jianH, title_W, title_H)];

    _title1.backgroundColor = [UIColor clearColor];
    _title2.backgroundColor = [UIColor clearColor];
    _title3.backgroundColor = [UIColor clearColor];
    _title4.backgroundColor = [UIColor clearColor];
    _title5.backgroundColor = [UIColor clearColor];

    _title1.numberOfLines = 2;
    _title1.font = [UIFont systemFontOfSize:16.0f];
    _title1.textColor = [UIColor lightGrayColor];
    
    _title2.numberOfLines = 2;
    _title2.font = [UIFont systemFontOfSize:16.0f];
    _title2.textColor = [UIColor lightGrayColor];
    
    _title3.numberOfLines = 2;
    _title3.font = [UIFont systemFontOfSize:16.0f];
    _title3.textColor = [UIColor lightGrayColor];
    
    _title4.numberOfLines = 2;
    _title4.font = [UIFont systemFontOfSize:16.0f];
    _title4.textColor = [UIColor lightGrayColor];
    
    _title5.numberOfLines = 2;
    _title5.font = [UIFont systemFontOfSize:16.0f];
    _title5.textColor = [UIColor lightGrayColor];

    [self addSubview:_title1];
    [self addSubview:_title2];
    [self addSubview:_title3];
    [self addSubview:_title4];
    [self addSubview:_title5];
    
    littleicon = [[UIImageView alloc] initWithFrame:CGRectMake((320-41)/2, (568-42-20)-jianH, 41, 41)];
    littleicon.image = [UIImage imageNamed:@"defaultnext1.png"];
    [self addSubview:littleicon];
}

- (void)reloadData:(int)index
{
    [self startAnimation];
    if (index == 0) {
        dian1.frame = CGRectMake((320-8)/2, 50*0+460-jianH, 8, 8);
        dian2.frame = CGRectMake((320-8)/2, 50*1+460-jianH, 8, 8);
        dian3.frame = CGRectMake((320-8)/2, 50*2+460-jianH, 8, 8);
        dian4.frame = CGRectMake((320-8)/2, 50*3+460-jianH, 8, 8);
        dian5.frame = CGRectMake((320-8)/2, 50*4+460-jianH, 8, 8);
        
        _title1.frame = CGRectMake(30, 450-jianH, title_W, title_H);
        _title2.frame = CGRectMake(180, 500-jianH, title_W, title_H);
        _title3.frame = CGRectMake(30, 550-jianH, title_W, title_H);
        _title4.frame = CGRectMake(180, 600-jianH, title_W, title_H);
        _title5.frame = CGRectMake(30, 650-jianH, title_W, title_H);

        lineimg.frame = CGRectMake((320-0.5)/2, 50, 0.5, 568-50);
        [UIView animateWithDuration:0.7f animations:^{
            dian1.frame = CGRectMake((320-8)/2, 50*0+460-200-jianH, 8, 8);
            dian2.frame = CGRectMake((320-8)/2, 50*1+460-200-jianH, 8, 8);
            dian3.frame = CGRectMake((320-8)/2, 50*2+460-200-jianH, 8, 8);
            dian4.frame = CGRectMake((320-8)/2, 50*3+460-200-jianH, 8, 8);
            dian5.frame = CGRectMake((320-8)/2, 50*4+460-200-jianH, 8, 8);
            
            _title1.frame = CGRectMake(30, 450-200-jianH, title_W, title_H);
            _title2.frame = CGRectMake(180, 500-200-jianH, title_W, title_H);
            _title3.frame = CGRectMake(30, 550-200-jianH, title_W, title_H);
            _title4.frame = CGRectMake(180, 600-200-jianH, title_W, title_H);
            _title5.frame = CGRectMake(30, 650-200-jianH, title_W, title_H);
        } completion:^(BOOL finished) {
            
        }];
    }
    
    NSArray *arr = [alldata objectAtIndex:index];
    _title1.text = [arr objectAtIndex:0];
    _title2.text = [arr objectAtIndex:1];
    _title3.text = [arr objectAtIndex:2];
    _title4.text = [arr objectAtIndex:3];
    _title5.text = [arr objectAtIndex:4];
}

- (void)changeframePrcent:(float)prcent
{
    dian1.frame = CGRectMake((320-8)/2, 50*0+760-500*prcent-jianH, 8, 8);
    dian2.frame = CGRectMake((320-8)/2, 50*1+760-500*prcent-jianH, 8, 8);
    dian3.frame = CGRectMake((320-8)/2, 50*2+760-500*prcent-jianH, 8, 8);
    dian4.frame = CGRectMake((320-8)/2, 50*3+760-500*prcent-jianH, 8, 8);
    dian5.frame = CGRectMake((320-8)/2, 50*4+760-500*prcent-jianH, 8, 8);

    _title1.frame = CGRectMake(30, 50*0+550 -300*prcent-jianH, title_W, title_H);
    _title2.frame = CGRectMake(180, 50*1+550-300*prcent-jianH, title_W, title_H);
    _title3.frame = CGRectMake(30, 50*2+550-300*prcent-jianH, title_W, title_H);
    _title4.frame = CGRectMake(180, 50*3+550-300*prcent-jianH, title_W, title_H);
    _title5.frame = CGRectMake(30, 50*4+550-300*prcent-jianH, title_W, title_H);
}

- (void)changeframeLastPrcent:(float)prcent
{
    dian1.alpha = 1-prcent;
    dian2.alpha = 1-prcent;
    dian3.alpha = 1-prcent;
    dian4.alpha = 1-prcent;
    dian5.alpha = 1-prcent;
    _title1.alpha = 1-prcent;
    _title2.alpha = 1-prcent;
    _title3.alpha = 1-prcent;
    _title4.alpha = 1-prcent;
    _title5.alpha = 1-prcent;

    
    dian1.frame = CGRectMake((320-8)/2, 50*0+260+500*prcent-jianH, 8, 8);
    dian2.frame = CGRectMake((320-8)/2, 50*1+260+500*prcent-jianH, 8, 8);
    dian3.frame = CGRectMake((320-8)/2, 50*2+260+500*prcent-jianH, 8, 8);
    dian4.frame = CGRectMake((320-8)/2, 50*3+260+500*prcent-jianH, 8, 8);
    dian5.frame = CGRectMake((320-8)/2, 50*4+260+500*prcent-jianH, 8, 8);
    
    _title1.frame = CGRectMake(30, 50*0+250+300*prcent-jianH, title_W, title_H);
    _title2.frame = CGRectMake(180, 50*1+250+300*prcent-jianH, title_W, title_H);
    _title3.frame = CGRectMake(30, 50*2+250+300*prcent-jianH, title_W, title_H);
    _title4.frame = CGRectMake(180, 50*3+250+300*prcent-jianH, title_W, title_H);
    _title5.frame = CGRectMake(30, 50*4+250+300*prcent-jianH, title_W, title_H);
}

- (void)startAnimation
{
    [self whileAnimation];
    [self whileAnimation1];
}

- (void)whileAnimation1
{
    [UIView animateWithDuration:0.7f animations:^{
        iconimg.transform=CGAffineTransformMakeRotation(M_PI/-20);
//        littleicon.transform=CGAffineTransformMakeRotation(M_PI/-20);
    } completion:^(BOOL finished) {
        //这是会不停循环的animation
        [self whileAnimation2];
    }];
}

- (void)whileAnimation2
{
    [UIView animateWithDuration:0.7f animations:^{
        iconimg.transform=CGAffineTransformMakeRotation(M_PI/20);
//        littleicon.transform=CGAffineTransformMakeRotation(M_PI/-20);
    } completion:^(BOOL finished) {
        //这是会不停循环的animation
        [self whileAnimation1];
    }];
}

- (void)whileAnimation
{
    [UIView animateWithDuration:1.5f animations:^{
        arrow.frame = CGRectMake((320-23)/2, 50+arrowH, 23, 12);
        arrow.alpha = 1.0f;

    } completion:^(BOOL finished) {
        //这是会不停循环的animation
        arrow.frame = CGRectMake((320-23)/2, 100+arrowH, 23, 12);
        arrow.alpha = 0.0f;
        [self whileAnimation];
    }];
}

- (void)changeViewImage:(int)index
{
    littleicon.hidden = NO;
    if (index == 3) {
        littleicon.hidden = YES;
    }
    switch (index) {
        case 0:
            kuang.frame = CGRectMake((320-160)/2-33, 100-jianH, 160, 123);
            break;
        case 1:
            kuang.frame = CGRectMake((320-160)/2+33, 100-jianH, 160, 123);
            break;
        case 2:
            kuang.frame = CGRectMake((320-160)/2-33, 100-jianH, 159, 122);
            break;
        case 3:
            kuang.frame = CGRectMake((320-160)/2+33, 100-jianH, 163, 120);
            break;

        default:
            break;
    }
    arrow.image = [UIImage imageNamed:[NSString stringWithFormat:@"arrowicon%d.png",index+1]];
    kuang.image = [UIImage imageNamed:[NSString stringWithFormat:@"defaultbg%d.png",index+1]];
    iconimg.image = [UIImage imageNamed:[NSString stringWithFormat:@"defaulticon%d.png",index+1]];
    littleicon.image = [UIImage imageNamed:[NSString stringWithFormat:@"defaultnext%d.png",index+1]];
}
@end
