//
//  NearDetailViewController.h
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

typedef enum {
    detailViewType_today = 0,
    detailViewType_hotsell,
    detailViewType_hot,
    detailViewType_miaosha,
    detailViewType_shenhuo
}detailViewType;

@interface NearDetailViewController : BaseViewController

@property(nonatomic,assign) detailViewType type;

@end
