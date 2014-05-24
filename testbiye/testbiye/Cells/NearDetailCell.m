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
    UIImageView *_bg;
    UIImageView *next;
    
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
    
    _bg = [[UIImageView alloc] initWithFrame:CGRectMake(320-180, 151-45-15, 180, 45)];
    _bg.image = [UIImage imageNamed:@"nearbg.png"];
    [self addSubview:_bg];
    
    _price = [[UILabel alloc] initWithFrame:CGRectMake(_bg.frame.origin.x+10, _bg.frame.origin.y+3, 180, 22)];
    _price.font = [UIFont systemFontOfSize:19.0f];
    _price.textColor = [UIColor whiteColor];
    _price.backgroundColor = [UIColor clearColor];
    [self addSubview:_price];
    
    _title = [[UILabel alloc] initWithFrame:CGRectMake(_bg.frame.origin.x+11, _bg.frame.origin.y+20, 180, 22)];
    _title.font = [UIFont systemFontOfSize:14.0f];
    _title.textColor = [UIColor whiteColor];
    _title.backgroundColor = [UIColor clearColor];
    [self addSubview:_title];
    
    next = [[UIImageView alloc] initWithFrame:CGRectMake(320-28-10, 151-18-22, 18, 18)];
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
              type:(int)type
{
    if (type == 1) {
        _bg.image = [UIImage imageNamed:@"nearbg.png"];
        next.image = [UIImage imageNamed:@"buyicon.png"];
        
        _price.textColor = [UIColor whiteColor];
        _title.textColor = [UIColor whiteColor];

    } else if (type == 2) {
        _bg.image = [UIImage imageNamed:@"nearbgw.png"];
        next.image = [UIImage imageNamed:@"nextbuyg.png"];

        _price.textColor = RGBCOLOR(51, 51, 51);
        _title.textColor = [UIColor grayColor];
    }
    NSString *str = [imgs objectAtIndex:index];
    _img.image = [UIImage imageNamed:str];
    _title.text = [title objectAtIndex:index];
    _price.text = [price objectAtIndex:index];
}

@end
