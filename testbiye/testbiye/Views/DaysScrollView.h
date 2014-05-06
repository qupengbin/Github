//
//  DaysScrollView.h
//  testbiye
//
//  Created by qupengbin on 14-5-6.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DayButtonDelegate <NSObject>
@optional

- (void)dayBtnAction:(id)sender;

@end

@interface DayButton : UIView

@property(nonatomic,assign) id<DayButtonDelegate> delegate;

@end


@interface DaysScrollView : UIView

@end
