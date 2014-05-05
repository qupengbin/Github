//
//  BuyCarCell.h
//  testbiye
//
//  Created by qupengbin on 14-5-5.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BuyCarCellDelegate <NSObject>
@optional

- (void)buyCarBtnAction:(id)sender;

@end

@interface BuyCarCell : UITableViewCell

- (void)reloadData:(NSArray *)data index:(int)index;

@property(nonatomic,assign) id<BuyCarCellDelegate> delegate;

@end
