//
//  NextViewController.h
//  十日美文
//
//  Created by qianfeng on 16/3/19.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "RootViewController.h"

@interface NextViewController : RootViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}

-(void)addRefreshHasHeader:(BOOL)hasHeader HasFooter:(BOOL)hasFooter;
-(void)loadMore;
-(void)refresh;
@end
