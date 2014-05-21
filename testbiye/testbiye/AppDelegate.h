//
//  AppDelegate.h
//  testbiye
//
//  Created by qupengbin on 14-4-16.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabbarToolView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,TabbarToolViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TabbarToolView *tabbar;

@end

extern AppDelegate *app;