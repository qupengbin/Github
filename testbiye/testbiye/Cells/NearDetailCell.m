//
//  NearDetailCell.m
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "NearDetailCell.h"

@interface NearDetailCell() {
    UIImageView *_img;
    UILabel *_price;
    UILabel *_title;
}

@end

@implementation NearDetailCell

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
    _img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 151)];
    [self addSubview:_img];
    
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(320-180, 151-45-15, 180, 45)];
    bg.image = [UIImage imageNamed:@"nearbg.png"];
    [self addSubview:bg];
    
    _price = [[UILabel alloc] initWithFrame:CGRectMake(bg.frame.origin.x+10, bg.frame.origin.y, 180, 22)];
    _price.font = [UIFont systemFontOfSize:20.0f];
    _price.textColor = [UIColor whiteColor];
    _price.backgroundColor = [UIColor clearColor];
    [self addSubview:_price];
    
    _title = [[UILabel alloc] initWithFrame:CGRectMake(bg.frame.origin.x+10, bg.frame.origin.y+22, 180, 22)];
    _title.font = [UIFont systemFontOfSize:14.0f];
    _title.textColor = [UIColor whiteColor];
    _title.backgroundColor = [UIColor clearColor];
    [self addSubview:_title];
    
    UIImageView *next = [[UIImageView alloc] initWithFrame:CGRectMake(320-28-10, 151-28-20, 28, 28)];
    next.image = [UIImage imageNamed:@"nextbuy.png"];
    [self addSubview:next];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 150, 320, 0.5)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
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

- (void)reloadData:(NSArray *)imgs
             title:(NSArray *)title
             price:(NSArray *)price
             index:(int)index
{
    NSString *str = [imgs objectAtIndex:index];
    _img.image = [UIImage imageNamed:str];
    _title.text = [title objectAtIndex:index];
    _price.text = [price objectAtIndex:index];
}

@end
