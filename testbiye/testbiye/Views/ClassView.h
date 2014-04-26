//
//  ClassView.h
//  testbiye
//
//  Created by qupengbin on 14-4-22.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClassViewDelegate <NSObject>

- (void)classViewTapAction:(id)sender;

@end

//上方分类 分为(全部分类,综合商场,服饰鞋帽,便利商店 可能还要增加分类)
@interface ClassView : UIView
{
    int nowType;
    NSMutableArray *dataArr;
    UIScrollView *_scrollView;
}

@property(nonatomic,assign) id<ClassViewDelegate> delegate;

- (void)setClassType:(int)type;

@end
