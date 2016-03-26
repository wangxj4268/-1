//
//  TwoViewController.m
//  十日美文
//
//  Created by qianfeng on 16/3/20.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "TwoViewController.h"
#import "TwoModel.h"
#import "TwoCell.h"
#import "TwoViewController1.h"

@interface TwoViewController ()
{
    NSString *str;
}
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self addRefreshHasHeader:YES HasFooter:YES];
}
-(void)configUI{
    [super configUI];
    [self addTitle:@"十篇美文"];
}

-(void)loadData{
[[HttpManager shareManager]requestWith:WTwoUrl parameters:nil subBlock:^(id responseObject) {
    [_tableView.header endRefreshing];
    [_tableView.footer endRefreshing];
    [_dataArray removeAllObjects];      //必须写在这，防止上拉刷新的时候出现崩溃
    NSArray *arr=[TwoModel arrayOfModelsFromDictionaries:responseObject[@"result"] error:nil];
    [_dataArray addObjectsFromArray:arr];
    [_tableView reloadData];
    } failureBlock:^{
        [_tableView.header endRefreshing];
        [_tableView.footer endRefreshing];
        NSLog(@"🙅🙅🙅🙅🙅🙅🙅");
    }];
}

-(void)loadMore{
    [self loadData];
}

-(void)refresh{
    [self loadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ide=@"cell";
   TwoCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[TwoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ide];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.model=_dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TwoViewController1 *two=[[TwoViewController1 alloc]init];
    TwoModel *model=_dataArray[indexPath.row];
    two.data=model.pid;
    two.type=model.type;
    two.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:two animated:YES];
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
