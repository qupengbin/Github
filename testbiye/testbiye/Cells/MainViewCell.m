//
//  MainViewCell.m
//  testbiye
//
//  Created by qupengbin on 14-4-17.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "MainViewCell.h"

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
        iconBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(distance, 15, iconsize, iconsize)];
        [self.contentView addSubview:iconBtn1];
    }
    if (iconBtn2 == nil) {
        iconBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(distance*2+iconsize, 15, iconsize, iconsize)];
        [self.contentView addSubview:iconBtn2];
    }
    if (iconBtn3 == nil) {
        iconBtn3 = [[UIButton alloc] initWithFrame:CGRectMake(distance*3+iconsize*2, 15, iconsize, iconsize)];
        [self.contentView addSubview:iconBtn3];
    }

    [iconBtn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [iconBtn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [iconBtn3 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    if (titleLab1 == nil) {
        titleLab1 = [[UILabel alloc] initWithFrame:CGRectMake(distance, 85+5, iconsize, 20)];
        titleLab1.font = [UIFont systemFontOfSize:12.0f];
        titleLab1.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:titleLab1];
    }
    if (titleLab2 == nil) {
        titleLab2 = [[UILabel alloc] initWithFrame:CGRectMake(distance*2+iconsize, 85+5, iconsize, 20)];
        titleLab2.font = [UIFont systemFontOfSize:12.0f];
        titleLab2.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:titleLab2];
    }
    if (titleLab3 == nil) {
        titleLab3 = [[UILabel alloc] initWithFrame:CGRectMake(distance*3+iconsize*2, 85+5, iconsize, 20)];
        titleLab3.font = [UIFont systemFontOfSize:12.0f];
        titleLab3.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:titleLab3];
    }

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
             index:(int)index
{
    int a = index*3;
    int b = index*3+1;
    int c = index*3+2;
    
    UIImage *img1 = [UIImage imageNamed:[NSString stringWithFormat:@"mainicon%d",a+1]];
    UIImage *img2 = [UIImage imageNamed:[NSString stringWithFormat:@"mainicon%d",b+1]];
    UIImage *img3 = [UIImage imageNamed:[NSString stringWithFormat:@"mainicon%d",c+1]];
    
    [iconBtn1 setBackgroundImage:img1 forState:UIControlStateNormal];
    [iconBtn2 setBackgroundImage:img2 forState:UIControlStateNormal];
    [iconBtn3 setBackgroundImage:img3 forState:UIControlStateNormal];
    
    iconBtn1.tag = a;
    iconBtn2.tag = b;
    iconBtn3.tag = c;
    
    titleLab1.text = [titleArr objectAtIndex:a];
    titleLab2.text = [titleArr objectAtIndex:b];
    titleLab3.text = [titleArr objectAtIndex:c];
}

- (void)btnAction:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(iconBtnAction:)]) {
        [self.delegate iconBtnAction:sender];
    }
}

@end
