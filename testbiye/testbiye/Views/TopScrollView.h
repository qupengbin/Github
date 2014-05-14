//
//  TopScrollView.h
//  testbiye
//
//  Created by qupengbin on 14-4-21.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TopScrollViewDelegate <NSObject>

- (void)topScrollViewAction:(int)index;

@end

@interface TopScrollView : UIView

@property(nonatomic,assign) id<TopScrollViewDelegate> delegate;

- (void)reloadDataWithPictures:(NSArray *)picts infos:(NSArray *)infos;

@end
