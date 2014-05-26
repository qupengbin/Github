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

- (void)maincellDelete:(int)tag;

@end

@interface MainViewCell : UITableViewCell<DeleteBtnViewDelegate>
{
    UILabel *titleLab1;
    UILabel *titleLab2;
    UILabel *titleLab3;

    DeleteBtnView *iconBtn1;
    DeleteBtnView *iconBtn2;
    DeleteBtnView *iconBtn3;
    
    UIButton *selbtn1;
    UIButton *selbtn2;
    UIButton *selbtn3;

    float height;
}
@property(nonatomic,assign) id<MainViewCellDelegate> delegate;

- (void)reloadData:(NSArray *)titleArr
              icon:(NSArray *)icon
               tag:(NSArray *)tag
             index:(int)index
              type:(int)type;

@end
