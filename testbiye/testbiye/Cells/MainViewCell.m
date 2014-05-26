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
        iconBtn1 = [[DeleteBtnView alloc] initWithFrame:CGRectMake(21, 15, iconsize, iconsize)];
        iconBtn1.delegate = self;
        [self.contentView addSubview:iconBtn1];
    }
    if (iconBtn2 == nil) {
        iconBtn2 = [[DeleteBtnView alloc] initWithFrame:CGRectMake(distance*2+iconsize, 15, iconsize, iconsize)];
        iconBtn2.delegate = self;
        [self.contentView addSubview:iconBtn2];
    }
    if (iconBtn3 == nil) {
        iconBtn3 = [[DeleteBtnView alloc] initWithFrame:CGRectMake(320-21-iconsize, 15, iconsize, iconsize)];
        iconBtn3.delegate = self;
        [self.contentView addSubview:iconBtn3];
    }
//    [iconBtn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
//    [iconBtn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
//    [iconBtn3 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [iconBtn1 delBtnAddTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [iconBtn2 delBtnAddTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [iconBtn3 delBtnAddTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

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
    
    [selbtn1 addTarget:self action:@selector(selAction:) forControlEvents:UIControlEventTouchUpInside];
    [selbtn2 addTarget:self action:@selector(selAction:) forControlEvents:UIControlEventTouchUpInside];
    [selbtn3 addTarget:self action:@selector(selAction:) forControlEvents:UIControlEventTouchUpInside];
    
    selbtn1.hidden = YES;
    selbtn2.hidden = YES;
    selbtn3.hidden = YES;

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
               tag:(NSArray *)tag
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
    } else if (type == 1) {
        [iconBtn1 addLongPressGesture];
        [iconBtn2 addLongPressGesture];
        [iconBtn3 addLongPressGesture];
    }
    [iconBtn1 reloadData:[icon objectAtIndex:a]
                   index:index
                     tag:[[tag objectAtIndex:a] intValue]];
    titleLab1.text = [titleArr objectAtIndex:a];

    if (b<icon.count) {
        [iconBtn2 reloadData:[icon objectAtIndex:b]
                       index:b
                         tag:[[tag objectAtIndex:b] intValue]];
        titleLab2.text = [titleArr objectAtIndex:b];
    } else {
        iconBtn2.hidden = YES;
        titleLab2.hidden = YES;
    }
    if (c<icon.count) {
        [iconBtn3 reloadData:[icon objectAtIndex:c]
                       index:c
                         tag:[[tag objectAtIndex:c] intValue]];
        titleLab3.text = [titleArr objectAtIndex:c];
    } else {
        iconBtn3.hidden = YES;
        titleLab3.hidden = YES;
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

#pragma mark - DeleteBtnViewDelegate
- (void)deleteBtnViewAction:(id)sender tag:(int)tag
{
//    if (tag%3 == 0) {
//        [titleLab1 removeFromSuperview];
//    } else if (tag%3 == 1) {
//        [titleLab2 removeFromSuperview];
//    } else if (tag%3 == 2) {
//        [titleLab3 removeFromSuperview];
//    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(maincellDelete:)]) {
        [self.delegate maincellDelete:tag];
    }
}

@end
