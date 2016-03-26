//
//  OneViewController.m
//  十日美文
//
//  Created by qianfeng on 16/3/19.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "OneViewController.h"
#import "OneModel.h"
#import "OneCell.h"
#import "OneViewController2.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self showText:@"正在加载"];
    [self loadData];
    [self addRefreshHasHeader:YES HasFooter:YES];
}
-(void)configUI{
    [super configUI];
    [self addTitle:@"十篇影评"];
}

-(void)loadData{
[[HttpManager shareManager]requestWith:WOneUrl parameters:nil subBlock:^(id responseObject) {
    [_tableView.header endRefreshing];
    [_tableView.footer endRefreshing];
    [_dataArray removeAllObjects];
    NSArray *arr=[OneModel arrayOfModelsFromDictionaries:responseObject[@"result"] error:nil];
    [_dataArray addObjectsFromArray:arr];
    [_tableView reloadData];
    
  } failureBlock:^{
    [_tableView.header endRefreshing];
    [_tableView.footer endRefreshing];
    NSLog(@"🙅🙅🙅🙅🙅🙅🙅🙅🙅");
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
    OneCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[OneCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ide];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.model=_dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OneViewController2 *one=[[OneViewController2 alloc]init];
    OneModel *model=_dataArray[indexPath.row];
    one.hidesBottomBarWhenPushed=YES;
    one.data=model.pid;
    one.type=model.type;
    [self.navigationController pushViewController:one animated:YES];
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
