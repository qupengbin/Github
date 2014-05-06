//
//  StoreCell.m
//  testbiye
//
//  Created by qupengbin on 14-5-5.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "StoreCell.h"

@interface StoreCell() {
    UIImageView *iconimg;
    UILabel *namelab;
}

@end

@implementation StoreCell

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
    float h = 46.0f;
    
    iconimg = [[UIImageView alloc] initWithFrame:CGRectMake(10, (h-28)/2, 28, 28)];
    [self addSubview:iconimg];
    
    namelab = [[UILabel alloc] initWithFrame:CGRectMake(50, (h-28)/2, 100, 28)];
    namelab.backgroundColor = [UIColor clearColor];
    namelab.textColor = [UIColor lightGrayColor];
    namelab.font = [UIFont systemFontOfSize:12.0f];
    [self addSubview:namelab];
    
    UIImageView *next = [[UIImageView alloc] initWithFrame:CGRectMake(320-22-20, (h-22)/2, 22, 22)];
    next.image = [UIImage imageNamed:@"storenext.png"];
    [self addSubview:next];
}

- (void)reloadData:(NSString *)icon name:(NSString *)name
{
    iconimg.image = [UIImage imageNamed:icon];
    namelab.text = name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
