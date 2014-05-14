//
//  SearchView.h
//  testbiye
//
//  Created by qupengbin on 14-4-22.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchViewDelegate <NSObject>
@optional

- (void)SearchViewReturn:(UITextField *)field;

@end

@interface SearchView : UIView<UITextFieldDelegate>
{
    UITextField *searchField;
}

@property(nonatomic,assign) id<SearchViewDelegate> delegate;

- (void)searchViewBecomeFirstResponder;

- (void)searchViewResignFirstResponder;

@end
