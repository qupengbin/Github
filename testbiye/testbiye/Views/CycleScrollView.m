//
//  CycleScrollView.m
//  CycleScrollDemo
//
//  Created by Weever Lu on 12-6-14.
//  Copyright (c) 2012年 linkcity. All rights reserved.
//

#import "CycleScrollView.h"
#import "MHImageView.h"

@implementation CycleScrollView
@synthesize delegate;


- (void)dealloc
{
    [scrollView release];
    [curImageView release];
    [imagesArray release];
    [curImages release];

    autoScrollTimer = nil;
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame cycleDirection:(CycleDirection)direction imgNews:(NSArray *)imgNews titleNews:(NSArray *)titleNews
{
        //基于OC是运行时判断对象类型, 所以这里直接将NewsEntity数组对象当成ImgUrl数组对象传入
    return [self initWithFrame:frame cycleDirection:direction pictures:imgNews titles:titleNews];
}

- (id)initWithFrame:(CGRect)frame cycleDirection:(CycleDirection)direction pictures:(NSArray *)pictureArray titles:(NSArray *)titlesArray
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
        scrollFrame = frame;
        scrollDirection = direction;
        totalPage = pictureArray.count;
        curPage = 1;                                    // 显示的是图片数组里的第一张图片
        curImages = [[NSMutableArray alloc] init];
        imagesArray = [[NSArray alloc] initWithArray:pictureArray];
        
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        scrollView.backgroundColor = [UIColor clearColor];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        [self addSubview:scrollView];
        
        //添加资讯透明图片
        buttomImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 125, frame.size.width,25)];
        buttomImageView.backgroundColor = [UIColor clearColor];
        buttomImageView.image = [UIImage imageNamed:@"touming.png"];
        [self addSubview:buttomImageView];
        
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 125, 320,25)];
        titlesArr = [[NSArray alloc] initWithArray:titlesArray];
        titleLabel.text = [titlesArray objectAtIndex:0];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:14];;
        titleLabel.frame = CGRectMake(0, 125, 320,25);
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor whiteColor];
        
        [self addSubview:titleLabel];
        
        // 在水平方向滚动
        if(scrollDirection == CycleDirectionLandscape) 
        {
            scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 3,
                                                scrollView.frame.size.height);
        }
        // 在垂直方向滚动 
        if(scrollDirection == CycleDirectionPortait) 
        {
            scrollView.contentSize = CGSizeMake(scrollView.frame.size.width,
                                                scrollView.frame.size.height * 3);
        }

        [self startTimer];
        [self refreshScrollView];
    }
    
    return self;
}

- (void)hiddleTitleLabel
{
    buttomImageView.hidden = YES;
    titleLabel.hidden = YES;
}

//咨询焦点图播放速度
- (void)startTimer
{
    [self refreshScrollView];
    if (imagesArray && [imagesArray count] > 1)
    {
        autoScrollTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(autoScrollAd:) userInfo:nil repeats:YES];
    }
}


- (void)cleanUpTimerAndCache
{
    if ([autoScrollTimer isValid])
    {
        [autoScrollTimer invalidate];
        autoScrollTimer = nil;
    }
    for (UIView *v in scrollView.subviews)
    {
        [v removeFromSuperview];
    }
}

- (void)refreshScrollView 
{
    if (!imagesArray || [imagesArray count] < 1)
        return;
    

    [self getDisplayImagesWithCurpage:curPage];
    
    //让透明横栏上的文字与图片同步
    if (titlesArr && curPage <= titlesArr.count) {
        titleLabel.text = [titlesArr objectAtIndex:curPage-1];
    }
    
    for (int i = 0; i < [curImages count]; i++)
    {
        NSAutoreleasePool *pool = [NSAutoreleasePool new];
        NSString  *hotImgUrl = [curImages objectAtIndex:i];
        if (hotImgUrl.length < 1)
        {
            continue;
        }
        UIView *subBgView = [[UIView alloc] initWithFrame:CGRectMake(320*i, 0, scrollFrame.size.width, scrollFrame.size.height)];
        subBgView.backgroundColor   = [UIColor whiteColor];

        MHImageView *imageView   = [[MHImageView alloc] initWithFrame:CGRectMake(0, 0, scrollFrame.size.width, scrollFrame.size.height)];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.userInteractionEnabled = YES;
        imageView.contentMode       = UIViewContentModeScaleToFill;
        imageView.image = [UIImage imageNamed:hotImgUrl];
        [subBgView addSubview:imageView];
        [imageView release];

        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(handleTap:)];
        [subBgView addGestureRecognizer:singleTap];
        [singleTap release];
        [scrollView addSubview:subBgView];
        [subBgView release];

        [pool drain];
    }
}

- (NSArray *)getDisplayImagesWithCurpage:(int)page
{
    if(!imagesArray || [imagesArray count] == 0)
        return nil;
    
    int pre = [self validPageValue:curPage-1];
    int last = [self validPageValue:curPage+1];
    
    if([curImages count] != 0) [curImages removeAllObjects];
    
    [curImages addObject:[imagesArray objectAtIndex:pre-1]];
    [curImages addObject:[imagesArray objectAtIndex:curPage-1]];
    [curImages addObject:[imagesArray objectAtIndex:last-1]];
    
  
    
    return curImages;
}



- (int)validPageValue:(NSInteger)value
{
    if(value == 0) value = totalPage;                   // value＝1为第一张，value = 0为前面一张
    if(value == totalPage + 1) value = 1;
    
    return value;
}


- (void)scrollViewDidScroll:(UIScrollView *)aScrollView 
{
    int x = aScrollView.contentOffset.x;
    int y = aScrollView.contentOffset.y;
        //NSLog(@"did  x=%d  y=%d", x, y);
    
    // 水平滚动
    if(scrollDirection == CycleDirectionLandscape) 
    {
        // 往下翻一张
        if(x >= (2*scrollFrame.size.width)) 
        { 
            curPage = [self validPageValue:curPage+1];
            
//            [self refreshScrollView];
        }
        
        if(x <= 0) 
        {
            curPage = [self validPageValue:curPage-1];

//            [self refreshScrollView];
        }
    }
    
    // 垂直滚动
    if(scrollDirection == CycleDirectionPortait) 
    {
        // 往下翻一张
        if(y >= 2 * (scrollFrame.size.height))
        { 
            curPage = [self validPageValue:curPage+1];

//            [self refreshScrollView];
        }
        
        if(y <= 0) 
        {
            curPage = [self validPageValue:curPage-1];

//            [self refreshScrollView];
        }
    }

    if ([delegate respondsToSelector:@selector(cycleScrollViewDelegate:didScrollImageView:)]) 
    {
        [delegate cycleScrollViewDelegate:self didScrollImageView:curPage];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)aScrollView 
{
    if (scrollDirection == CycleDirectionLandscape) 
    {
//        [scrollView setContentOffset:CGPointMake(scrollFrame.size.width, 0) animated:YES];
    }
    
    if (scrollDirection == CycleDirectionPortait) 
    {
//        [scrollView setContentOffset:CGPointMake(0, scrollFrame.size.height) animated:YES];
    }
}

- (void)handleTap:(UITapGestureRecognizer *)tap
{
    if ([delegate respondsToSelector:@selector(cycleScrollViewDelegate:didSelectImageView:)])
    {
        [delegate cycleScrollViewDelegate:self didSelectImageView:curPage];
    }
}

- (void)autoScrollAd:(NSTimer *)timer
{
    if (scrollDirection == CycleDirectionLandscape)
    {
        curPage = curPage+1;
        if (curPage > totalPage-1) {
            curPage = 0;
        }
        [scrollView scrollRectToVisible:CGRectMake(curPage * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height) animated:YES];
    }
    
    if (scrollDirection == CycleDirectionPortait)
    {
        [scrollView scrollRectToVisible:CGRectMake(0, 2 * self.frame.size.height, self.frame.size.width, self.frame.size.height) animated:YES];
    }
}

@end
