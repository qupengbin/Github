//
//  DayPlanCell.m
//  testbiye
//
//  Created by qupengbin on 14-5-24.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "DayPlanCell.h"

@interface DayPlanCell()
{
    UILabel *_title;
}

@end

@implementation DayPlanCell

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
    _title = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 280, 40)];
    _title.font = [UIFont systemFontOfSize:15.0f];
    _title.textColor = RGBCOLOR(51, 51, 51);
    [self addSubview:_title];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40-0.5f, 320, 0.5f)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
}

- (void)reloadData:(NSString *)title
{
    _title.text = title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
