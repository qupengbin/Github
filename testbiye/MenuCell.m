//
//  MenuCell.m
//  testbiye
//
//  Created by qupengbin on 14-5-17.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "MenuCell.h"

@interface MenuCell()
{
    UIImageView *_iconimg;
    UILabel *_namelab;
}

@end

@implementation MenuCell

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
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(10, 48-0.5f, 250, 0.5f)];
    line.backgroundColor = [UIColor lightGrayColor];
    line.alpha = 0.5f;
    [self addSubview:line];
    
    
    _iconimg = [[UIImageView alloc] initWithFrame:CGRectMake(20, (48-24)/2, 22, 24)];
    [self addSubview:_iconimg];
    
    _namelab = [[UILabel alloc] initWithFrame:CGRectMake(60, (48-30)/2, 200, 30)];
    _namelab.font = [UIFont systemFontOfSize:14.0f];
    [self addSubview:_namelab];
    _namelab.textColor = RGBCOLOR(129, 129, 129);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)reloadData:(NSString *)img title:(NSString *)title
{
    _iconimg.image = [UIImage imageNamed:img];
    _namelab.text = title;
}

@end
