//
//  StatisCell.m
//  testbiye
//
//  Created by qupengbin on 14-5-8.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "StatisCell.h"

@interface StatisIconView()
{
    UIImageView *_icon;
    
    UILabel *_name;
    UILabel *_price;
}

@end

@implementation StatisIconView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initview];
    }
    return self;
}

- (void)initview
{
    float w = self.frame.size.width;
    float h = self.frame.size.height;
    
    _icon = [[UIImageView alloc] initWithFrame:CGRectMake((w-82)/2, 0, 82, 101)];
    [self addSubview:_icon];
    
    _price = [[UILabel alloc] initWithFrame:CGRectMake((w-82)/2, 20, 82, 40)];
    _price.backgroundColor = [UIColor clearColor];
    _price.textColor = [UIColor whiteColor];
    _price.textAlignment = NSTextAlignmentCenter;
    _price.font = [UIFont systemFontOfSize:20.0f];
    [self addSubview:_price];
    
    _name = [[UILabel alloc] initWithFrame:CGRectMake((w-82)/2, h-25, 82, 20)];
    _name.backgroundColor = [UIColor clearColor];
    _name.textColor = [UIColor lightGrayColor];
    _name.textAlignment = NSTextAlignmentCenter;
    _name.font = [UIFont systemFontOfSize:12.0f];
    [self addSubview:_name];

}

- (void)reloadData:(NSString *)icon
              name:(NSString *)name
             price:(NSString *)price
{
    _icon.image = [UIImage imageNamed:icon];
    _name.text = name;
    _price.text = price;
}

@end

@interface StatisCell()
{
    UIScrollView *_scroll;
    UILabel *_daylab;
    UILabel *_momlab;
}

@end

@implementation StatisCell

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
    float distance = 320/3;
    
    _daylab = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 30, 30)];
    _daylab.backgroundColor = [UIColor clearColor];
    _daylab.textAlignment = NSTextAlignmentCenter;
    _daylab.font = [UIFont systemFontOfSize:26.0f];
    [self addSubview:_daylab];
    
    _momlab = [[UILabel alloc] initWithFrame:CGRectMake(50, 28, 30, 20)];
    _momlab.backgroundColor = [UIColor clearColor];
    _momlab.font = [UIFont systemFontOfSize:14.0f];
    _momlab.text = @"三月";
    [self addSubview:_momlab];

    _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, 320, 155)];
    for (int i = 0; i < 6; i++) {
        StatisIconView *iconView = [[StatisIconView alloc] initWithFrame:CGRectMake(distance*i, 0, distance, 101+30)];
        [_scroll addSubview:iconView];
    }
    _scroll.pagingEnabled = YES;
    _scroll.contentSize = CGSizeMake(distance*6, 155);
    [self addSubview:_scroll];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)reloadData:(NSArray *)data
             index:(int)index
              type:(int)type
{
    int num = 0;
    _daylab.text = [NSString stringWithFormat:@"%d",index+21];
    for (UIView *vi in _scroll.subviews) {
        if ([vi isKindOfClass:[StatisIconView class]]) {
            NSDictionary *dict = [data objectAtIndex:num];
            StatisIconView *icon = (StatisIconView *)vi;
            [icon reloadData:[dict objectForKey:@"icon"]
                        name:[dict objectForKey:@"name"]
                       price:[dict objectForKey:@"price"]];
            num = num+1;
        }
    }
}

@end
