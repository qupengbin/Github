//
//  LifeSayCell.m
//  testbiye
//
//  Created by qupengbin on 14-5-17.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "LifeSayCell.h"

@interface LifeSayCell()
{
    UIImageView *_icon;
    UIImageView *_bgimg;
    
    UILabel *_namelab;
    UILabel *_timelab;
    
    UITextView *_content;
}

@end

@implementation LifeSayCell

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
    _icon = [[UIImageView alloc] initWithFrame:CGRectMake(20, 15, 40, 40)];
    _icon.backgroundColor = [UIColor clearColor];
    [self addSubview:_icon];
    
    _namelab = [[UILabel alloc] initWithFrame:CGRectMake(70, 15, 200, 30)];
    _namelab.backgroundColor = [UIColor clearColor];
    _namelab.textColor = [UIColor grayColor];
    _namelab.font = [UIFont systemFontOfSize:16.0f];
    [self addSubview:_namelab];
    
    _content = [[UITextView alloc] initWithFrame:CGRectMake(70, 42, 320-70-10, 68)];
    _content.editable = NO;
    _content.font = [UIFont systemFontOfSize:14.0f];
    _content.textColor = [UIColor lightGrayColor];
    [self addSubview:_content];
    
    _bgimg = [[UIImageView alloc] initWithFrame:CGRectMake(70, 70+45, 187, 120)];
    [self addSubview:_bgimg];
    
    _timelab = [[UILabel alloc] initWithFrame:CGRectMake(70, 70+45+120, 200, 20)];
    _timelab.backgroundColor = [UIColor clearColor];
    _timelab.textColor = [UIColor lightGrayColor];
    _timelab.font = [UIFont systemFontOfSize:12.0f];
    [self addSubview:_timelab];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 270-0.5f, 320, 0.5f)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
}

- (void)reloadData:(NSDictionary *)dict index:(int)index
{
    _icon.image = [UIImage imageNamed:[dict objectForKey:@"icon"]];
    _namelab.text = [dict objectForKey:@"name"];
    _content.text = [dict objectForKey:@"content"];
    _bgimg.image = [UIImage imageNamed:[dict objectForKey:@"bgimg"]];
    _timelab.text = [dict objectForKey:@"time"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
