//
//  TabbarToolView.h
//  testbiye
//
//  Created by qupengbin on 14-4-22.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabbarToolViewDelegate <NSObject>
@optional

- (void)TabbarToolSelectIndex:(id)sender;

@end

@interface TabbarToolView : UIView

@property(nonatomic,assign) id<TabbarToolViewDelegate> delegate;

@end
