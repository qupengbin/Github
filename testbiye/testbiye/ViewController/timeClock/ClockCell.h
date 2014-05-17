//
//  ClockCell.h
//  testbiye
//
//  Created by qupengbin on 14-5-17.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClockCell : UITableViewCell

- (void)reloadData:(NSString *)time
           address:(NSString *)address
          editbool:(BOOL)editbool;

@end
