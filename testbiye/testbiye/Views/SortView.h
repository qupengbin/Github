//
//  SortView.h
//  testbiye
//
//  Created by qupengbin on 14-5-13.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SortViewDelegate <NSObject>
@optional

- (void)sortViewDidSelect:(int)index;

@end

@interface SortView : UIView

@property(nonatomic,assign) id<SortViewDelegate> delegate;

@end
