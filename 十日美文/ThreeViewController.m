//
//  ThreeViewController.m
//  十日美文
//
//  Created by qianfeng on 16/3/20.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "ThreeViewController.h"
#import "ThreeCell.h"
#import "ThreeModel.h"
#import "ThreeViewController1.h"
@interface ThreeViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_dataArray;
    UICollectionView *_collectionView;
}
@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self loadData];
    _dataArray=[[NSMutableArray alloc]init];
     [self addTitle:@"十篇美图"];
    
    [self addRefreshHasHeader:YES HasFooter:YES];
}

-(void)configUI{
    self.automaticallyAdjustsScrollViewInsets=NO;
    //[self addLabel:@"ten4.png" withLocaion:KLeftBar];
    UICollectionViewFlowLayout *flow=[[UICollectionViewFlowLayout alloc]init];
    flow.scrollDirection=UICollectionViewScrollPositionCenteredVertically;
    flow.minimumInteritemSpacing=10;
    flow.minimumLineSpacing=10;
    flow.itemSize=CGSizeMake((KWidth-30)/2, (KHeight-64-49-30)/2);
    flow.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, KWidth, KHeight-64-49) collectionViewLayout:flow];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.backgroundColor=[UIColor whiteColor];
    [_collectionView registerClass:[ThreeCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
}

-(void)loadData{
[[HttpManager shareManager]requestWith:WThreeUrl parameters:nil subBlock:^(id responseObject) {
    [_collectionView.header endRefreshing];
    [_collectionView.footer endRefreshing];
    [_dataArray removeAllObjects];
        NSArray *arr=[NSArray arrayWithObject:responseObject[@"result"]];
        NSArray *array=[ThreeModel arrayOfModelsFromDictionaries:arr error:nil];
        [_dataArray addObjectsFromArray:array];
        [_collectionView reloadData];
    } failureBlock:^{
        [_collectionView.header endRefreshing];
        [_collectionView.footer endRefreshing];
        NSLog(@"🙅🙅🙅🙅🙅🙅🙅🙅");
    }];
}
-(void)addRefreshHasHeader:(BOOL)hasHeader HasFooter:(BOOL)hasFooter{
    if (hasHeader) {
        _collectionView.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
        [_collectionView.header beginRefreshing];
    }
    if (hasFooter) {
        _collectionView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    }
}

-(void)loadMore{
    [self loadData];
}

-(void)refresh{
    [self loadData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ide=@"cell";
    ThreeCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ide forIndexPath:indexPath];
    cell.backgroundColor=[UIColor grayColor];
    cell.model=_dataArray[indexPath.item];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ThreeViewController1 *three=[[ThreeViewController1 alloc]init];
    ThreeModel *model=_dataArray[indexPath.item];
    three.data=model.pid;
    three.type=model.type;
    three.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:three animated:YES];
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
