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
        iconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (90-71)/2, 71, 71)];
        [self addSubview:iconView];
        
        
        UIImageView *gradeimg = [[UIImageView alloc] initWithFrame:CGRectMake(10+71+20, 25, 16, 15)];
        gradeimg.image = [UIImage imageNamed:@"gradeicon.png"];
        [self addSubview:gradeimg];
        
        grade = [[UILabel alloc] initWithFrame:CGRectMake(gradeimg.frame.origin.x+gradeimg.frame.size.width+4, 21, 30, 20)];
        [self addSubview:grade];
        
        UIImageView *distanceimg = [[UIImageView alloc] initWithFrame:CGRectMake(grade.frame.origin.x+grade.frame.size.width+5, 25, 16, 15)];
        distanceimg.image = [UIImage imageNamed:@"gradeicon.png"];
        [self addSubview:distanceimg];
        
        distance = [[UILabel alloc] initWithFrame:CGRectMake(distanceimg.frame.origin.x+distanceimg.frame.size.width+4, 21, 30, 20)];
        [self addSubview:distance];

        UIImageView *numberimg = [[UIImageView alloc] initWithFrame:CGRectMake(distance.frame.origin.x+distance.frame.size.width+5, 25, 16, 15)];
        numberimg.image = [UIImage imageNamed:@"gradeicon.png"];
        [self addSubview:numberimg];
        
        UIImageView *buynext = [[UIImageView alloc] initWithFrame:CGRectMake(300-18, (90-28)/2, 28, 28)];
        buynext.image = [UIImage imageNamed:@"nextbuy.png"];
        [self addSubview:buynext];

        number = [[UILabel alloc] initWithFrame:CGRectMake(numberimg.frame.origin.x+numberimg.frame.size.width+4, 21, 30, 20)];
        [self addSubview:number];
        
        name = [[UILabel alloc] initWithFrame:CGRectMake(gradeimg.frame.origin.x, grade.frame.origin.y+20, 200, 20)];
        name.font = [UIFont systemFontOfSize:14.0f];
        name.textColor = [UIColor grayColor];
        [self addSubview:name];
        
        address = [[UILabel alloc] initWithFrame:CGRectMake(gradeimg.frame.origin.x, grade.frame.origin.y+40, 200, 20)];
        address.font = [UIFont systemFontOfSize:10.0f];
        address.textColor = [UIColor lightGrayColor];
        [self addSubview:address];
        
        grade.textColor = [UIColor lightGrayColor];
        distance.textColor = [UIColor lightGrayColor];
        number.textColor = [UIColor lightGrayColor];
        
        UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 89, 320, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
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

    NSDictionary *dict = [data objectAtIndex:index];
    
    iconView.image = [UIImage imageNamed:[dict objectForKey:@"icon"]];
    grade.text = [dict objectForKey:@"grade"];
    distance.text = [dict objectForKey:@"distance"];
    number.text = [dict objectForKey:@"number"];
    
    name.text = [dict objectForKey:@"name"];
    address.text = [dict objectForKey:@"address"];
}

@end
