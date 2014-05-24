//
//  MainViewCell.m
//  testbiye
//
//  Created by qupengbin on 14-4-17.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "MainViewCell.h"

#define frame_y 26

@implementation MainViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initview];
    }
    return self;
}

- (void)initview
{
    float iconsize = 62.0f;
    float distance = (320-iconsize*3)/4;
    if (iconBtn1 == nil) {
        iconBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(21, 15, iconsize, iconsize)];
        [self.contentView addSubview:iconBtn1];
    }
    if (iconBtn2 == nil) {
        iconBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(distance*2+iconsize, 15, iconsize, iconsize)];
        [self.contentView addSubview:iconBtn2];
    }
    if (iconBtn3 == nil) {
        iconBtn3 = [[UIButton alloc] initWithFrame:CGRectMake(320-21-iconsize, 15, iconsize, iconsize)];
        [self.contentView addSubview:iconBtn3];
    }

    if (selbtn1 == nil) {
        selbtn1 = [[UIButton alloc] initWithFrame:CGRectMake(21, 15, iconsize, iconsize)];
        [selbtn1 setImage:[UIImage imageNamed:@"menuiconsel1.png"] forState:UIControlStateNormal];
        [selbtn1 setImage:[UIImage imageNamed:@"menuiconsel2.png"] forState:UIControlStateSelected];
        [self.contentView addSubview:selbtn1];
    }
    if (selbtn2 == nil) {
        selbtn2 = [[UIButton alloc] initWithFrame:CGRectMake(distance*2+iconsize, 15, iconsize, iconsize)];
        [selbtn2 setImage:[UIImage imageNamed:@"menuiconsel1.png"] forState:UIControlStateNormal];
        [selbtn2 setImage:[UIImage imageNamed:@"menuiconsel2.png"] forState:UIControlStateSelected];
        [self.contentView addSubview:selbtn2];
    }
    if (selbtn3 == nil) {
        selbtn3 = [[UIButton alloc] initWithFrame:CGRectMake(320-21-iconsize, 15, iconsize, iconsize)];
        [selbtn3 setImage:[UIImage imageNamed:@"menuiconsel1.png"] forState:UIControlStateNormal];
        [selbtn3 setImage:[UIImage imageNamed:@"menuiconsel2.png"] forState:UIControlStateSelected];
        [self.contentView addSubview:selbtn3];
    }

    [iconBtn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [iconBtn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [iconBtn3 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [selbtn1 addTarget:self action:@selector(selAction:) forControlEvents:UIControlEventTouchUpInside];
    [selbtn2 addTarget:self action:@selector(selAction:) forControlEvents:UIControlEventTouchUpInside];
    [selbtn3 addTarget:self action:@selector(selAction:) forControlEvents:UIControlEventTouchUpInside];
    
    selbtn1.hidden = YES;
    selbtn2.hidden = YES;
    selbtn3.hidden = YES;

//    [iconBtn1 delBtnAddTarget:self action:(btnAction:) forControlEvents:UIControlEventTouchUpInside];
//    [iconBtn2 delBtnAddTarget:self action:(btnAction:) forControlEvents:UIControlEventTouchUpInside];
//    [iconBtn3 delBtnAddTarget:self action:(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    if (titleLab1 == nil) {
        titleLab1 = [[UILabel alloc] initWithFrame:CGRectMake(21, 75+5, iconsize, 20)];
        titleLab1.font = [UIFont systemFontOfSize:12.0f];
        titleLab1.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:titleLab1];
    }
    if (titleLab2 == nil) {
        titleLab2 = [[UILabel alloc] initWithFrame:CGRectMake(distance*2+iconsize, 75+5, iconsize, 20)];
        titleLab2.font = [UIFont systemFontOfSize:12.0f];
        titleLab2.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:titleLab2];
    }
    if (titleLab3 == nil) {
        titleLab3 = [[UILabel alloc] initWithFrame:CGRectMake(320-21-iconsize, 75+5, iconsize, 20)];
        titleLab3.font = [UIFont systemFontOfSize:12.0f];
        titleLab3.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:titleLab3];
    }
    titleLab1.textColor = RGBCOLOR(51, 51, 51);
    titleLab2.textColor = RGBCOLOR(51, 51, 51);
    titleLab3.textColor = RGBCOLOR(51, 51, 51);
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)reloadData:(NSArray *)titleArr
              icon:(NSArray *)icon
             index:(int)index
              type:(int)type
{
    int a = index*3;
    int b = index*3+1;
    int c = index*3+2;
    
    if (type == 2) {
        selbtn1.hidden = NO;
        selbtn2.hidden = NO;
        selbtn3.hidden = NO;
        
        {
            selbtn1.hidden = NO;
            selbtn2.hidden = NO;
            selbtn3.hidden = NO;
            
            float iconsize = 71.0f;
            float distance = (320-iconsize*3)/4;
            iconBtn1.frame = CGRectMake(21, frame_y, iconsize, iconsize);
            iconBtn2.frame = CGRectMake(distance*2+iconsize, frame_y, iconsize, iconsize);
            iconBtn3.frame = CGRectMake(320-21-iconsize, frame_y, iconsize, iconsize);
            
            selbtn1.frame = CGRectMake(21, frame_y, iconsize, iconsize);
            selbtn2.frame = CGRectMake(distance*2+iconsize, frame_y, iconsize, iconsize);
            selbtn3.frame = CGRectMake(320-21-iconsize, frame_y, iconsize, iconsize);
            
            titleLab1.frame = CGRectMake(21, 75+25, iconsize, 20);
            titleLab2.frame = CGRectMake(distance*2+iconsize, 75+25, iconsize, 20);
            titleLab3.frame = CGRectMake(320-21-iconsize, 75+25, iconsize, 20);
        }
    } else if (type == 3) {
        float iconsize = 62.0f;
        float distance = (320-iconsize*3)/4;
        iconBtn1.frame = CGRectMake(21, 32, iconsize, iconsize);
        iconBtn2.frame = CGRectMake(distance*2+iconsize, 32, iconsize, iconsize);
        iconBtn3.frame = CGRectMake(320-21-iconsize, 32, iconsize, iconsize);

        titleLab1.frame = CGRectMake(21, 75+25, iconsize, 20);
        titleLab2.frame = CGRectMake(distance*2+iconsize, 75+25, iconsize, 20);
        titleLab3.frame = CGRectMake(320-21-iconsize, 75+25, iconsize, 20);
    }
    
    UIImage *img1 = [UIImage imageNamed:[icon objectAtIndex:a]];
    [iconBtn1 setBackgroundImage:img1 forState:UIControlStateNormal];
    iconBtn1.tag = a;
    titleLab1.text = [titleArr objectAtIndex:a];

    if (b<icon.count) {
        UIImage *img2 = [UIImage imageNamed:[icon objectAtIndex:b]];
        [iconBtn2 setBackgroundImage:img2 forState:UIControlStateNormal];
        iconBtn2.tag = b;
        titleLab2.text = [titleArr objectAtIndex:b];
    }
    if (c<icon.count) {
        UIImage *img3 = [UIImage imageNamed:[icon objectAtIndex:c]];
        [iconBtn3 setBackgroundImage:img3 forState:UIControlStateNormal];
        iconBtn3.tag = c;
        titleLab3.text = [titleArr objectAtIndex:c];
    }
}

- (void)selAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
}

- (void)btnAction:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(iconBtnAction:)]) {
        [self.delegate iconBtnAction:sender];
    }
}

@end
