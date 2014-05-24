//
//  StatisCell.h
//  testbiye
//
//  Created by qupengbin on 14-5-8.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatisIconView : UIView

@end

@interface StatisCell : UITableViewCell

- (void)reloadData:(NSArray *)data
             index:(int)index
              type:(int)type;

@end
