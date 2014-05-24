//
//  SearchView.m
//  testbiye
//
//  Created by qupengbin on 14-4-22.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView

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
    self.backgroundColor = RGBCOLOR(242, 242, 242);
    
    UIImageView *bgimg = [[UIImageView alloc] initWithFrame:CGRectMake((320-280)/2, 5, 280, 30)];
    bgimg.image = [UIImage imageNamed:@"searchbgimg.png"];
    [self addSubview:bgimg];
    
    searchField = [[UITextField alloc] initWithFrame:CGRectMake(25, 5, 270, 30)];
    searchField.borderStyle = UITextBorderStyleNone;
    searchField.backgroundColor = [UIColor clearColor];
    searchField.font = [UIFont systemFontOfSize:14.0f];
    [self addSubview:searchField];
    searchField.delegate = self;
    searchField.placeholder = @"Search";
    
    CALayer *lay = [searchField layer];   //获取ImageView的层
    [lay setMasksToBounds:YES];
    [lay setCornerRadius:4.0];
}

- (void)searchViewBecomeFirstResponder
{
    [searchField becomeFirstResponder];
}

- (void)searchViewResignFirstResponder
{
    [searchField resignFirstResponder];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(SearchViewReturn:)]) {
        [self.delegate SearchViewReturn:textField];
    }
    return YES;
}

@end
