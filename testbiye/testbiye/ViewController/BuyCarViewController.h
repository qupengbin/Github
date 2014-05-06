//
//  BuyCarViewController.h
//  testbiye
//
//  Created by qupengbin on 14-5-5.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@protocol BuyCarViewDelegate <NSObject>
@optional

- (void)buyCarCommitAction:(id)sender;

@end

//购物车
@interface BuyCarView : UIView

@property(nonatomic,assign) id<BuyCarViewDelegate> delegate;

@end

//购物车
@interface BuyCarViewController : BaseViewController

@end
