//
//  HelpView.h
//  testtest
//
//  Created by qupengbin on 14-5-15.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpView : UIView

- (void)reloadData:(int)index;

- (void)changeframePrcent:(float)prcent;

- (void)changeframeLastPrcent:(float)prcent;

- (void)startAnimation;

- (void)changeViewImage:(int)index;

- (void)startWhileAnimation;

- (void)stopAnimation;

@end
