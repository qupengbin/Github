//
//  BuyViewCell.m
//  testbiye
//
//  Created by qupengbin on 14-4-22.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "BuyViewCell.h"

@interface BuyViewCell() {
    UIImageView *iconView;
    UILabel *address;
    UILabel *name;
    UILabel *grade;
    UILabel *distance;
    UILabel *number;
}

@end

@implementation BuyViewCell

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
    if (iconView == nil) {
        iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 71, 71)];
        [self addSubview:iconView];
        
        
        UIImageView *gradeimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 71, 71)];
        [self addSubview:gradeimg];
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

- (void)reloadData:(NSArray *)data index:(int)index
{
    
}

@end
