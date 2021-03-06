//
//  AppDelegate.m
//  testbiye
//
//  Created by qupengbin on 14-4-16.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MHNavViewController.h"
#import "ICSDrawerController.h"
#import "MenuViewController.h"
#import "LoginViewController.h"
#import "MyFavoriteViewController.h"
#import "MyIntegralViewController.h"
#import "MyIndentViewController.h"
#import "StatisticsViewController.h"
#import "HelpInView.h"

AppDelegate *app;

@interface AppDelegate()<MenuViewControllerDelegate>
{
    MainViewController *mainViewController;
    MenuViewController *menuViewController;
}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    app = self;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    mainViewController = [[MainViewController alloc] init];
    menuViewController = [[MenuViewController alloc] init];
    
    MHNavViewController *nav = [[MHNavViewController alloc] initWithRootViewController:mainViewController];
    menuViewController.delegate = self;
    
//    ICSDrawerController *drawController = [[ICSDrawerController alloc] initWithLeftViewController:menuViewController centerViewController:nav rightViewController:nil];
    
    self.window.rootViewController = nav;

    self.tabbar = [[TabbarToolView alloc] initWithFrame:CGRectMake(0, self.window.bounds.size.height-49, 320, 49)];
    [self.window addSubview:self.tabbar];
    self.tabbar.delegate = self;
    self.tabbar.hidden = YES;
    
    HelpInView *helpView = [[HelpInView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    [self.window addSubview:helpView];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - MenuViewDelegate
- (void)tableviewSelect:(int)index
{
    if (index == 0) {
        //我的积分
        MyIntegralViewController *integ = [[MyIntegralViewController alloc] init];
        MHNavViewController *nav = [[MHNavViewController alloc] initWithRootViewController:integ];
        [self.window.rootViewController presentViewController:nav animated:YES completion:^{
            
        }];

    } else if (index == 1) {
        //我的订单
        MyIndentViewController *integ = [[MyIndentViewController alloc] init];
        integ.type = 1;
        MHNavViewController *nav = [[MHNavViewController alloc] initWithRootViewController:integ];
        [self.window.rootViewController presentViewController:nav animated:YES completion:^{
            
        }];
    } else if (index == 2) {
        //消费统计
        StatisticsViewController *favorite = [[StatisticsViewController alloc] init];
        MHNavViewController *nav = [[MHNavViewController alloc] initWithRootViewController:favorite];
        [self.window.rootViewController presentViewController:nav animated:YES completion:^{
            
        }];

    } else if (index == 3) {
        //我的收藏
        MyFavoriteViewController *favorite = [[MyFavoriteViewController alloc] init];
        favorite.type = 1;
        MHNavViewController *nav = [[MHNavViewController alloc] initWithRootViewController:favorite];
        [self.window.rootViewController presentViewController:nav animated:YES completion:^{
            
        }];
    }
}

- (void)loginOrRegistAction
{
    LoginViewController *login = [[LoginViewController alloc] init];
    MHNavViewController *nav = [[MHNavViewController alloc] initWithRootViewController:login];
    
    [self.window.rootViewController presentViewController:nav animated:YES completion:^{
        
    }];
}

#pragma mark - TabbarToolViewDelegate
- (void)TabbarToolSelectIndex:(id)sender
{
    [mainViewController iconBtnAction:sender];
}

@end
