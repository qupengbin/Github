//
//  ShareViewController.h
//  testbiye
//
//  Created by qu on 14-5-4.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShareViewDelegate <NSObject>
@optional

- (void)shareCancleAction;

@end

@interface ShareViewController : UIViewController

@property(nonatomic,assign) id<ShareViewDelegate> delegate;

@end
