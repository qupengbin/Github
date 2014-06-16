//
//  ChangeScrollView.h
//  testbiye
//
//  Created by qupengbin on 14-5-6.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChangeViewDelegate <NSObject>
@optional

- (void)changeViewBtnAction:(int)index;

@end

@interface ChangeView : UIView

@property(nonatomic,assign) id<ChangeViewDelegate> delegate;

@end

@protocol ChangeScrollViewDelegate <NSObject>
@optional

- (void)changeScrollViewIndex:(int)index;

@end

@interface ChangeScrollView : UIView

@property(nonatomic,assign) id<ChangeScrollViewDelegate> delegate;

- (void)changeViewToIndex:(int)index LOrR:(BOOL)LOrR;

- (void)reloadData:(NSArray *)arr
              icon:(NSString *)icon
              type:(int)type;

@end
