//
//  TimeClockViewController.h
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@protocol TimeClockDelegate <NSObject>

- (void)deleteTimeClock:(int)index;

@end

@interface TimeClockViewController : BaseViewController

@property(nonatomic,assign) id<TimeClockDelegate> delegate;
@property(nonatomic,assign) int index;

@end
