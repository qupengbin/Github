//
//  CycleScrollView.h
//  CycleScrollDemo
//
//  Created by Weever Lu on 12-6-14.
//  Copyright (c) 2012年 linkcity. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    CycleDirectionPortait,          // 垂直滚动
    CycleDirectionLandscape         // 水平滚动
}CycleDirection;

@protocol CycleScrollViewDelegate;





@interface CycleScrollView : UIView <UIScrollViewDelegate> 
{
    
    UIScrollView *scrollView;
    UIImageView *curImageView;
    
    UIImageView *buttomImageView;//顶板部透明栏
    UILabel     *titleLabel;//透明栏里的文字
    NSArray *titlesArr;
    
    int totalPage;  
    int curPage;
    CGRect scrollFrame;
    
    CycleDirection scrollDirection;     // scrollView滚动的方向
    NSArray *imagesArray;               // 存放所有需要滚动的图片 UIImage
    NSMutableArray *curImages;          // 存放当前滚动的三张图片
    
    id delegate;
    
    NSTimer *autoScrollTimer;

    NSMutableDictionary *mutlDict;
}

@property (nonatomic, assign) id delegate;

- (int)validPageValue:(NSInteger)value;
- (id)initWithFrame:(CGRect)frame cycleDirection:(CycleDirection)direction imgNews:(NSArray *)imgNews titleNews:(NSArray *)titleNews;
- (id)initWithFrame:(CGRect)frame cycleDirection:(CycleDirection)direction pictures:(NSArray *)pictureArray titles:(NSArray *)titlesArray;
- (NSArray *)getDisplayImagesWithCurpage:(int)page;
- (void)refreshScrollView;

- (void)startTimer;

- (void)cleanUpTimerAndCache;

//隐藏商场界面里的透明栏
- (void)hiddleTitleLabel;

@end









@protocol CycleScrollViewDelegate <NSObject>

 @optional
- (void)cycleScrollViewDelegate:(CycleScrollView *)cycleScrollView didSelectImageView:(int)index;
- (void)cycleScrollViewDelegate:(CycleScrollView *)cycleScrollView didScrollImageView:(int)index;

@end