//
//  NextViewController.m
//  十日美文
//
//  Created by qianfeng on 16/3/19.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray=[NSMutableArray new];
    [self configUI];
   // [UIScreen mainScreen].bounds.size.height
   // [UIScreen mainScreen].bounds.size.width
}

-(void)configUI{
    self.automaticallyAdjustsScrollViewInsets=NO;
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64,KWidth, KHeight-64-49) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}
-(void)addRefreshHasHeader:(BOOL)hasHeader HasFooter:(BOOL)hasFooter{
    if (hasHeader) {
        _tableView.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
        [_tableView.header beginRefreshing];
    }
    if (hasFooter) {
        _tableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    }
}

-(void)loadMore{
    NSLog(@"子类需要重写loadMore");
}

-(void)refresh{
    NSLog(@"子类需要重写refresh");
}



#pragma mark tableView的代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"子类需要重写numberOfRowsInSection");
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"子类需要重写返回cell的方法");
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
