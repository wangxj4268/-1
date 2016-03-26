//
//  FourViewController1.m
//  十日美文
//
//  Created by qianfeng on 16/3/18.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "FourViewController1.h"
#import "MagicalRecord.h"
#import "Entity.h"
#import "CollectCell.h"
#import "OneViewController2.h"
#import "TwoViewController1.h"
#import "ThreeViewController1.h"
@interface FourViewController1 ()

@end

@implementation FourViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray=[[NSMutableArray alloc]init];
    [self configUI];
    [self loadData];
}
-(void)configUI{
    [self addTitle:@"我的收藏"];
    [self addBtnWithTitle:@"" withBgImageName:@"navBackBtn_hl@2x" withLocation:KLeftBar];
    [self addBtnWithTitle:@"编辑" withBgImageName:@"c1.png" withLocation:KRightBar];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing=20;
    flowLayout.minimumInteritemSpacing=20;
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0,-64,KWidth,KHeight+64) collectionViewLayout:flowLayout];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"n4"]];
    [_collectionView registerClass:[CollectCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
}

-(void)leftClick:(UIButton *)btn{
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

-(void)rightClick:(UIButton *)btn{
    [btn setTitle:@"取消编辑" forState:UIControlStateSelected];
    btn.selected=self.editing;
    self.editing=!self.editing;
    btn.selected=self.editing;
    [_collectionView reloadData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(KWidth/2-20, 180);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(120, 10, 10, 10);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"cell";
    CollectCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.delegate=self;
    cell.isEdit=self.editing;
    //cell.backgroundColor=[UIColor greenColor];
    cell.model=_dataArray[indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Entity *model=_dataArray[indexPath.item];
    //根据收藏的类型判断返回的界面
    if ([model.type isEqualToString:@"1"]) {
        OneViewController2 *vc=[[OneViewController2 alloc]init];
        vc.data=[_dataArray[indexPath.row] pid];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([model.type isEqualToString:@"2"]){
        TwoViewController1 *vc=[[TwoViewController1 alloc]init];
        vc.data=[_dataArray[indexPath.row] pid];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([model.type isEqualToString:@"3"]){
        ThreeViewController1 *vc=[[ThreeViewController1 alloc]init];
        vc.data=[_dataArray[indexPath.row] pid];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark Data相关
-(void)loadData{
    _dataArray=[[Entity MR_findAll] mutableCopy];
    [_collectionView reloadData];
}
#pragma mark CollectCellDelegate
-(void)deleteWithModel:(Entity *)model{
    NSLog(@"%@",model.pid);
    //从数据库删除
    [model MR_deleteEntity];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    //拿到model的位置
    NSInteger num=[_dataArray indexOfObject:model];
    //从数组中删除
    [_dataArray removeObject:model];
    //从_collectionView删除cell
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:num inSection:0];
    [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
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
