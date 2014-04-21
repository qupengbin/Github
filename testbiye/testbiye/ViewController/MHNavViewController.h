//
//  MHNavViewController.h
//  PChat
//
//  Created by Jing Jiang-iMohooWork on 3/5/14.
//  Copyright (c) 2014  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"

/**
 *  通用NavController
 */
@interface MHNavViewController : UINavigationController<ICSDrawerControllerChild, ICSDrawerControllerPresenting>

@property (nonatomic,assign) BOOL canDragBack;
@property(nonatomic, weak) ICSDrawerController *drawer;

@end
