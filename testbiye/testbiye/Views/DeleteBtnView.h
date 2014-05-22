//
//  DeleteBtnView.h
//  testbiye
//
//  Created by qupengbin on 14-5-22.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeleteBtnView : UIView

- (void)delBtnAddTarget:(id)target
                 action:(SEL)action
       forControlEvents:(UIControlEvents)controlEvents;

- (void)reloadData:(NSString *)image index:(int)index;

@end
