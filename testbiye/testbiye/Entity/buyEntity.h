//
//  buyEntity.h
//  testbiye
//
//  Created by qupengbin on 14-4-22.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <Foundation/Foundation.h>

//购买界面数据结构
@interface buyEntity : NSObject

//地址
@property(nonatomic,strong) NSString *address;
//商场名称
@property(nonatomic,strong) NSString *name;
//评分
@property(nonatomic,strong) NSString *grade;
//距离
@property(nonatomic,strong) NSString *distance;
//个数
@property(nonatomic,strong) NSString *number;

@end
