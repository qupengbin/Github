//
//  DeleteBtnView.h
//  testbiye
//
//  Created by qupengbin on 14-5-22.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DeleteBtnViewDelegate <NSObject>
@optional

- (void)deleteBtnViewAction:(id)sender tag:(int)tag;

@end

@interface DeleteBtnView : UIView

@property(nonatomic,assign) id<DeleteBtnViewDelegate> delegate;

- (void)delBtnAddTarget:(id)target
                 action:(SEL)action
       forControlEvents:(UIControlEvents)controlEvents;

- (void)reloadData:(NSString *)image index:(int)index tag:(int)tag;

- (void)addLongPressGesture;

@end
