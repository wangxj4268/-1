//
//  ThreeModel.h
//  十日美文
//
//  Created by qianfeng on 16/3/20.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "JSONModel.h"

@interface ThreeModel : JSONModel
@property(nonatomic,strong)NSString <Optional> * pid;
@property(nonatomic,strong)NSString <Optional> * image;
@property(nonatomic,strong)NSString <Optional> * title;
@property(nonatomic,strong)NSString <Optional> * type;
@end

@interface ThreeModel1 : JSONModel
@property(nonatomic,strong)NSString <Optional> * image1;
@property(nonatomic,strong)NSString <Optional> * title;
@property(nonatomic,strong)NSString <Optional> * authorbrief;
@property(nonatomic,strong)NSString <Optional> * text1;
@property(nonatomic,strong)NSString <Optional> * text2;
@end

