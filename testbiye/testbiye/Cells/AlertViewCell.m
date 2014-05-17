//
//  AlertViewCell.m
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "AlertViewCell.h"

@interface AlertViewCell()<UITextFieldDelegate>
{
    UITextField *timelab;
    UITextField *titlelab;
}

@end

@implementation AlertViewCell

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
    float height = 110.0f;
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(20, (height-80)/2, 80, 80)];
    icon.layer.cornerRadius = 38;//设置那个圆角的有多圆
//    icon.layer.borderWidth = 10;//设置边框的宽度，当然可以不要
//    icon.layer.borderColor = [[UIColor redColor] CGColor];//设置边框的颜色
    icon.layer.masksToBounds = YES;//设为NO去试试
    icon.backgroundColor = RGBCOLOR(25.0f, 188.0f, 149.0f);
    [self addSubview:icon];
    
    timelab= [[UITextField alloc] initWithFrame:CGRectMake(24, (height-40)/2, 70, 40)];
    timelab.backgroundColor = [UIColor clearColor];
    timelab.font = [UIFont systemFontOfSize:24.0f];
    timelab.textColor = [UIColor whiteColor];
    timelab.textAlignment = NSTextAlignmentCenter;
    timelab.userInteractionEnabled = NO;
    timelab.delegate = self;
    [self addSubview:timelab];
    
    titlelab = [[UITextField alloc] initWithFrame:CGRectMake(110, (height-40)/2, 150, 40)];
    titlelab.backgroundColor = [UIColor clearColor];
    titlelab.font = [UIFont systemFontOfSize:16.0f];
    titlelab.textColor = [UIColor lightGrayColor];
    titlelab.userInteractionEnabled = NO;
    titlelab.delegate = self;
    [self addSubview:titlelab];
    
    UISwitch *swi = [[UISwitch alloc] initWithFrame:CGRectMake(320-50-10, (height-25)/2, 50, 25)];
    [self addSubview:swi];
    swi.onImage = [UIImage imageNamed:@"onimg.png"];
    swi.offImage = [UIImage imageNamed:@"offimg.png"];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake((320-229-10), (height-4), 229, 4)];
    line.backgroundColor = [UIColor clearColor];
    line.image = [UIImage imageNamed:@"daylineimg.png"];
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

- (void)switchOnorOff:(BOOL)onoff
{
    timelab.userInteractionEnabled = onoff;
    titlelab.userInteractionEnabled = onoff;
}

- (void)reloadData:(NSString *)time title:(NSString *)title index:(int)index
{
    timelab.text = time;
    titlelab.text = title;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
