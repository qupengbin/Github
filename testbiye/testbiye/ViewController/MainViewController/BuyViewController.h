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
    BuyClassType_alls = 0,      //全部分类
    BuyClassType_shops,         //综合商场
    BuyClassType_clothing,      //服饰鞋帽
    BuyClassType_supermarket,   //便利超市
    BuyClassType_food,          //食品茶酒
    BuyClassType_makeup,        //化妆品
    BuyClassType_furniture,     //家具家居
    BuyClassType_IT,            //数码家电
    BuyClassType_jewel,         //珠宝饰品
    BuyClassType_book,          //书店
    BuyClassType_glass,         //眼镜店
    BuyClassType_drugstore,     //药店
    BuyClassType_flower,        //鲜花店
    BuyClassType_culture,       //文化用品
    BuyClassType_more,          //更多
}BuyClassType;

@interface BuyViewController : BaseViewController

@property(nonatomic,assign) BuyClassType type;

- (void)setBuyType:(int)type;

@end
