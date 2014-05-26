//
//  InPutView.h
//  testbiye
//
//  Created by qupengbin on 14-5-24.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InPutViewDelegate <NSObject>
@optional

- (void)beginInput;

- (void)endInput;

- (void)addFunction;

- (void)biaoqingFunction;

@end

@interface InPutView : UIView

@property(nonatomic,assign) id<InPutViewDelegate> delegate;

@end
