//
//  SortView.m
//  testbiye
//
//  Created by qupengbin on 14-5-13.
//  Copyright (c) 2014年 qupengbin. All rights reserved.
//

#import "SortView.h"

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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"SortViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"默认排序";
            cell.imageView.image = [UIImage imageNamed:@"buysorticon1.png"];
            break;
        case 1:
            cell.textLabel.text = @"按价格排序";
            cell.imageView.image = [UIImage imageNamed:@"buysorticon2.png"];
            break;
        case 2:
            cell.textLabel.text = @"按距离排序";
            cell.imageView.image = [UIImage imageNamed:@"buysorticon3.png"];
            break;
        case 3:
            cell.textLabel.text = @"按人气排序";
            cell.imageView.image = [UIImage imageNamed:@"buysorticon4.png"];
            break;

        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sortViewDidSelect:)]) {
        [self.delegate sortViewDidSelect:indexPath.row];
    }
}

@end
