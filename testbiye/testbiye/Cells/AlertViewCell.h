//
//  AlertViewCell.h
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertViewCell : UITableViewCell

- (void)switchOnorOff:(BOOL)onoff;

- (void)reloadData:(NSString *)time title:(NSString *)title index:(int)index;

@end
