//
//  MainViewCell.h
//  testbiye
//
//  Created by qupengbin on 14-4-17.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeleteBtnView.h"

@protocol MainViewCellDelegate <NSObject>
@optional

- (void)iconBtnAction:(id)sender;

@end

@interface MainViewCell : UITableViewCell
{
    UILabel *titleLab1;
    UILabel *titleLab2;
    UILabel *titleLab3;

    DeleteBtnView *iconBtn1;
    DeleteBtnView *iconBtn2;
    DeleteBtnView *iconBtn3;
    
    float height;
}
@property(nonatomic,assign) id<MainViewCellDelegate> delegate;

- (void)reloadData:(NSArray *)titleArr
              icon:(NSArray *)icon
             index:(int)index;

@end
