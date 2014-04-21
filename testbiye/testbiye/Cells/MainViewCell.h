//
//  MainViewCell.h
//  testbiye
//
//  Created by qupengbin on 14-4-17.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainViewCellDelegate <NSObject>
@optional

- (void)iconBtnAction:(id)sender;

@end

@interface MainViewCell : UITableViewCell
{
    UILabel *titleLab1;
    UILabel *titleLab2;
    UILabel *titleLab3;

    UIButton *iconBtn1;
    UIButton *iconBtn2;
    UIButton *iconBtn3;
    
    float height;
}
@property(nonatomic,assign) id<MainViewCellDelegate> delegate;

- (void)reloadData:(NSArray *)titleArr
             index:(int)index;

@end
