//
//  NearDetailCell.h
//  testbiye
//
//  Created by qu on 14-5-3.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NearDetailCell : UITableViewCell

- (void)reloadData:(NSArray *)imgs
             title:(NSArray *)title
             price:(NSArray *)price
             index:(int)index;

@end
