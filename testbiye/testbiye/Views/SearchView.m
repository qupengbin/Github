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
    
    searchField = [[UITextField alloc] initWithFrame:CGRectMake(20, 5, 280, 30)];
    searchField.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:searchField];
    searchField.delegate = self;
    searchField.placeholder = @"Search";
    
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
