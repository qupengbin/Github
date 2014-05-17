//
//  ClockCell.m
//  testbiye
//
//  Created by qupengbin on 14-5-17.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "ClockCell.h"

@interface ClockCell () <UITextFieldDelegate>
{
    UITextField *_timefield;
    UITextField *_addressfield;

}

@end

@implementation ClockCell

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
    _timefield = [[UITextField alloc] initWithFrame:CGRectMake(20, 0, 200, 60)];
    _timefield.backgroundColor = [UIColor clearColor];
    _timefield.font = [UIFont systemFontOfSize:60.0f];
    _timefield.textColor = [UIColor grayColor];
    _timefield.delegate = self;
    [self addSubview:_timefield];
    
    _addressfield = [[UITextField alloc] initWithFrame:CGRectMake(25, 60, 200, 30)];
    _addressfield.backgroundColor = [UIColor clearColor];
    _addressfield.font = [UIFont systemFontOfSize:16.0f];
    _addressfield.textColor = [UIColor grayColor];
    _addressfield.delegate = self;
    [self addSubview:_addressfield];
    
    UIImageView *next = [[UIImageView alloc] initWithFrame:CGRectMake(320-28-20, (95-28)/2, 28, 28)];
    next.image = [UIImage imageNamed:@"timeclocknext.png"];
    [self addSubview:next];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 95-0.5f, 320, 0.5f)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)reloadData:(NSString *)time
           address:(NSString *)address
          editbool:(BOOL)editbool
{
    _timefield.userInteractionEnabled = editbool;
    _addressfield.userInteractionEnabled = editbool;

    _timefield.text = time;
    _addressfield.text = address;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
