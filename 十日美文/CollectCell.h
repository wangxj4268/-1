//
//  CollectCell.h
//  十日美文
//
//  Created by qianfeng on 16/3/21.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entity.h"
@protocol CollectCellDelegate <NSObject>

-(void)deleteWithModel:(Entity *)model;

@end

@interface CollectCell : UICollectionViewCell



@property (nonatomic,assign)BOOL isEdit;
@property (nonatomic,strong)Entity *model;
@property (nonatomic,weak)id<CollectCellDelegate> delegate;

@end
