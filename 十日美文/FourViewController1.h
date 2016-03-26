//
//  FourViewController1.h
//  十日美文
//
//  Created by qianfeng on 16/3/18.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "RootViewController.h"

@interface FourViewController1 : RootViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

{
    UICollectionView *_collectionView;
    NSMutableArray *_dataArray;
}
@end
