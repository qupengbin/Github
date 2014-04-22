//
//  BuyViewController.h
//  testbiye
//
//  Created by qupengbin on 14-4-16.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

typedef enum {
    BuyClassType_alls = 0,
    BuyClassType_shops,
    BuyClassType_clothing,
    BuyClassType_supermarket
}BuyClassType;

@interface BuyViewController : BaseViewController

@property(nonatomic,assign) BuyClassType type;

@end
