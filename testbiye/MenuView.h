//
//  MenuView.h
//  testbiye
//
//  Created by qupengbin on 14-5-20.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuViewDelegate <NSObject>
@optional

- (void)tableviewSelect:(int)index;

- (void)loginOrRegistAction;

- (void)swipLeftActionDel;

@end

@interface MenuView : UIView

@property(nonatomic,assign) id<MenuViewDelegate> delegate;

@end
