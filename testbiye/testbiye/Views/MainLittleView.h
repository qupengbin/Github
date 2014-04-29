//
//  MainLittleView.h
//  testbiye
//
//  Created by qu on 14-4-29.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainLittleViewDelegate <NSObject>

- (void)MainLittleAction:(int)tag;

@end

@interface MainLittleView : UIView

@property(nonatomic,assign) id<MainLittleViewDelegate> delegate;

@end
