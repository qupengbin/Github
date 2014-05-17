//
//  SortView.m
//  testbiye
//
//  Created by qupengbin on 14-5-13.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "SortView.h"
#import "MenuCell.h"

@interface SortView()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tabView;
}

@end

@implementation SortView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initview];
    }
    return self;
}

- (void)initview
{
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0.5f, self.bounds.size.height)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
    
    _tabView = [[UITableView alloc] initWithFrame:CGRectMake(1, 0, self.bounds.size.width-1, self.bounds.size.height) style:UITableViewStylePlain];
    _tabView.delegate = self;
    _tabView.dataSource = self;
    _tabView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_tabView];
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"SortViewCell";
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[MenuCell alloc] initWithStyle:UITableViewCellStyleDefault
                               reuseIdentifier:string];
    }
    NSString *icon = nil;
    NSString *title = nil;
    switch (indexPath.row) {
        case 0:
            icon = @"buysorticon1.png";
            title = @"默认排序";
            break;
        case 1:
            icon = @"buysorticon2.png";
            title = @"按价格排序";
            break;
        case 2:
            icon = @"buysorticon3.png";
            title = @"按距离排序";
            break;
        case 3:
            icon = @"buysorticon4.png";
            title = @"按人气排序";
            break;

        default:
            break;
    }
    [cell reloadData:icon title:title];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sortViewDidSelect:)]) {
        [self.delegate sortViewDidSelect:indexPath.row];
    }
}

@end
