//
//  TwoModel.h
//  十日美文
//
//  Created by qianfeng on 16/3/20.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "JSONModel.h"

@interface TwoModel : JSONModel
@property(nonatomic,strong)NSString <Optional> * pid;
@property(nonatomic,strong)NSString <Optional> * type;
@property(nonatomic,strong)NSString <Optional> * title;
@property(nonatomic,strong)NSString <Optional> * summary;
@end

@interface TwoModel1 : JSONModel
@property(nonatomic,strong)NSString <Optional> * title;
@property(nonatomic,strong)NSString <Optional> * author;
@property(nonatomic,strong)NSString <Optional> * times;
@property(nonatomic,strong)NSString <Optional> * summary;
@property(nonatomic,strong)NSString <Optional> * text;
@end
