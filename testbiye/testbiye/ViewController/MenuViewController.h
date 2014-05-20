//
//  MenuViewController.h
//  testbiye
//
//  Created by qupengbin on 14-4-17.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"

@protocol MenuViewControllerDelegate <NSObject>

- (void)tableviewSelect:(int)index;

- (void)loginOrRegistAction;

@end

@interface MenuViewController : UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting>

@property(nonatomic,assign) id<MenuViewControllerDelegate> delegate;
@property(nonatomic,weak) ICSDrawerController *drawer;
@property(nonatomic,weak) IBOutlet UITableView *tableView;

@end
