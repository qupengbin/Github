//
//  BuyCarCell.m
//  testbiye
//
//  Created by qupengbin on 14-5-5.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "BuyCarCell.h"

@interface BuyCarCell()
{
    UIImageView *iconView;
    UILabel *name;
    UILabel *price;
    UILabel *number;
    
    UIButton *addbtn;
    UIButton *redbtn;
}

@end

@implementation BuyCarCell

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
    float h = 90.0f;
    if (iconView == nil) {
        iconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (h-71)/2, 71, 71)];
        [self addSubview:iconView];
        
        name = [[UILabel alloc] initWithFrame:CGRectMake(iconView.frame.origin.x+71+8, 21, 150, 30)];
        name.font = [UIFont systemFontOfSize:16.0f];
        name.textColor = [UIColor lightGrayColor];
        [self addSubview:name];
        
        price = [[UILabel alloc] initWithFrame:CGRectMake(iconView.frame.origin.x+71+8, 21+30, 150, 30)];
        price.font = [UIFont systemFontOfSize:13.0f];
        price.textColor = [UIColor lightGrayColor];
        [self addSubview:price];

        addbtn = [[UIButton alloc] initWithFrame:CGRectMake(320-21-20, (h-21)/2, 21, 21)];
        [self addSubview:addbtn];
        
        number = [[UILabel alloc] initWithFrame:CGRectMake(320-21-20-30, (h-30)/2, 30, 30)];
        number.font = [UIFont systemFontOfSize:24.0f];
        number.textColor = [UIColor grayColor];
        number.textAlignment = NSTextAlignmentCenter;
        [self addSubview:number];
        
        redbtn = [[UIButton alloc] initWithFrame:CGRectMake(320-21-20-30-21, (h-21)/2, 21, 21)];
        [self addSubview:redbtn];

        [addbtn setImage:[UIImage imageNamed:@"buycaradd.png"]
                forState:UIControlStateNormal];
        [redbtn setImage:[UIImage imageNamed:@"buycarred.png"]
                forState:UIControlStateNormal];

        addbtn.tag = 100;
        redbtn.tag = 200;
        
        [addbtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [redbtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

        UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 89, 320, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
    }
}

- (void)btnAction:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    int num = [number.text intValue];
    
    if (btn.tag == 100) {
        num = num+1;
    } else if (btn.tag == 200) {
        if (num<1) {
            return;
        }
        num = num-1;
    }
    number.text = [NSString stringWithFormat:@"%d",num];

    if (self.delegate && [self.delegate respondsToSelector:@selector(buyCarBtnAction:)]) {
        [self.delegate buyCarBtnAction:sender];
    }
}

- (void)reloadData:(NSArray *)data index:(int)index
{
    NSDictionary *dict = [data objectAtIndex:index];
    
    iconView.image = [UIImage imageNamed:[dict objectForKey:@"icon"]];
    name.text = [dict objectForKey:@"name"];
    price.text = [dict objectForKey:@"price"];
    number.text = [dict objectForKey:@"number"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
